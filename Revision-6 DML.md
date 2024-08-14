# DML

- what is DML?
    - Data manipulation language.
    - create/update/delete/undelete ANY object's records in apex

- Insert
    - write code to insert a contact record with firstname, lastname, email, phone
    ```
    //new instance
    Contact c = new contact();
    //set fields
    c.firstname = 'Tom';
    c.lastname = 'Tuesday';
    c.email = 'tom@tuesday.com';
    c.phone = '654321645';
    //dml
    insert c;
    system.debug(c);
    ```

- Update
    - update last name of 'Tom Tuesday' to 'Thursday'
    ```
    //get id of record using SOQL
    Contact c = [select name, email from contact where lastname = 'Tuesday' ORDER BY createddate desc limit 1];
    system.debug('soql c : ' + c);
    c.lastname = 'Thursday';
    c.email = 'tom@thrusday.com';
    update c;

    ```
- Insert related records
    - we got one account, and we want to create one opportunity in it.
        ```
        Account acc = [select id, name from account order by createddate limit 1];
        Opportunity opp = new Opportunity();//create new instance.
        opp.Name = 'test opp';
        opp.CloseDate = date.today();
        opp.StageName = 'Negotiation';
        opp.AccountId = acc.Id; //to establish relationship.
        insert opp;
        ```

- insert/update multiple records
    - if we want to insert/update multiple records we do it using LIST. 
    - why we should NOT write insert/update DML and SOQL inside loops?
        - because of limits. 150 DMLs are allowed in one transaction.
            - 100 SOQL query limit.
        - maximum number of records we can process in DMLs is 10k.
    ```
    //create opportunity for latest 200 created accounts
    list<account> accList = [select id, name from account order by createddate desc limit 200];
    List<Opportunity> newOpp = new List<Opportunity>();
    for(account eachAcc: accList){
        Opportunity opp = new Opportunity();//create new instance.
        opp.Name = 'test opp ' + eachAcc.Name;
        opp.CloseDate = date.today();
        opp.StageName = 'Prospecting';
        opp.AccountId = eachAcc.Id; //to establish relationship.
        newOpp.add(opp);
    }
    insert newOpp;
    ```

- Delete DML
    - `Delete [select id from account where active__c = 'No' limit 5]`;
- Undelete DML
    - get records using ALL ROWS. To use undelete we must have all the deleted records in list.
    - `list<account> acc = [select id from account isdeleted=true];`
    - `undelete acc;`