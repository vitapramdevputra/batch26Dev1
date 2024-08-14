# Apex basics

- What is anonymous apex? or anoymous window?
    - we execute small apex code snippets. 
    - We don't save the code in ligthning platform.

- How to execute anonymous apex code from VS Code?
    - go to folder `scripts > apex`.
    - create new file `name2.apex`
        - write some code.
        - click on execute.

- What is class in programming?
    - a class is a container of reusable code.
    - class is like a template for any real entity
    - how to create a new class?
        - VS: command pallate -> sfdx create apex class -> ClassName
        - syntax:
            ```
            public class ClassOne{
                //methodOne
                public void methodOne(){
                    system.debug('this is method one');
                }
            }
            ```
    - how to create instance of class to call the method?
        - we create new anonymous apex file to call the method
        - syntax:
            ```
            //create new instance of the class (or object)
            ClassOne c = new classOne();
            c.methodOne();
            ```

- Variable
    - `string s = 'a new string';` //is this correct? yes
    - `string s2;` //value of s2 is null
    - `string s3, s4, s5;`//is this valid? yes, and all strings are null
    
- Created class, methods, variables
    - datatypes: String, integer, decimal, long, ID, object, boolean

- String class
    - length
        ```
        string x = 'some value.';
        integer xLen = x.length();
        system.debug(xLen);
        system.debug(x.length());
        ```
    - `toUpperCase()`, `toLowerCase()`
        ```
        string xUp = x.toUpperCase();
        system.debug('x => ' + x);
        system.debug('xUp => ' + xUp);
        ```
    - `contains(substring)`, `containsIgnoreCase(substring)`
        ```
        system.debug('check1 ' + x.contains('some '));
        system.debug('check2 ' + x.contains('Some '));
        system.debug('check3 ' + x.containsIgnoreCase('Some Value'));
        ```

    - `remove(substring);` - will remove ALL Occurrances of provided substring.
    - `equals(string)`; 
    - `indexOf(substring);` -- will return index of provided substring (if present). If not present then returns -1
    - `string.valueOf(anything);` -- converts any other datatype to string

- Decimal methods
    - `setScale(integer)`
        ```
        decimal d = 2.3154321452;
        decimal d2 = d.setScale(2); //2 digits after decimal point. //2.32
        decimal d3 = d.setScale(3); //3 digits after decimal point. //2.315
        ```
    - `toPlainString();`

- Date
    - how to create new date?
        - newInstance(year, months, day)
        - `Date d = Date.newInstance(2000, 2, 20);`
        - `Date todayDate = Date.today();` //based on User's timezone

- Time
    - newInstance(hour, minutes, second, milliseconds)
    - `Time t = Time.newInstance(10,15,30,100);`

- DateTime
    - 1. DateTime.newInstance(date, time);
    - `Datetime dt = datetime.newInstance(todayDate, t);`
    - 2. DateTime.newInstance(Year, month, day); //what will be time value here?
    - 3. DateTime.newInstance(Year, month, day, hour,  minute, second);
    - 4. DateTime.newInstanceGMT(Year, month, day, hour,  minute, second);
    - 5. Datetime.now();

- Date, Time, DateTime methods
    - date1.addDays(100); //addMonths(), addYears()
    - Time1.addHours(100); //addMinutes(), addSeconds()
    - DateTime1.addDays(100); //addMonths(), addYears(), addMinutes(), addSeconds()

- Methods

    - Parameterized methods
        ```
        public void methodA(string msg){

        }
        ```

    - return type in methods
        ```
        //return boolean from this method
        public boolean methodA(string msg){
            boolean b = false;

                //write logic to assign boolean value to b
                b = true;

            return b;
        }
        ```
    - Parameterized methods can accept multiple parameters and any datatypes
        ```
        public string methodB(string a, integer b, boolean c){

        }
        ```
    
    - Can we have two or more same name methods in same class?
        - yes. Provided we have different signature - different number of parameters, or different datatypes.
        - method overloading
    
    - We can call any class methods from any other class
    - we can normally like call it like we do it from anonymous apex

    - we can also call methods of same class easily.