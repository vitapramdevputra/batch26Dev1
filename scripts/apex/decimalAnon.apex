Decimal d1 = 10.0/3;
system.debug(d1);
decimal d2 = d1.setScale(2);
system.debug(d2);

Decimal d3 = 87.3355445617987;
system.debug(d3.setScale(2));
system.debug(d3.setScale(3));

Decimal d4 = 44.55;
string s4 = d4.toPlainString(); //converts decimal to string

String s5 = '87.3355445617987';
//convert string to decimal. Is it even possible? Yes.
decimal d5 = Decimal.valueOf(s5);
system.debug(d5.setScale(6));