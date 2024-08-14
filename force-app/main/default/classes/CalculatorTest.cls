@isTest
public class CalculatorTest {
    @isTest
    private static void testAdd1() {
        //call method
        Calculator c = new Calculator();
        integer i = c.add(10,15);

        //assertion
        Assert.areEqual(25, i);
    }

    @isTest
    private static void testAdd2() {
        //call method
        Calculator c = new Calculator();
        integer i = c.add(10,15,15);

        //assertion
        Assert.areEqual(40, i);
    }
}