// var A: domain(int);     // a domain (set) whose indices are integers
// var C: domain(real);    // a domain (set) whose indices are reals

var days: domain(string);  // a domain (set) whose indices are strings
var maxTemp: [days] real;  // array of reals

days += 'Mon';         // add a domain index
days += 'Tue';         // another
days.add('Wed');       // another
maxTemp['Mon'] = 25;   // add an array value

writeln('domain = ', days);
writeln('maxTemp = ', maxTemp);

var week = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri',
	    'Sat', 'Sun'};     // an associative domain is also a set!

// for i in week do   // associative domain elements will be printed in no specific order
//   writeln(i, ' ', days.member(i));
// writeln('---');
// for i in week.sorted() do
//   writeln(i, ' ', days.member(i));

// writeln({10,10}); // this 1D domain has only one element
