@isTest
public class AccountUpdateQueTest {
    @isTest
    private static void testQueueable() {
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 150; i++) {
            account a = new account(name = 'test acc ' + i, Industry = 'Energy');
            listAcc.add(a);
        }
        insert listAcc;


        AccountUpdateQue accountUpdateQueue = new AccountUpdateQue(listAcc);
        Test.startTest();
        System.enqueueJob(accountUpdateQueue);
        Test.stopTest();

        //assertion - check if name has -- SI in it
        List<account> allAcc = [select id, name from account];
        for (account acc : allAcc) {
            Assert.isTrue(acc.Name.contains('-- SI'));
        }
    }
}