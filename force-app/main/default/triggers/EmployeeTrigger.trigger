trigger EmployeeTrigger on Employee__c (before insert, after insert, before update, after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        //call method to validate join date not in future.
        EmployeeTriggerHandler.validateJoinDate(trigger.new);
    }
}