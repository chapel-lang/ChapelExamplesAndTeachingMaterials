use HashedDist;
var vertices, edges: domain(string) dmapped Hashed(idxType=string);
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
