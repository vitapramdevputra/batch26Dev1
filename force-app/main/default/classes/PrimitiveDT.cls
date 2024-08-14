public class PrimitiveDT {
    //create a method to print primitive datatypes
    public void print1(){
        string batchName = 'Batch 26';
        integer totalCandidates = 20;
        boolean isAdminCompleted = true;

        string description = 'Batch name is ' + batchName + '. Total candidates are ' + totalCandidates + '. Admin training completed? ' + isAdminCompleted;
        system.debug(description);
        
    }

    public void print2(){
        Decimal d1 = 55.55;
        Decimal d2 = 99;

        integer i = 10/3; //will this work? work.

        decimal d3 = 10/3; //int/int will be int
        decimal d4 = 10.0/3; //decimal/int or int/decimal will result in decimal

        system.debug('d1 => ' + d1);
        system.debug('d2 => ' + d2);
        system.debug('i => ' + i);
        system.debug('d3 => ' + d3);
        system.debug('d4 => ' + d4);
    }
    public void print3(){
        //long is primitive datatype. 64 bit number
        long r = 2545454324145524L; //to save long number we must write L at the end
        system.debug(r);

        //ID accId = 'abc123456798';//this is NOT a valid ID. This will error.

        ID accId = '001aj00000L7w70AAB';
        system.debug('accID : ' + accId);

    }
    public void print4(){
        Object o1 = 'string assigned to object';
        object o2 = 415;
        object o3 = true;
        object o4 = 77.55;
        
        system.debug('o1: ' + o1);
        system.debug('o2: ' + o2);
        system.debug('o3: ' + o3);
        system.debug('o4: ' + o4);
    }
}