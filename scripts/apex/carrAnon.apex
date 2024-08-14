Carr c1 = new Carr();
//c1.details();

system.debug('----------');
Carr c2 = new Carr('Tesla Cybertruck');
//c2.details();

system.debug('----------');
Carr c3  = new Carr('PIE314', 'Ford F1', 2020, 'black', 50000);
//c3.details();



// Carrr cr2 = new Carrr('White'); //it will try to find a constructor which takes one string.
// //error.

system.debug('----------');
system.debug('----------');
// Carrr cr3 = new Carrr();//it will try to find a constructor which takes NO params.
//     //error

Carrr cr1 = new Carrr('BMW X1', 'White');
//we cannot get the value.
//we cannot set the value.
//cr1.name = 'BMW X3';// assigning a value.
system.debug(cr1.name);
cr1.name = 'BMW X3';
system.debug('car name again: ' + cr1.name);
