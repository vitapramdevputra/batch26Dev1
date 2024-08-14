trigger CaseTrigger on Case (before insert) {

    system.debug('case before insert trigger called. # of records: ' + trigger.size);
    //print how many times this trigger is running.
    //print total records processed.
    //or all the records in ONE LIST.

    CaseTriggerHandler.countTrigger++; //increase by 1.
    CaseTriggerHandler.countRecords += trigger.size; //adding and assinging.

    system.debug('# of times trigger ran: ' + CaseTriggerHandler.countTrigger);
    system.debug('total # of records processed ' + CaseTriggerHandler.countRecords);
    
}