public class ListForEachDemo {
    public static void loop1() {
        //add elements by default.
        List<integer> listInt2 = new list<integer>{10,20,21,15,45,15,10};
        listInt2.add(22);
        listInt2.add(99);
        system.debug(listInt2);


        //for each loop. Get each element from list in for loop.
        for(integer eachInt : listInt2){
            system.debug(eachInt);
        }
    }

    public static void loop2() {
        List<string> listCD = new list<string>();
        listCD.add('Mark'); 
        listCD.add('Ellie');
        listCD.add('Bill'); 
        listCD.add('Mark'); 
        listCD.add('Mark'); 
        listCD.add('Marc');
        system.debug('candidates list is ' + listCD);

        for (String eachCandidate : listCD) {
            system.debug(eachCandidate.toLowerCase());
            //we cannot change the list while we are iterating (for each) it.
            //listCD.add(eachCandidate.toLowerCase());
        }

        system.debug('print LIST again: ' + listCD);
    }

     public static void add() {
        //add elements by default.
        List<integer> listInt2 = new list<integer>{10,20,15,45,10};
        system.debug(listInt2);


        //sum of all the integers in the above list.
        integer sum = 0;
        for (Integer eachInt : listInt2) {
            sum += eachInt;
            system.debug('** sum is under progress: sum: ' + sum);
        }

        system.debug('FINAL SUM: ' + sum);
    }

     public static void loop3() {
        List<string> listCD = new list<string>();
        listCD.add('Mark'); 
        listCD.add('Ellie');
        listCD.add('Bill'); 
        listCD.add('Mark'); 
        listCD.add('Mark'); 
        listCD.add('Marc');
        system.debug('candidates list is ' + listCD);

        List<string> listCDAgain = new list<string>();

        for (String eachCandidate : listCD) {
            system.debug(eachCandidate.toLowerCase());
            //we cannot change the list while we are iterating (for each) it.
            listCDAgain.add(eachCandidate);
            listCDAgain.add(eachCandidate.toLowerCase());
        }

        system.debug('print LIST again ORIGINAL: ' + listCD);
        system.debug('print LIST again listCDAgain: ' + listCDAgain);
    }
}