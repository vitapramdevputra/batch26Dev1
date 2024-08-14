# SOQL

- Salesforce Object query language. It helps us to retrieve data from any custom or standard object. 
- We want to get name, id, phone from accout object, what will be our SOQL query
    - `SELECT id, name, phone from account`
    - `select id, name, first_name__c from Employee__c`

- Features of SOQL
    - Filters
        - we just want to get account whose annualrevenue is less than 50000000.
        - `where`
        - `SELECT id, name, phone, annualrevenue from account where annualrevenue < 50000000`
         - we just want to get account whose annualrevenue is more than 50000000 and Active is 'yes'
         - `SELECT id, name, phone, annualrevenue, active__c from account where annualrevenue > 50000000 and active__c = 'yes'`
         - retrieve Employee who are from USA or AUS, and Salary is less than 1000000
            - `select id, name, first_name__c, salary__c,country__c from employee__c where salary__c <1000000 and (country__c='USA' or country__c='AUS')`
            - `select id, name, first_name__c, salary__c,country__c from employee__c where salary__c <1000000 and country__c IN ('USA','AUS')`
         - retrieve Employee who are from USA or AUS, and Salary is less than 1000000  OR
            country is NULL or India and Salary is more than 300000
            - `select id, name, first_name__c, salary__c,country__c from employee__c where (salary__c <1000000 and country__c IN ('USA','AUS')) OR (salary__c >300000 and country__c IN ('India',''))`
    - Order by
        - we can sort records
            - `select id, name, first_name__c, salary__c,country__c from employee__c where (salary__c <1000000 and country__c IN ('USA','AUS')) OR (salary__c >300000 and country__c IN ('India','')) ORDER BY salary__c desc`
    - LIMIT
        - `select id, name, first_name__c, salary__c,country__c from employee__c ORDER BY salary__c desc LIMIT 1`
    - Date literals
        - `select id, name, first_name__c, joindate__c from employee__c where joindate__c = LAST_N_MONTHS:3`
        - `select id, name, first_name__c, joindate__c from employee__c where joindate__c = THIS_WEEK`
        - `select id, name, first_name__c, joindate__c from employee__c where joindate__c = YESTERDAY`
- SOQL in Apex
    ```
    list<employee__c> listEmp = [select id, name, first_name__c, joindate__c from employee__c where joindate__c = LAST_N_MONTHS:3];
    //we can always save the result of SOQL as a list, even if SOQL is returning 0 or 1 or 10 or any number of records.

    //we can save the SOQL as JUST SOBJECT if SOQL if returning exactly 1 record. [optional]
    employee__c  emp        = [select id, name, first_name__c, joindate__c from employee__c Limit 1]; //possible

    //list will always work.
    list<employee__c> emp2 = [select id, name, first_name__c, joindate__c from employee__c Limit 1];
    ```

    ```
    list<employee__c> listEmp = [select id, name, first_name__c, joindate__c,salary__c from employee__c where joindate__c = LAST_N_MONTHS:3];
    for(employee__c e: listEmp){
        system.debug('first name: ' + e.first_name__c);
        system.debug('salary: ' + e.salary__c);
    }
    ```
- Apex variables in SOQL filter
    - use colon before apex variables
    ```
    string name = 'ABC';
    list<account> accList = [select id, name, type from account where name = :name];
    system.debug(accList);
    ```
- relationship SOQL (parent to child, child to parent)
    - CHILD TO PARENT
        - we are querying child record, and we want to get parent's info (child to parent)
        - `select id, name, stagename, accountid, account.name, account.type, account.annualrevenue, amount from opportunity`
        ```
        List<opportunity> oppList = [select id, name, stagename, accountid, account.name, account.type, account.annualrevenue, amount from opportunity];
        for(opportunity opp: oppList){
            system.debug('--------');
            system.debug('name: ' + opp.name + ', stagename: ' + opp.stagename + ', amount: ' + opp.amount);
            system.debug('acc name: ' + opp.account.name + ' acc type, and annual revenue: ' + opp.account.type + ', and ' + opp.account.annualrevenue);
        }
        ```
        - if we are using custom relationship fields then we have to use `__r` to get related object's field information.
            `select id, name, first_name__c, salary__c, department__r.name__c, department__c from employee__c`
    - PARENT TO CHILD
        - while querying parent, if we want get all the child records then we do a subquery (or innerquery)
            - `select id, name, phone, (select name, email from contacts ), (select subject,status, CaseNumber from cases) from account`
            ```
            List<account> listAcc = [ select id, name, phone, (select name, email from contacts ), (select subject,status, CaseNumber from cases) from account];
            for(account eachAcc: listAcc){
                system.debug('----');
                system.debug('each Acc: ' + eachAcc.Name +', phone: ' + eachAcc.Phone);
                //list<contact> accContacts = eachAcc.Contacts
                for(contact eachAccCon: eachAcc.Contacts){
                    system.debug('** eachAccCon name, email:  ' + eachAccCon.Name + ', ' + eachAccCon.Email);
                }
                for(case eachAccCase: eachAcc.Cases){
                    system.debug('## Case number: subject, status : ' + eachAccCase.CaseNumber + ': ' +eachAccCase.Subject + ', ' + eachAccCase.Status);
                }
            }
            ```

- SOQL aggregate 
    - `select count() from case` -- to get total cases in the org.
    - `select count(subject), count(Priority), count(ClosedDate) from case`
    - HAVING clause
        - `select count(subject), count(Priority), count(ClosedDate) from case HAVING count(subject) > 2`
    ```
    List<AggregateResult> aggList = [select count(subject), count(Priority), count(ClosedDate), Contact.Name from case group by contact.name];
    system.debug('aggList ' + aggList);
    for(aggregateresult eachResult: aggList){
        system.debug('------');
        system.debug('count of subject => ' +  eachResult.get('expr0'));
        system.debug('count of priority => ' +  eachResult.get('expr1'));
        system.debug('count of closedDate => ' +  eachResult.get('expr2'));
        system.debug('Contact name: ' + eachResult.get('Name'));
    }
    ```

