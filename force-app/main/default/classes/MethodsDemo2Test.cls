@isTest //@isTest annotation is used to make a class as a Test Class.
public class MethodsDemo2Test {
    
    //we can have normal methods in test class.
    public static void nonTestMethod(){
        //normal method.

    }

    //we can have TestMethods inside test class.
        //annotate
        //static
        //returns void
        //it accepts no parameters.
    @isTest //another @isTest is used for each METHOD, to make it a test method
    public static void testWelcomeMessage(){
        //we can test any method inside test method.
            //it can be static, non-static, parameterized, parameterless, returns something, or void.
        //call the method you want to test.
        MethodsDemo2 md2 = new MethodsDemo2();
        md2.welcomeMessage();
    }

    @isTest
    public static void testPrintNewMessage(){
        MethodsDemo2 md2 = new MethodsDemo2();
        md2.printNewMessage('test message');
    }

    @isTest
    public static void testNameContactsA1(){
        MethodsDemo2 md2 = new MethodsDemo2();
        boolean b1 = md2.nameContainsA('bill');

        //what will be value of b1? 
            //false
            //inside this method, we HAVE to VERIFY if b1 is REALLY FALSE.
                //if it is FALSE --> test passed.
                //if it is True --> test failed.
        //How to verify?
        //Assertions

        //two ways
            //old way
        system.assertEquals(false, b1); //matches --> test will pass.
            //new way
    }

     @isTest
    public static void testNameContactsA2(){
        MethodsDemo2 md2 = new MethodsDemo2();
        boolean b1 = md2.nameContainsA('Jane');

        //what will be value of b1? 
            //true
            //inside this method, we HAVE to VERIFY if b1 is REALLY FALSE.
                //if it is true --> test passed.
                //if it is false --> test failed.
        //How to verify?
        //Assertions

        //two ways
            //old way
        system.assertEquals(true, b1); //matches --> test will pass.
            //new way
    }

    @isTest
    private static void testReturnMessage() {
        MethodsDemo2 md2 = new MethodsDemo2();
        string msg = md2.returnMessage('Jane');
        //msg = Hey Jane, nice to meet you buddy

        //Old Way --system.assert(boolean condition)
        System.assert(msg.contains('Hey Jane')); ///true then passed. if false then failed.

        //new way
        Assert.isTrue(msg.contains('Hey Jane'));
    }

    @isTest
    private static void testIndexOfA() {
        MethodsDemo2 md2 = new MethodsDemo2();
        integer i = md2.indexOfA('jane');
        Assert.areEqual(1, i);
    }
}