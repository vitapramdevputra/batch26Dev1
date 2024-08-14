public class ControlFlowDemo {
    public void checkBigger(integer a, integer b){
        if(a > b){
            system.debug('a is greater than b. a = ' + a + ', b = ' + b);
        } else {
            //nested if
            if(a == b){
                system.debug('a and b are same. a = b = ' + a);
            } else {
                system.debug('b is greater than a.  a = ' + a + ', b = ' + b);
            }
        }
    }

    public void checkNumber(integer n){
        //check if n is Even, or Odd, or Zero, or negative
            //even 2, 4,6,8,10 -- divisible by 2
            //odd  3, 5,7,9, 11 - not divisible by 2
        if(n == 0){
            system.debug('number is zero.');
        } else if(n < 0){
            system.debug('number is negative. ' + n);
        } else {
            system.debug('number is positive. ' + n);

            //check if number is off or even
            integer mod2 = math.mod(n, 2); //0 means no remainder means the number is even. if remainder is 1, then number is odd.

            if (mod2 == 0) {
                system.debug('number is even. ' + n);
            } else {
                 system.debug('number is odd. ' + n);
            }
        }
    }
}