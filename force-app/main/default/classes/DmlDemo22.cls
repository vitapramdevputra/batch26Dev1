public class DmlDemo22 {
   public static void dml1() {
        //learn DML statement to create one account record.
        //click new is similar as creating new instance of account sObject
        Account acc = new account(); //new instance
        //set field values
        acc.Name = 'Softinnovas';
        acc.Rating = 'Hot';
        //dml -- insert
        insert acc; //create a new account record in the org.
   }

   public static void dml2() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Lean DMLs';
        sp.Status__c = 'New';
        sp.Description__c = 'Learning DMLS now. Started with Insert.';
        system.debug('sp (before): ' + sp);
        insert sp;
        system.debug('sp (after): ' + sp);
   }
   public static void dml3() {
        Employee__c emp = new Employee__c();
        emp.First_Name__c = 'John';
        emp.Last_Name__c = 'John';
        emp.Country__c = 'USA';
        emp.Email__c = 'john@john.com';
        emp.JoinDate__c = date.newInstance(2023, 8, 5);
        emp.Salary__c = 500050;
        insert emp;
   }

   public static void dml4Update() {
        Account acc = new account(); //new instance
        //set field values
        acc.Name = 'Softinnovas';
        acc.Rating = 'Hot';
        //dml -- insert
        insert acc; //create a new account record in the org.
        //after insert statement, we will have account id in acc.

        acc.Name = 'Softinnovas INC.';
        acc.Phone  = ' 444444444 ';
        acc.Site = 'test update';
        update acc;
   }

   //do not do it like this.
   public static void dml5UpdateWrong() {
        account acc = new account();
        acc.Id = '001aj00000Q8CpqAAF'; //ID is static. No hard coding IDs.
        acc.Name = 'Softinnovas Inc.';
        acc.Type = 'Customer - Direct';
        acc.Website = 'softinnovas.com';
        update acc;
   }

   public static void dml6UpdateRight() {
        //get 1 latest created account record.
        account acc = [select id, name from account ORDER BY CreatedDate desc limit 1];
        acc.Name = 'Salesforce Inc.';
        acc.Phone = '321654987';
        acc.Type = 'Customer - Direct';
        acc.Website = 'salesforce.com';
        update acc;
   }
}