public class SoqlDemo3 {
    //parent to child soql
    public static void soql8(){
        list<Account> accList = [select id, name, type, annualrevenue, (select name, stagename, amount from Opportunities) from account];
        for(account acc: accList){
            system.debug('=======');
            system.debug('acc name, type, annualrevenue => ' + acc.Name + ', ' + acc.Type + ', ' + acc.AnnualRevenue);
            //we get LIST of opportunities (child or subquery)
            List<Opportunity> accOpps = acc.Opportunities;
            for(Opportunity eachOpp: accOpps){
                system.debug('---- opp name, stagename, amount: ' + eachOpp.Name + ', ' + eachOpp.StageName + ', ' + eachOpp.Amount);
            }
        }
    }

    //parent to child soql
    public static void soql9(){
        list<Account> accList = [select id, name, type, annualrevenue, (select name, stagename, amount from Opportunities where stagename = 'Closed Won') from account];
        for(account acc: accList){
            system.debug('=======');
            system.debug('acc name, type, annualrevenue => ' + acc.Name + ', ' + acc.Type + ', ' + acc.AnnualRevenue);
            //we get LIST of opportunities (child or subquery)
            List<Opportunity> accOpps = acc.Opportunities;
            decimal oppAmount = 0;
            for(Opportunity eachOpp: accOpps){
                system.debug('---- opp name, stagename, amount: ' + eachOpp.Name + ', ' + eachOpp.StageName + ', ' + eachOpp.Amount);
                oppAmount += eachOpp.Amount; 
                //am = 0 + 50; => am = 50;
                //am = 50 + 60 => am = 110;
                //am = 110 + 75 => am = 185;

            }
            system.debug('*** TOTAL Closed won OPP AMOUNT for this account is : ' + oppAmount);
        }
    }

    public static void soql10(){
        //parent to child for department and employee.
            //print number of employees and total salary in each department. Along with department(name) and employee details(firstname, lastname, salary, country).
        
        list<Department__c> depList = [select id, name__c, (select first_name__c, last_name__c, salary__c, country__c from Employees__r) from Department__c];
        for(Department__c eachDep: depList){
            system.debug('-------');
            system.debug('department name: ' + eachDep.Name__c);

            integer empCount = 0;
            decimal depSalary = 0;
            for(Employee__c eachDepEmp: eachDep.Employees__r){
                system.debug('==== emp name, salary, country: ' + eachDepEmp.First_Name__c + ' ' + eachDepEmp.Last_Name__c + ', ' + eachDepEmp.Salary__c + ', ' + eachDepEmp.Country__c);
                empCount++;
                depSalary += eachDepEmp.Salary__c;

            }

            system.debug('*** # of employees in ' + eachDep.Name__c + ' is ' + empCount);
            system.debug('*** total salary of employees in ' + eachDep.Name__c + ' is ' + depSalary);

        }
    }

    //aggregate query
    public static void soql11(){
        //when we use aggregate function in SOQL , we get AggregateResult object.
        
       List<AggregateResult> aggList = [select count(id), SUM(salary__c), AVG(salary__c), country__c from employee__c  group by country__c HAVING count(id) > 3];
       system.debug('agglist: ' + aggList);
       for(AggregateResult eachResult: aggList){
            system.debug('COUNTRY : ' + eachResult.get('country__c'));
            system.debug('number of employee in this country is ' + eachResult.get('expr0'));
            system.debug('sum of salary of employee in this country is ' + eachResult.get('expr1'));
            system.debug('avg salary of employee in this country is ' + eachResult.get('expr2'));
       }
    }
}