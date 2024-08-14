trigger DepartmentTrigger on Department__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //call method to create an employee
        DepartmentTriggerHandler.createHODEmployee(Trigger.new);
    }
}