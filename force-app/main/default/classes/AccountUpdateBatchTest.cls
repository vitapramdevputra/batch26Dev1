@isTest
public class AccountUpdateBatchTest {
    @isTest
    static void testBatch(){
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 150; i++) {
            account a = new account(name = 'test acc ' + i, Industry = 'Energy');
            listAcc.add(a);
        }
        insert listAcc;

        Test.startTest();
        //cannot  divide the records in chunks (batches)
        //only one execution is allowed in test class.
        Database.executeBatch(new AccountUpdateBatch(), 150);
        Test.stopTest();

        //Assertion
        list<account> accs = [select id, name, description from account];
        for(account a: accs){
            Assert.isTrue(a.Description.contains('updated via batch'));
        }

    }
}