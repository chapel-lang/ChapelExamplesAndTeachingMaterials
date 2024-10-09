use HashedDist;

var D: domain(string) dmapped Hashed(idxType=string);   // a distributed associative
D += 'hello';                                           // ... domain (set) of strings
for i in 1..10 do
  D += '%02i'.format(i);
writeln(D);

var A: [D] int; // a distributed associative int array
forall a in A do
  a = a.locale.id + 1;

for i in 1..numLocales {
  write('node ', i, ': ');
  forall (key, value) in zip(D, A) {
    if value == i then write(key, ' ');
  }
  writeln();
}

// writeln(ascii('hello'));  // ascii() returns decimal ASCII code of the first character of the string
