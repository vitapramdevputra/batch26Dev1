account a = new account(name = 'Sun');  //good guy
account b = new account(name = 'Moon'); //good guy
account c = new account();              //bad guy    

list<account> accs = new list<account> {a,b,c};

//insert accs; //will this work? and if yes, how many account records will it create?
             //will throw error. Will it insert any account record? WiLL revert. AND NOT create any record.
             //All or none. if one fails, then all fails.


//good guys will be inserted and bad ones will suffer
//if one fails, ONLY ONE WILL FAIL, all others will pass.
//to do that we will use database methods.
//Database.insert(accs, true);  //allOrNone true will behave similar to normal INSERT DML.
List<Database.SaveResult> results = Database.insert(accs, false); //allOrNone false will serve justice to good guys.
for (Database.SaveResult eachResult : results) {
    //check if success
    if(eachResult.isSuccess()){
        system.debug('account inserted successfully. Acc id:  ' + eachResult.id);
    }else {
        system.debug('ERROR: ' + eachResult.getErrors());
    }
    
}