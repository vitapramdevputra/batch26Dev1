ListDemo.candidatesList3();
ListDemo.candidatesList(-1);
ListDemo.candidatesList(6);
ListDemo.candidatesList(1);
ListDemo.candidatesList(4);
ListDemo.integerList();
ListDemo.candidatesList();


list<string> l3 = new list<string>();
//isEmpty() will return true when list is empty.

//!isEmpty() will return true when list is NOT EMPTY.
if(!l3.isEmpty()){
    system.debug('print l3: ' + l3);
} else {
    system.debug('nothing to print');
}


 List<string> listCD = new list<string>();
//add method is used to add values to list
listCD.add('Mark'); //0
listCD.add('Ellie');//1
listCD.add('Bill'); //2
listCD.add('Mark'); //3
listCD.add('Mark'); //4
system.debug('candidates list is ' + listCD);

 List<string> listCD2 = new list<string>();
//add method is used to add values to list
listCD2.add('Mark'); 
listCD2.add('Mark'); 
listCD2.add('Ellie');
listCD2.add('Mark'); 
listCD2.add('Bill'); 

system.debug('candidates2 list is ' + listCD2);

system.debug(listCD.equals(listCD2)); //it will check if list are exact same, indexes should also match.