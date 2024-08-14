Employee emp1 = new Employee();
emp1.setName('Walter White');
emp1.setSalary(300000);
emp1.details();

system.debug('-------');
//creating new instance of employee
Employee emp2 = new Employee();
//set name of emp2 instance.
emp2.setName('Jesse Pink');
emp2.setSalary(80000);
//get the value of name variable
string emp2name = emp2.getName();
system.debug('emp2name: ' + emp2name);
system.debug('emp2 salary: ' + emp2.getSalary());