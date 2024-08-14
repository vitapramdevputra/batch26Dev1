@isTEst
public with sharing class AccountTriggerTest {
   @isTest
   private static void test1() {
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 50; i++) {
            account a = new account(name = 'test acc ' + i);
            listAcc.add(a);
        }
        insert listAcc;

        //assertion
        List<account> accs = [select id, name from account];
        Assert.areEqual(50, accs.size());
   }

    @isTest
   private static void test2() {
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 50; i++) {
            account a = new account(name = 'test acc ' + i);
            listAcc.add(a);
        }
        insert listAcc;

        for (Account ac : listAcc) {
            ac.Phone = '654654444';
        }
        update listAcc;

        //assertion
        List<account> accs = [select id, name from account where phone = '654654444'];
        Assert.areEqual(50, accs.size());
   }
    @isTest
   private static void test3() {
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 50; i++) {
            account a = new account(name = 'test acc ' + i);
            listAcc.add(a);
        }
        insert listAcc;

       delete listAcc;

        //assertion
        List<account> accs = [select id, name from account];
        Assert.areEqual(0, accs.size());
   }

    @isTest
   private static void test4() {
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 5; i++) {
            account a = new account(name = 'test acc ' + i);
            listAcc.add(a);
        }
        insert listAcc;

       delete listAcc;

        undelete listAcc;

        //assertion
        List<account> accs = [select id, name from account];
        Assert.areEqual(5, accs.size());
   }
}