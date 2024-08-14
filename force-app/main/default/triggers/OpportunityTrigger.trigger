trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {

    if(Trigger.isBefore && Trigger.isInsert){
        //set order number field
        //call a method to update order number field
        OpportunityTriggerHandler.updateOrderNumber(Trigger.new); //passing only trigger.new because we are calling this ONLY while BEFORE INSERT.
    }

}