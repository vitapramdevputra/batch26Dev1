public class Candidate {
    public string name; //instance variable
    public string gender; //instance variable
    public static string companyName; //this is static variable.

    //non-static method or instance method
        //we can access static
    public void details(){
        system.debug('--------');
        system.debug('name: ' + name);
        system.debug('gender: ' + gender);
        system.debug('companyName: ' + companyName);
        system.debug('=========');
    }

    //static method
        //cannot access non-static
    public static void details2(){
        // system.debug('name: ' + name);
        // system.debug('gender: ' + gender);
        system.debug('companyName: ' + companyName);
    }
}