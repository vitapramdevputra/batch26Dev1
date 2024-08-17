public class SampleFutureDemo {
    //static
    //return void
    //parameters: primitive datatypes, or collection of primitive datatypes IS ALLOWED.
    //              we cannot pass sObject or List<sObject>
    @future //one of the async
    public static void futureMethod1(string msg){
        system.debug('Future method called... msg : ' + msg);
    }

    public static string normalMethod(string s){
        system.debug('sync method. s: ' + s);
        return 'done';
    }
}