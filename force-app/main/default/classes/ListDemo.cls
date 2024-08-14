public class ListDemo {
    
    public static void candidatesList(){
        //List<datatype>
        //List<string> -- list of string
        List<string> listCD = new list<string>();
        //add method is used to add values to list
        listCD.add('Mark'); //0
        listCD.add('Ellie');//1
        listCD.add('Bill'); //2
        listCD.add('Mark'); //3
        listCD.add('Mark'); //4
        listCD.add('7');    //5
        system.debug('candidates list is ' + listCD);

        //what is value at index 2 => 'Bill'
        string cd2 = listCD.get(2); //2 is INDEX. cd2 is the VALUE at index 2, which is string.
        system.debug('cd2 : ' + cd2);
        //what is value at index 3 =>  'Mark'
        string cd3 = listCD[3];
        system.debug('cd3 : ' + cd3);

    }

    public static void integerList(){

        List<Integer> listInteger = new list<integer>();
        listInteger.add(10); //0
        listInteger.add(21); //1
        listInteger.add(17); //2
        listInteger.add(25); //3
        listInteger.add(10); //4
        listInteger.add(21); //5
        system.debug('list integer: ' + listInteger);

        system.debug('number of elements: ' + listInteger.size());

        //what is value at index 2 => 17

        integer in2 = listInteger.get(2); //.get(index) ==> return us the value at provided index

        //what is value at index 3 => 25
        integer in3 = listInteger.get(3);
        //OR
        integer in33 = listInteger[3]; //list[index] ==> return us the value at provided index
        system.debug('in2 : ' + in2);
        system.debug('in3 : ' + in3);
        system.debug('in33 : ' + in33);

    }   


    //we are passing index in parameters. the method should print value at that index.
    public static void candidatesList(integer ind){
        //List<datatype>
        //List<string> -- list of string
        List<string> listCD = new list<string>();
        //add method is used to add values to list
        listCD.add('Mark'); //0
        listCD.add('Ellie');//1
        listCD.add('Bill'); //2
        listCD.add('Mark'); //3
        listCD.add('Mark'); //4
        listCD.add('7');    //5
        system.debug('candidates list is ' + listCD);

        if(ind >= 0 && ind < listCD.size()){
            string valueAtInd = listCD.get(ind);
            system.debug('value at index ' + ind + ' is ' + valueAtInd);
        } else {
            system.debug('no such index. ' + ind);
        }

    }

    public static void candidatesList3(){
        //List<datatype>
        //List<string> -- list of string
        List<string> listCD = new list<string>();
        //add method is used to add values to list
        listCD.add('Mark'); //0
        listCD.add('Ellie');//1
        listCD.add('Bill'); //2
        listCD.add('Mark'); //3
        listCD.add('Mark'); //4
        listCD.add('7');    //5
        system.debug('candidates list is ' + listCD);

        
        //check if list has Mark in it.
        boolean c1 = listCD.contains('Mark');
        boolean c2 = listCD.contains('mark');
        system.debug('c1 ==> ' + c1);
        system.debug('c2 ==> ' + c2);

        listCD.sort(); //sort the list in ascending order
        system.debug('candidates list after sorting ' + listCD);


    }

    
}