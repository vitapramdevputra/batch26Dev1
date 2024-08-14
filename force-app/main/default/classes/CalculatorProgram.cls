public class CalculatorProgram {
    //normal method
    public void calc(){
        //call methods of calculator class
        Calculator c = new Calculator();
        integer s1 =  c.add(15, 65);
        system.debug('sum of 15 and 65 => ' + s1);

        //is it possible to call the other methods of class here?
        methodsDemo();
        methodsMethodsDemo();
    }

    public void methodsDemo(){
        MethodsDemo m = new MethodsDemo();
        m.welcomeMessage();
    }

    public void methodsMethodsDemo(){
       MethodsMethodsDemo md = new MethodsMethodsDemo();
       md.print1and2();
    }
}