# Class, Object, Class variables, constructor

- Class with class variables (instance variable)
    ``` 
    Public class ClassA{
        public string name;
        private string phone;
        integer age;

        public ClassA(){
           age = 18;
        }

        public ClassA(string name, string phone, string age){
            this.name = name;
            this.phone = phone;
            this.age = age;
        }

        public void details(){
            system.debug('name : ' + this.name);
            system.debug('phone : ' + this.phone);
            system.debug('age : ' + this.age);
        }
    }
    ```

    ```
    //we can create instance new ClassA(); 
        //a) no constructor is defined.
        //b) parameter less constructor is defined.
    ClassA c = new ClassA();
    c.details(); //name:null ,phone:null , age: 18
    
    ClassA b = new ClassA('ken', '31265987', 25);
    b.details();
    ```
    - Access modifier at class level. What all types are possible?
        - `Public`, `Global` 
    - Can class variables have access modifiers?
        - yes. We can have `public`, `private`, or `global` class variables
        - if we don't provide any access modifier then it is private.
    - difference between public and private?
        - public members (variables + methods), are accessible outside of the class.
            - accessible inside the class.
        - private members are accessible ONLY inside the class.
    - How can we set values to the all the class variables (public or private both) from outside of the class?
        - constructor.
    - What is constructor? Some rules? and how to call constructor?
        - It is like a method, which has SAME name as class name.
        - And it DOES NOT have any return type
        - it is called when new instance is created.
        - can we pass parameters in constructors?
            - yes, of course.
    - `this.` keyword
        - it represets class variables for the current instance.


- Constructor
    ```
    public Class ClassB{
        public string name;

        public void details(){
            system.debug(name);
        }

    }
    ```

    ```
    ClassB b = new ClassB(); //without passing any params while creating new instance. Yes. It will call the hidden constructor.
    b.details();
    ```


     ```
    public Class ClassC{
        public string name;

        public ClassC(){

        }

        public ClassC(string name){
            this.name = name;
        }

        public void details(){
            string description = '';
            system.debug(name);
        }

    }
    ```

    ```
    ClassC b = new ClassC(); //without passing any params while creating new instance?. No. There is one construcotr defined, and it is NOT parameterless.
    b.details();
    ```

- Scope of variable
    - Class varialbe scope is entire class
    - local variable scope is used within its enclosed brackets. `{ }`

- Getter-setter
    - for more security we try to keep properties as private.
    - to set/get the value of properties we use get/set methods
    ```
    public class ClassD{

        private integer num;
        private string str;

        //get method of num
        public integer getNum(){
            return this.num;
        }

        //if we JUST have get method, the variable becomes READ ONLY (like formula fields or any system fields)
        

        public string getStr(){
            return this.str;
        }

        public void setStr(string str){
            this.str = str;
        }


    }

    ```
- static/non-static
    - non-static members (variables and methods) are also called instance variables or instance methods. 
        - we access non-static variables and methods WITH instance.
    ```
    public class ClassE{
        public string name; //non-static. a.k.a instance variable
        public static string companyName; //static

        //non-static method. aka instance method
        public void details(){
            //inside non-static method, we can access non-static members
            system.debug('name :' + name);
            //we can access static variable also
            system.debug('companyName: ' + companyName);
        }

        //static method
        public static void stDetails(){
            //inside static method, we can access other static members
            system.debug('company name: ' + companyName);
            //we CANNOT access non-static member
            //system.debug('name:' + name);
        }
    }
    ```

    ```
    ClassE e = new ClassE();
    e.name = 'revision'
    e.details();

    ClassE w = new ClassE();
    w.name = 'www'
    w.details();

    ClassE.companyName = 'si';
    ClassE.stDetails();
    ```