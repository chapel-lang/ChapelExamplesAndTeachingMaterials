use BlockDist;

config const n = 5;
const D = {1..n, 1..n} dmapped Block({1..n, 1..n});  // distributed dense index set
var SD: sparse subdomain(D);          // distributed sparse subset, initially empty
var A: [SD] int;                      // distributed sparse array

for i in 1..n do {   // populate the sparse index set
  SD += (i,i);       // main diagonal
  SD += (1,i);       // first row
  SD += (i,n);       // last column
 }

// assign the sparse array elements in parallel
forall a in A do
  a = here.id + 1;

// print a dense view of the array
writeln('A =');
for i in 1..n {
  for j in 1..n do
    write(A[i,j], " ");
  writeln();
}

// use LinearAlgebra;

// const mesh = {1..n, 1..n};
// var C: [mesh] real;
// C = 1;

// writeln(C.dot(C));

// writeln('B =');
// for i in 1..n {
//   for j in 1..n do
//     write(B[i,j], " ");
//   writeln();
// }
