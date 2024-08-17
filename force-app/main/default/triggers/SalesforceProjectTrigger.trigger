trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        //call method to create default ticket.
        SPTriggerHandler.createDefaultTicket(Trigger.new);
        //call future method to update description
            //append in description - 'updated from future'(do it using future method)
        SPTriggerHandler.updateDescriptionFt(Trigger.newMap.keySet());

    }

    //validation on completing project.
    if (Trigger.isBefore && Trigger.isUpdate) {
        //check if all the tickets completed for this project, then ONLy allow to complete the project, else throw error.
        //SPTriggerHandler.validateProjectCompletion(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);

        //automatically mark all the tickets completed when project is completed.
            //use future method.
        
        SPTriggerHandler.spCompletedStatus(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    }    
}