@isTest
public class SPTriggerHandlerTest {
    @isTest
    private static void testFuture(){

        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test SP';
        sp.Status__c = 'New';
        sp.Description__c = 'test';
        insert sp; //future method will be called from trigger.

        Test.startTest();
        //call future method
        SPTriggerHandler.updateDescriptionFt((new set<id>{sp.Id}));
        Test.stopTest();

        //to ensure that future method is completed, we MUST use test.stoptest()
        //assert

        Salesforce_Project__c spTest = [SELECT Id, Description__c FROM Salesforce_Project__c LIMIT 1];
       Assert.isTrue(sptest.Description__c.contains('updated from Future'));
    }
}