var people: domain(opaque);   // opaque domain, its indices have no values
var name: [people] string;    // array on top of this domain
var connection: [people] index(people);    // another array on top of it

for i in 1..5 {
  var newPerson = people.create(); // inferred to be of type index(people)
  name[newPerson] = 'name%i'.format(i);
}
use Random;
var myRandNums = makeRandomStream(real, seed=314159265, algorithm=RNG.NPB);
for i in people do
  for j in people do
    if i != j && myRandNums.getNext() > 0.5 && connection[i] == nil then
      connection[i] = j;

for person in people do   // no particular order
  writeln(name[person], ' -> ', name[connection[person]]);
