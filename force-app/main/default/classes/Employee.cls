public class Employee {
    //instance variable.
        //non-static
    private string name;
    private decimal salary;

    public Employee() {

    }
    public Employee(string name) {
        this.name = name;
    }

    //get method of name 
    public string getName(){
        return this.name;
    }
    //set method of name
    public void setName(string name){
        this.name = name;
    }

    public decimal getSalary(){
        return this.salary;
    }
    public void setSalary(decimal salary){
        if(salary >= 100000 && salary <= 600000){
            this.salary = salary;
        } else {
            this.salary = 0;
            system.debug('* Salary not in valid range. Be in limits buddy!');
        }
    }

    public void details(){
        system.debug(name + ' salary is ' + salary);
    }

}