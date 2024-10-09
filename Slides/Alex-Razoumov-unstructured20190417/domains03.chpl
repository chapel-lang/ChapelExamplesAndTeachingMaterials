use BlockDist;
config const n = 5;
const mesh: domain(2) = {1..n, 1..n};
const distrib: domain(2) dmapped Block(boundingBox=mesh) = mesh;

var A: [distrib] string;
forall a in A do
  a = '%i'.format(a.locale.id+1) + '-' + here.name[1..5] + '  ';

writeln(A);
