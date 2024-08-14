public class EmployeeTriggerHandler {
   public static void validateJoinDate(List<Employee__c> empTriggerNew) {
        for (Employee__c newEmp : empTriggerNew) {
            //if join date is blank -> set it to today's date.
            if (newEmp.JoinDate__c == null) {
                newEmp.JoinDate__c = date.today();
            }
            //if join date is in future -> then throw validation.
            else if(newEmp.JoinDate__c > date.today()){
                newEmp.addError('Join date cannot be in future.');
            }
            
        }
   }
}