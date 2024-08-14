try {
    Account a = new account();
    insert a;

    string s ;
    system.debug(s.toLowerCase()); //Null pointer exception
    system.debug('almost done.');
} catch (DmlException dx) { //specific exceptions has to be on the top.
    //Exception is the general exception which can catch all the exceptions.
    system.debug('DML went wrong: ' + dx.getMessage());
    system.debug('StackTraceString => ' + dx.getStackTraceString());
} catch (Exception exc) { //general exception MUST be at the END.
    //Exception is the general exception which can catch all the exceptions.
    system.debug('There is exception. Message: ' + exc.getMessage());
    system.debug('StackTraceString => ' + exc.getStackTraceString());
} 

system.debug('DONE');



// system.debug('DONE');


// List<string> ls = new list<string>{'a', 'b'};
// system.debug('4th element: ' + ls[4]);
// system.debug('DONE');

