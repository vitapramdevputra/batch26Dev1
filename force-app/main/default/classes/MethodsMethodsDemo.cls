public class MethodsMethodsDemo {
    public void print1(){
        system.debug('1. print1 method called.');
    }
    public void print2(){
        system.debug('2. print2 method called. ');
    }
    public void printSomething(string msg){
        system.debug('3. printSomething method called. ' + msg);
    }

    //how to call other methods in same class?
    public void print1and2(){
        print1();
        print2();
        printSomething('our message to be printed.');
    }
}