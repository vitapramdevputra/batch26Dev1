public class OpportunityTriggerHandler {
    
    public static void updateOrderNumber(List<Opportunity> oppTriggerNew) {
        for (Opportunity newOpp : oppTriggerNew) {
            if (String.isBlank(newOpp.OrderNumber__c)) {
                newOpp.OrderNumber__c = '1';
            }
        }
    }
}