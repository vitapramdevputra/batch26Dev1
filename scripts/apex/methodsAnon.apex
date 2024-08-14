MethodsDemo m  = new MethodsDemo();
m.welcomeMessage();
m.printNewMessage('Bond');
m.printNewMessage('Hank');
//m.printNewMessage(15); //will this work? NO.
system.debug('------------');
string msg1 = m.returnMessage('April');
system.debug(msg1);
system.debug(m.returnMessage('Alex'));

boolean c1 = m.nameContainsA('Jenny');
system.debug('c1 ==> ' + c1);
integer c2 = m.indexOfA('Parker');
system.debug('c2 ==> ' + c2);