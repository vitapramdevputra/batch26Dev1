@isTest
public with sharing class AccountTriggerHandlerTest {
    @isTest
    public static void testUpdateDescription1() {
        //prepare data and call method together. Because method is called from trigger
        Account a = new account(name = 'test1', Active__c = 'Yes');
        insert a;

        //it will update Description 'Account is active. Enjoy buddy...'
        //assert
        account acc = [select id, name, description from account where id = :a.Id];
        //Assert.isTrue(acc.Description.contains('active'));
        Assert.areEqual('Account is active. Enjoy buddy...', acc.Description);
    }

     @isTest
    public static void testUpdateDescription2() {
        //prepare data and call method together. Because method is called from trigger
        Account a = new account(name = 'test1');
        insert a;

        a.Active__c = 'Yes';
        update a;

        //it will update Description 'Account is active. Enjoy buddy...'
        //assert
        account acc = [select id, name, description from account where id = :a.Id];
        //Assert.isTrue(acc.Description.contains('active'));
        Assert.areEqual('Account is NOW active. Enjoy buddy...', acc.Description);
    }

    @isTest
    private static void testVIP() {
        //account - 5
        //3 - contact
        //create accounts
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 5; i++) {
            account a = new account(name = 'test acc ' + i, Industry = 'Energy');
            listAcc.add(a);
        }
        insert listAcc;

        list<contact> listCon = new List<Contact>();
        //for each account
        for (Account eachAcc : listAcc) {
            //3 contacts
            for (Integer i = 0; i < 3; i++) {
                contact c = new contact(lastName = 'Test Contact' + i,
                AccountId = eachAcc.Id);
                listCon.add(c);
            }
        }
        
        insert listCon;

        //to test VIP check method, we have to update account's VIP to true

        //update accounts
        for (account each : listAcc) {
            each.VIP__c = true;
        }
        update listAcc;


        //assert -- verify that contact's VIP is updated to true via triggerHandler
        List<Contact> contacts = [select id, name, VIP__c from contact where VIP__c = TRUE];
        Assert.areEqual(15, contacts.size());
    }

    @isTest
    private static void testValidateActiveAcc() {
        
        //create account record
        Account a  = new account(name = 'test test', Active__c = 'Yes');
        insert a;
        try {
            delete a;
        } catch(Exception e) {
            System.debug(e.getMessage());
            //ASSERT
            Assert.isTrue(e.getMessage().contains('Cannot delete active account'));
        }
        
    }
}
