CalculatorProgram cp = new CalculatorProgram();
cp.calc();


Calculator c = new Calculator();
system.debug('5.5, 99.5 => ' + c.add(5.5,99.5));

integer s1 =  c.add(15, 65);
c.add(15, 65); //this will work. But what is the result?
system.debug('sum of 15 and 65 => ' + s1);

integer s2 = c.add(15,25,45);
system.debug('s2 => ' + s2);

string s3 = c.add('are you ', 'following?');
system.debug('s3 => ' + s3);