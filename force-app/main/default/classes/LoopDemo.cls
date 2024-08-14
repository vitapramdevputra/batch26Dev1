public class LoopDemo {
    public void print_1_while(){
        //print 1 ten (or 20) times using while loop
        
        //1. initialize a variable
        integer i = 1;

        //2. while (exit condition)
        while(i <= 5){
            system.debug('inside while.....');
            system.debug(i);
            //3. increment or decrement
            i++;
            system.debug('-- after increment -- i: ' + i);
        }

        system.debug('after a while : ' + i);

    }

    public void printFor(){

        for(integer i = 0; i <=5; i++){
            system.debug(i);
        }
    }

    public void printFor(integer st, integer ed){
        for (Integer i = st; i <= ed; i++) {
            system.debug(i);
        }
    }

        //5, 50
    public void printN_OddNumbers(integer st, integer ed){
        //we want to print all the odd numbers in between start and end integers
        for (Integer i = st; i <= ed; i++) {
            //print just odd numbers.
            //find mod of i/2. if remainder is 1 then it is odd number
            integer rem = math.mod(i, 2); 
            if(rem == 1){
                system.debug(i);
            }
        }
    }
}