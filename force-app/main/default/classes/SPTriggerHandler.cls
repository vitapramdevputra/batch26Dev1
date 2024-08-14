public class SPTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew) {
        try {
            //create new default ticket for every salesforce project in spTriggerNew
            List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();

            for (Salesforce_Project__c newSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = 'Default Ticket';
                st.Requested_by_date__c = date.today();
                st.Salesforce_Project__c = newSP.Id; //establish relationsip
                st.Status__c = 'New';
                newST.add(st);
                
            }
            insert newST; //dml
        } catch(Exception e) {
            System.debug(e.getMessage());
            for (Salesforce_Project__c newSP : spTriggerNew) {
                newSP.addError('Error in creating default ticket. Please contact your administrator.');
            }
        }
       
    }

    public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap) {
        
        set<id> projectIds = new set<id>();
        //check if all the tickets are completed in a project.
        for (Salesforce_Project__c newSP : spTriggerNew) {
            //check if project status is completed and stat is changed.
            if(newSP.Status__c == 'Completed' && newSP.Status__c != spTriggerOldMap.get(newSP.Id).Status__c){
               projectIds.add(newSP.Id);
            }
        }

         //get tickets where status != completed of projectids.
        List<Salesforce_Ticket__c> spTickets = [select id, status__c,Salesforce_Project__c from Salesforce_Ticket__c where Salesforce_Project__c in :projectIds and status__c != 'Completed'];
        for (Salesforce_Ticket__c eachST : spTickets) {
            //get sp from newMap (bcz we can throw error on New OR NewMap while inserting or updating)
            Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            sp.addError('First complete all the tickets and then complete the Project');
        }
    }
}