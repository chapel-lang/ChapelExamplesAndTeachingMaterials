config const n = 5;
var tenIndices: domain(1) = {1..10};
var mesh: domain(2) = {1..n, 1..n};
var thirdDim: range = 1..16;
var threeDimensions: domain(3) = {thirdDim, 1..10, 5..10};

for m in mesh do
  write(m, ' ');
writeln();
