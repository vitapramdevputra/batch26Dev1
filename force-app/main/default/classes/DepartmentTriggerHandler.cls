public class DepartmentTriggerHandler {

    public static void createHODEmployee(List<Department__c> depTriggerNew) {
        //check if department's HOD field is not empty then create a new employee.
        List<Employee__c> newEmpList = new List<Employee__c>();

        for (Department__c newDep : depTriggerNew) {
            if (String.isNotEmpty(newDep.Head_Of_Department__c)) {
                Employee__c emp = new Employee__c();
                emp.First_Name__c = newDep.Head_Of_Department__c;
                emp.Salary__c = 150000;
                emp.Email__c = 'hod@hod.com';
                emp.Department__c = newDep.Id;

                newEmpList.add(emp);
            }
        }

        insert newEmpList;
    }
}