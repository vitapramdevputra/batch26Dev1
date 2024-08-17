# Exception handling, Database dml methods

## Try-Catch

     - code might have any run time error because of some external factors.
     - if we do not catch the errors it will throw unexpected error and code stop working, it won't finish.
     - when we catch the errors the code completes the execute and doesnot throw any unexpected error.

- Built-in exceptions
    - `NullPointer Exception`
    - `LimitException`
    - `MathException`
    - `ListException`
    - `DML Exception`
    - general exception `Exception`

## Datebase.insert(list<sObject>, allOrNone)
    - //good guys will be inserted and bad ones will suffer
    - //if one fails, ONLY ONE WILL FAIL, all others will pass.
    - //to do that we will use database methods.
    - //Database.insert(accs, true);  //allOrNone true will behave similar to normal INSERT DML.
    ```account a = new account(name = 'Sun');  //good guy
        account b = new account(name = 'Moon'); //good guy
        account c = new account();              //bad guy    

        list<account> accs = new list<account> {a,b,c};

        //insert accs; //will this work? and if yes, how many account records will it create?
                    //will throw error. Will it insert any account record? WiLL revert. AND NOT create any record.
                    //All or none. if one fails, then all fails.



        List<Database.SaveResult> results = Database.insert(accs, false); //allOrNone false will serve justice to good guys.
        for (Database.SaveResult eachResult : results) {
            //check if success
            if(eachResult.isSuccess()){
                system.debug('account inserted successfully. Acc id:  ' + eachResult.id);
            }else {
                system.debug('ERROR: ' + eachResult.getErrors());
            }
            
        }
        ```