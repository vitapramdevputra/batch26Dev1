trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after undelete) {
    system.debug('---START---');

    //update description if account field active = 'Yes' (while insert) OR if active is changed to Yes
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
       AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    //update VIP of all contacts when VIP of account is updated.
        //to update VIP field of all contacts we need DML --> so after triggers.
    if (Trigger.isAfter && Trigger.isUpdate) {
        //call method to update VIP field of all contacts.
        AccountTriggerHandler.updateContactsVIP(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        //throw error if account is active.
        AccountTriggerHandler.validateActiveAccount(trigger.old);
    }

    if(Trigger.isUndelete){
        //send email when account is undeleted.
        AccountTriggerHandler.sendEmailUndelete(Trigger.new);
        
        //we want to update description field. account is undeleted.
        //call method to update description
        AccountTriggerHandler.updateDescriptionUndelete(Trigger.new);
    }
 




    system.debug('---END---');






    //  map<id, account> accNewMap = Trigger.newMap;
    //  map<id, account> accOldMap  = Trigger.oldMap;


    //  if(Trigger.isBefore && Trigger.isUpdate){
    //     //check if website is changed. If so, print something
    //     for (Account newAcc : Trigger.new) {
            
    //         //get old account
    //         Account oldAcc = Trigger.oldMap.get(newAcc.Id);

    //         //check if website field is changed.
    //         if(newAcc.Website != oldAcc.Website){
    //             system.debug('For account ' + newAcc.Name + ', website is changed to ' + newAcc.Website);
    //         }
    //     }
    //  }



     //if(Trigger.isAfter && Trigger.isUpdate){
        //print new and old account name
            //get keys from map -> set of ids from newMap or oldMap
            // set<id> accountIds = accNewMap.keySet();

            // for (Id eachId : accountIds) {
            //     system.debug('account ID is : ' + eachId);

            //     //get new account using newMap
            //     Account newAcc = accNewMap.get(eachId);

            //     //get old account using oldmap
            //     Account oldAcc = accOldMap.get(eachId);

            //     system.debug('NEW: account name: ' + newAcc.Name);
            //     system.debug('OLD: account name: ' + oldAcc.Name);
            // }

        // for (Account newAcc : Trigger.new) {
        //     system.debug('========');
        //     Id accId = newAcc.id;
        //     system.debug('NEW ==> account id: ' + newAcc.Id + ', Acc name: ' + newAcc.Name);

        //     Account oldAcc = accOldMap.get(accId);
        //     system.debug('OLD ==> account id: ' + oldAcc.Id + ', acc name: ' + oldAcc.Name);
            
        // }
    // }


    // if(Trigger.isBefore && Trigger.isInsert){
    //     system.debug('BEFORE INSERT Trigger.New: ' + Trigger.new); //Present. ID is null.
    //     system.debug('BEFORE INSERT Trigger.OLD: ' + Trigger.Old); //null.
    //     system.debug('BEFORE INSERT Trigger.NewMap: ' + accNewMap);//null because NO ID, no map.
    //     system.debug('BEFORE INSERT Trigger.OldMap: ' + accOldMap);// Null
    // }
    //  if(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('AFTER INSERT Trigger.New: ' + Trigger.new); //Present.
    //     system.debug('AFTER INSERT Trigger.OLD: ' + Trigger.OLD); //null
    //     system.debug('AFTER INSERT Trigger.NewMap: ' + accNewMap); //Present.
    //      system.debug('AFTER INSERT Trigger.OldMap: ' + accOldMap); //null
    // }

    // if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('BEFORE UPDATE Trigger.New: ' + Trigger.new); //Present
    //     system.debug('BEFORE UPDATE Trigger.OLD: ' + Trigger.Old); //Present
    //     system.debug('BEFORE UPDATE Trigger.NewMap: ' + accNewMap); //present
    //     system.debug('BEFORE UPDATE Trigger.OldMap: ' + accOldMap);
    // }
    //  if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('AFTER UPDATE Trigger.New: ' + Trigger.new); //Present
    //     system.debug('AFTER UPDATE Trigger.OLD: ' + Trigger.Old); //Present
    //     system.debug('AFTER UPDATE Trigger.NewMap: ' + accNewMap); //present
    //     system.debug('AFTER UPDATE Trigger.OldMap: ' + accOldMap);
    // }

    // if (Trigger.isAfter) {
    //     //inserting or updating MORE than 1 record will work and trigger.new will have all the records. 
    //     //so trigger.new is LIST<sobject> 
    //         //for account's trigger --> trigger.new is List<account>
    //     List<account> newAcc = trigger.new;
    //     system.debug('Newly INSERTED/UPDATED Data: ' + newAcc);
    //     system.debug('# of records inserted/updated: ' + newAcc.size());

    //     //lets print name and id of each account inserted/updated
    //     for (Account eachAcc : newAcc) {
    //         system.debug('acc id: ' + eachAcc.id + ', acc name: ' + eachAcc.Name);
    //     }

    // }


    //print system debug for EACH EVENT.


    // //INSERT
    // if(Trigger.isBefore && Trigger.isInsert){
    //     system.debug('account before insert trigger called.');
    // }
    // if(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('account after insert trigger called.');
    // }   


    // //UPDATE
    //  if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('account before Update trigger called.');
    // }
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('account after Update trigger called.');
    // } 

    
    



    // //print below ONLY while before
    // //system.debug('trigger.isBefore: ' + Trigger.isBefore); //this will be true when trigger is running in before context.
    // if(Trigger.isBefore){
    //     system.debug('account before insert trigger called.');
    // }
    // //print below ONLY while after
    // //system.debug('trigger.isAfter: ' + Trigger.isAfter); //this will be true when trigger is running in after context.
    // if(Trigger.isAfter){
    //     system.debug('account after insert trigger called.');
    // }
}