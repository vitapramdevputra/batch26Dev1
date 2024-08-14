public class SoqlDemo {
    public static void soql1(){
        List<account> listAcc = [select id, name, phone from account limit 5];
        system.debug(listAcc);
        system.debug('number of records: ' + listAcc.size());
    }

    public static void soql2(){
        List<contact> listCon = [select id, name, email from contact limit 5];
        system.debug(listCon);
        system.debug('number of records: ' + listCon.size());
    }

    public static void soql2_2(){
        List<employee__c> listEmp = [select id, name, first_name__c, salary__c from employee__c limit 5];
        system.debug(listEmp);
        system.debug('number of records: ' + listEmp.size());
    }

    public static void soql3(){
        //SOQL always returns a LIST --> this is always a true statement.
        List<Account> listAcc = [select id, name from account limit 1]; //we are getting JUST 1 account.
        system.debug(listAcc);
        //one extra thing to know
        //SOQL can return JUST 1 record also
        //if our query is returning just 1 record, then we can save it in Account without list.
        //if our query is returning more than 1 record, then we CANNOT directly save it in account, we must use list.
        Account acc = [select id, name from account limit 1]; //we are getting JUST 1 account.
        //Account acc2 = [select id, name from account  where name = 'GenePoint'];
        system.debug('acc: ' + acc);
        //get name from account
        string name1 = acc.name; //this will give us name field value of acc
        system.debug('acc name: ' + name1);

        Employee__c emp = [select id, name, first_name__C,Salary__c from Employee__c limit 1];
        system.debug('emp: ' + emp);
        //print emp first name here.
        system.debug('emp first name: ' + emp.First_Name__c);
        system.debug('emp salary: ' + emp.Salary__c);//will this work?
    }

    public static void soql4(){
        list<account> listAcc = [select id, name, phone, accountnumber, Active__c from account limit 5];
        //print name, phone and accountnumber for all the accounts.
        for(Account eachAcc: listAcc){
            system.debug('acc name: ' + eachAcc.Name);
            string accPhone = eachAcc.Phone;
            system.debug('acc phone: ' + accPhone);
            system.debug('acc number: ' + eachAcc.AccountNumber);
            //will this work? 
            if(eachAcc.Active__c == 'Yes'){ //we are trying to read the value, but we are NOT querying it in SOQL
                system.debug('account is active.');
            } else {
                system.debug('account is NOT active');
            }
            system.debug('----------');
        }
    }
}