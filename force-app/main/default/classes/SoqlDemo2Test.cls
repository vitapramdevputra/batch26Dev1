@isTest
public with sharing class SoqlDemo2Test {
    @TestSetup
    static void makeData(){
        //create accounts
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 100; i++) {
            account a = new account(name = 'test acc ' + i, Industry = 'Energy');
            listAcc.add(a);
        }
        insert listAcc;

        list<contact> listCon = new List<Contact>();
        for (Integer i = 0; i < 100; i++) {
            contact c = new contact(lastName = 'Test Contact' + i,
            AccountId = listAcc[i].Id);
            listCon.add(c);
        }
        insert listCon;
    }

    @isTest
    private static void testSOQL5_v1() {
        //prepare data is DONE in test setup.
        //call method
        SoqlDemo2.soql5();
        //skip assertion because we are NOT doing anything in soql5.
    }
    @isTest
    private static void testSOQL5_v2() {
         //prepare data is DONE in test setup.
        //call method
        SoqlDemo2.soql5('Energy');
        //skip assertion because we are NOT doing anything in soql5.
    }

    @isTest
    private static void testSOQL6() 
    {
        SoqlDemo2.soql6();
    }
}