config const n = 5;
var mesh: domain(2) = {1..n, 1..n};
var A: [mesh] string;

for m in mesh do
  A[m] = '' + m[1] + m[2];

writeln(A);
