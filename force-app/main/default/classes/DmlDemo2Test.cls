@isTest
public class DmlDemo2Test {
    @isTest
    private static void testDml7() {
        //step 1
        Account a = new account(name = 'test acc');
        insert a;

        //step 2
        DmlDemo2.dml7();

        //step 3
        //Assertion
        List<contact> contacts = [select id, firstname, lastname, email, phone, accountid from contact where accountid = :a.Id and firstname = 'Tom'];


        Assert.areEqual(1, contacts.size());
        Assert.areEqual('tom@tuesday.com', contacts[0].Email);
    }
    // @isTest
    // private static void testDML8() {
    //     //create data
    //         //Salesforce_Project__c
        
    //     //call method
    //         //dml8
        
    //     //assert
    //         //we want to assert if ticket is created or not.
    //         //soql query on Salesforce_Ticket__c
    // }

    @isTest
    private static void dml11() {
        //prepare data
            //in data preparation it consumes a lot of gover limits. CPU time, or heap size, sometimes soql and DML also
            //8000 milliseconds of CPU is consumed.  -- 2000 milliseconds is available.
            //5MB heap size is consumed.             -- 1MB heap size is available.
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 210; i++) {
            account a = new account(name = 'test acc ' + i);
            listAcc.add(a);
        }
        insert listAcc;
        
        Test.startTest();
            //governor limit will be reset in between test.starttest() and test.stoptest()
                //now. we have FULL 10k milliseconds available. 6 MB heap size available.
        //call method
            //by the time when we actually have to TEST our actual, we ran out of governor limits. and it fails.
        DmlDemo2.dml11BulkInsert();
        Test.stopTest();

        //assert
            //it will resume from PREVIOUS governor limits.
                //2000 milliseconds available
                //1MB heap size available.
            List<contact> contacts = [select id, lastname, accountid from contact];
            Assert.areEqual(200, contacts.size());
            Assert.isTrue(contacts[0].LastName.contains('Friday'));
    }
}