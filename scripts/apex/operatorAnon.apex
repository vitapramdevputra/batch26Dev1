integer a = 15;
integer b = 25;
integer c = 18;

boolean x = (a > b) || (b < c) || (c > a);
system.debug('x => ' + x );

boolean x2 = x && (b > c) ;
system.debug('x2 => ' + x2);

boolean x3 = !(a == 0);
system.debug('x3 => ' + x3);

string s1;

boolean x4 = !string.isEmpty(s1); //false
system.debug('x4 => ' + x4);


integer i = 15;
i += 15; //i = i + 15;
system.debug('i => ' + i);
i += 10;
system.debug('i => ' + i);

i -= 50; 
system.debug('i -50 => ' + i);


string s2 = 'Hello ';
s2 += ', Hello';


system.debug(s2.containsIgnoreCase('hello'));

if(s2.containsIgnoreCase('hello')){
    system.debug(s2);
}


string s3 = '15';
s3 += '10';
system.debug(s3);