public class DmlDemo2 {
    public static void dml7(){
        //create contact record related to existing account
        account acc = [select id, name from account ORDER BY createddate desc limit 1];
        
        //new instance
        Contact c = new contact();
        //set fields
        c.firstname = 'Tom';
        c.lastname = 'Tuesday';
        c.email = 'tom@tuesday.com';
        c.phone = '123456789';
        c.AccountId = acc.Id;//establish relationship via id
        //c.AccountId = '001aj00000Q8aFRAAZ'; //hard coded id, not good
        //dml
        insert c;
        system.debug(c);
    }

    public static void dml8(){
        //get the latest created project.
        Salesforce_Project__c sp = [select id, name from Salesforce_Project__c ORDER BY CreatedDate DESC limit 1];

        //create a ticket related to the above selected project.
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Learn DML in apex';
        st.Priority__c = 'High';
        st.Status__c = 'In Progress';
        st.Salesforce_Project__c = sp.Id; //relationship
        insert st;

    }

    public static void dml9BulkWrong() {

        for (Integer i = 0; i < 160; i++) {
            account a = new account();
            a.Name = 'Bulk Acc 18 July ' + i;
            //never use DMLs OR SOQL inside loops (fori, for each loop, while loop)
                //why? because of limits. We have 100 SOQL, and 150 DMLs. 
            insert a; //# of DMLs will be 50
        }
    }

    public static void dml10BulkRight() {
        
        List<account> accList = new list<account>();

        for (Integer i = 0; i < 200; i++) {
            account a = new account();
            a.Name = 'Softinnovas v'+i;
            accList.add(a);
        }
        insert accList; //# of DML --> 1.
    }

    public static void dml11BulkInsert() {
        //get latest 200 account records and insert contact in each of that account
        list<account> accList = [select id, name from account ORDER BY CreatedDate DESC limit 200];

        list<contact> newContacts = new list<contact>();
        //insert a contact for each account record.
        for (Account eachAcc : accList) {
            //create contact
            contact c = new contact();
            c.LastName = 'Friday ' + eachAcc.Name;
            c.AccountId = eachAcc.Id; //relate contact with account.
            //insert c;
            newContacts.add(c);
        }
        insert newContacts;
    }
}