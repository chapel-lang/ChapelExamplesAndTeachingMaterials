use HashedDist;

record vertexMapper {
  proc this(idx:string, targetLocs: [?D] locale) : D.idxType {
    const numLocales = targetLocs.domain.size;
    return (idx:int) % numLocales;   // vertex number % number of locales
  }
}

record edgeMapper {
  proc this(idx:string, targetLocs: [?D] locale) : D.idxType {
    const numLocales = targetLocs.domain.size;
    return (idx[1..3]:int) % numLocales;   // # of the first vertex in an edge % number of locales
  }
}

var vertices: domain(string) dmapped Hashed(idxType=string, mapper=new vertexMapper());
var edges: domain(string) dmapped Hashed(idxType=string, mapper=new edgeMapper());
var degree: [vertices] int, weight: [vertices] real;   // two arrays for each vertex
var from, to: [edges] index(vertices);                 // for each edge two vertices

use Random;
var myRandNums = makeRandomStream(real, seed=314159265, algorithm=RNG.NPB);

config const numVertices = 8;   // allocate vertices, assign them names and random weights
for i in 1..numVertices {
  var thisVertex = '%03i'.format(i);
  vertices += thisVertex;
  weight[thisVertex] = myRandNums.getNext();
}

for i in vertices do   // iterate over all pairs of vertices
  for j in vertices do
    if (myRandNums.getNext() > 0.5 && i != j) { // new directional edge
      var thisEdge = i + '-' + j;
      edges += thisEdge;
      degree[i] += 1;         degree[j] += 1;
      from[thisEdge] = i;     to[thisEdge] = j;
    }

writeln(numVertices, ' vertices: ', vertices);
writeln(edges.shape[1], ' edges: ', edges);








// var vertexLocation: [vertices] int; // a distributed associative int array (map from string)
// var edgeLocation: [edges] int; // a distributed associative int array (map from string)

// ... vertexLocation[thisVertex] = vertexLocation[thisVertex].locale.id + 1;

// ... edgeLocation[thisEdge] = edgeLocation[thisEdge].locale.id + 1;


// for vertex in vertices do
//   writeln('vertex ', vertex, ' weighs ', weight[vertex], ' and has ', degree[vertex], ' connections',
// 	  ', stored on locale ', vertexLocation[vertex]);

//writeln(edges);
//writeln(isIrregularDom(edges));

// for edge in edges do
//   writeln('edge ', edge, ' from ', from[edge], ' to ', to[edge], ', stored on locale ', edgeLocation[edge]);







// use HashedDist;

// record customMapper {
//   proc this(idx:string, targetLocs: [?D] locale) : D.idxType {
//     const numLocales = targetLocs.domain.size;
//     // use the first digit of the string to choose the destination locale
//     var byte: int = ascii(idx);
//     return byte % numLocales;
//   }
// }

// var D: domain(string) dmapped Hashed(idxType=string, mapper=new customMapper());
// //var D: domain(string) dmapped Hashed(idxType=string); // a distributed associative domain (set) of strings
// //D += 'one';
// //D += 'two';
// for i in 1..10 do
//   D += '%02i'.format(i);
// writeln(D);

// var A: [D] int; // a distributed associative int array (map from string)
// forall a in A do
//   a = a.locale.id + 1;

// for i in 1..numLocales {
//   write('node ', i, ': ');
//   forall (key, value) in zip(D, A) {
//     if value == i then write(key, ' ');
//   }
//   writeln();
// }

// // writeln(ascii('hello'));  // ascii() returns decimal ASCII code of the first character of the string
