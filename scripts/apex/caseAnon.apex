List<case> listCase = new list<case>();
for (Integer i = 0; i < 500; i++) {
    case c = new case();
    c.Subject = 'New Case ' + i;
    c.Status = 'New';
    c.Origin = 'Web';
    c.Description = 'a new case. resolve fast.';
    listCase.add(c);
}
insert listCase;



List<case> listCase2 = new list<case>();
for (Integer i = 0; i < 5000; i++) {
    case c = new case();
    c.Subject = 'New Case ' + i;
    c.Status = 'New';
    c.Origin = 'Web';
    c.Description = 'a new case. resolve fast.';
    listCase2.add(c);
}
insert listCase2;



string s = 'this is a string';
string s2 = 'For Bulk API and Bulk API 2.0 transactions, the effective limit is the higher of the synchronous and asynchronous limits. For example, the maximum number of Bulk Apex jobs added to the queue with System.enqueueJob is the synchronous limit (50), which is higher than the asynchronous limit (1).';



List<account> accList = [select id, name from account];
for (Account eachAcc : accList) {
    //
}

//the better one
for (Account eachAcc : [select id, name from account]) {
    //
}
