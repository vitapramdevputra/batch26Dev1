@isTest
public class DmlDemo22Test {
    @isTest
    private static void testDml1() {
        //call method
        DmlDemo22.dml1(); //when we do DML --> data is NOT inserted/updated/delete in ORG.
            //data is created/updated in test world

        //assertion
        //soql to get the data it created.
        List<account> accs = [select id, name, rating from Account];
        //only 1 account in accs.

        //number of accounts
        Assert.areEqual(1, accs.size());
        Account acc1 = accs[0]; //0 means first index
        Assert.areEqual('Softinnovas', acc1.Name);
        Assert.areEqual('Hot', accs[0].Rating);
    }

    @isTest
    private static void testDml2() {
        //call method
        DmlDemo22.dml2();
        //assert
        Salesforce_Project__c sp = [select id, name, project_name__c, status__c, Description__c from Salesforce_Project__c limit 1];
        Assert.areEqual('Lean DMLs', sp.Project_Name__c);
        Assert.areEqual('New', sp.Status__c);
    }

    @isTest
    private static void testDml6() {

        //step1: CREATE required RECORDS
        Account a = new account(name = 'test acc');
        insert a;

        //step2: call method
        DmlDemo22.dml6UpdateRight(); //failing because we don't have any account record before calling this method.

        //step3: Assertion
        Account updateAcc = [select id, name, phone, type, website from account where id = :a.Id];
    
       Assert.areEqual('Salesforce Inc.', updateAcc.Name);
       Assert.areEqual('321654987', updateAcc.Phone);
        Assert.areEqual('salesforce.com', updateAcc.Website);

    
    }
}