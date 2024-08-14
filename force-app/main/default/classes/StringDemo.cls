public class StringDemo {
    public void method1(){
        string description = 'learning string methods in apex language.';
        system.debug('description: ' + description);

        //1. length of string
        integer len = description.length(); //method name is length, and it returns integer.
        system.debug('length of description: ' + len);

        //2. convert to upper case
        string dUpper = description.toUpperCase();
        system.debug('uppercase description: ' + dUpper);
       
        //3. check if description has 'apex' in it
        boolean check1 = description.contains('apex'); //returns true if 'apex' is present in description
        system.debug('check1 --> ' + check1);

        boolean check2 = description.contains('in apex'); //returns true if 'apex' is present in description
        system.debug('check2 (in apex) --> ' + check2);

        boolean check3 = description.contains('Apex'); //returns true if 'Apex' is present in description
        system.debug('check3 --> ' + check3);

        boolean check4 = description.contains('salesforce'); //returns true if 'salesforce' is present in description
        system.debug('check4 --> ' + check4);

        boolean check5 = description.contains('APEX'); //returns true if 'Apex' is present in description
        system.debug('check5 --> ' + check5);

        //to compare contains irrespective of case, use containsIgnoreCase
        boolean check6 = description.containsIgnoreCase('in APEX ');
        system.debug('check6 ==> ' + check6);
    }
}