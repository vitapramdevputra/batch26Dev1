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
                st.Priority__c = 'High';
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

    @future
    public static void updateDescriptionFt(set<id> spIds){
        list<Salesforce_Project__c> spList = [select id, name, description__c from salesforce_project__c where id in :spIds];
        for(Salesforce_Project__c sp: spList){
            sp.Description__c += ' -- updated from Future';
        }
        update spList;
    }

    //update all tickets to completed in future method.
    @future
    private static void updateTickets(set<id> spIds){
        //get salesforce tickets which not already completed.
        List<Salesforce_Ticket__c> stList = [select id, salesforce_project__c, status__c from salesforce_ticket__c where salesforce_project__c in :spIds and status__c != 'Completed'];

        for(Salesforce_Ticket__c st: stList){
            st.Status__c = 'Completed';
        }
        update stList;
        
    }

    //get sp ids for which status is changed to cmpleted.
    public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap){
        //prepare the set of sp ids for which status is changed to completed
        set<id> spIds = new set<id>();
        for(Salesforce_Project__c sp: spTriggerNew){
            //check if status changed and new status is completed
            if(sp.Status__c == 'Completed' && sp.Status__c != spTriggerOldMap.get(sp.Id).Status__c){
                spIds.add(sp.Id);
            }
        }

        if(!spIds.isEmpty()){
            //call future method to complete all the tickets of all the projects in spIds.
            updateTickets(spIds);
        }
    }

    

}