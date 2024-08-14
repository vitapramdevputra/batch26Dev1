trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        //call method to create default ticket.
        SPTriggerHandler.createDefaultTicket(Trigger.new);
    }

    //validation on completing project.
    if (Trigger.isBefore && Trigger.isUpdate) {
        //check if all the tickets completed for this project, then ONLy allow to complete the project, else throw error.
        SPTriggerHandler.validateProjectCompletion(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    }
}