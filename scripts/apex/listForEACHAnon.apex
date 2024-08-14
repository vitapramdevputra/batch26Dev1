ListForEachDemo.loop3();

 List<string> listCD = new list<string>();
listCD.add('Mark'); 
listCD.add('Ellie');
listCD.add('Bill'); 
listCD.add('Mark'); 
listCD.add('Mark'); 
listCD.add('Marc');
system.debug('candidates list is ' + listCD);

// listCD.remove(3);
// system.debug('candidates list is ' + listCD);


List<string> list2 = new list<string>{'Peter', 'Gary', 'James'};
list2.add('Jeremy');
list2.addAll(listCD);
system.debug('list2: ' + list2);

system.debug(list2.indexOf('Bill'));


List<string> l = new list<string>{'a','b','c','x','yz'};
for(string eachStr:l){
      system.debug(eachStr + ' and its length is ' + eachStr.length());
  }