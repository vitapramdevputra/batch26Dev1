trigger LeadTrigger on Lead (before insert, before update) {
    if(trigger.isInsert){
        //only when we are inserting a record
        system.debug('lead before insert trigger called.');
    }
   
    if(Trigger.isUpdate){
        //only when we are updating a record
        system.debug('lead before update trigger called.');
    }
}