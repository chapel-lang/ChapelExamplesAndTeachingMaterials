config var n = 5;
const mesh = {1..n, 1..n};        // 2D rectangular domain
var SD: sparse subdomain(mesh);   // initially an empty subset of `mesh` indices
var A: [SD] real;                 // sparse real array on top of the sparse domain

writeln("Initially, SD = ", SD);
writeln("Initially, A = ", A);

proc writeSparseArr() {
  writeln("A in dense representation:");
  for (i,j) in mesh {
    write(A(i,j), "  ");
    if j == n then writeln();
  }
  writeln();
}

writeSparseArr();

A.IRV = 1e-3;   // change the default Implicitly Replicated Value

SD += (1,n);    // add corners to the sparse domain
SD += (n,n);
SD.add((1,1));  // alternative syntax
SD += (n,1);

A[1,1] = 100;

writeln("With corners, SD = ", SD);
writeln("With corners, A = ", A);

writeSparseArr();

for (i,j) in mesh {
  if SD.member(i,j) then
    write("* "); //   (i,j) is a member in the sparse index set
  else
    write(". "); //   (i,j) is not a member in the sparse index set
  if (j == n) then writeln();
}

var sparseSum = + reduce A;
writeln("sparse elements sum = ", sparseSum);

var denseSum = + reduce [ij in mesh] A(ij);
writeln("dense elements sum = ", denseSum);

SD.clear();       // empty the sparse index set (the domain and all its arrays)
A.IRV = 0.0;      // reset the Implicitly Replicated Value

for i in 1..n do
  SD += (i,i);    // add the main diagonal to the sparse domain

[(i,j) in SD] A(i,j) = i + j;

writeln("Now, SD = ", SD);
writeln("Now, A = ", A);
writeSparseArr();

iter antiDiag(n) {
  for i in 1..n do
    yield (i, n-i+1);
}

SD = antiDiag(n);

[(i,j) in SD] A(i,j) = i + j;

writeln("`antiDiag` SD = ", SD);
writeln("`antiDiag` A = ", A);
writeSparseArr();
