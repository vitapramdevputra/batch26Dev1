StringDemo s = new StringDemo();
s.method1();



string x = 'some value.';
integer xLen = x.length();
system.debug(xLen);
system.debug(x.length());

string xUp = x.toUpperCase();
system.debug('x => ' + x);
system.debug('xUp => ' + xUp);


system.debug('check1 ' + x.contains('some '));
system.debug('check2 ' + x.contains('Some '));
system.debug('check3 ' + x.containsIgnoreCase('Some Value'));