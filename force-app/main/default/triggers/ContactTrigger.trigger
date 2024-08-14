trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
    system.debug('--start--');


    //1. Once lead source is Partner Referral -> contact is freezed. We cannot update ANY field of contact if LeadSource is already Partner Referral.
        // ex: contact1 -> leadSource is blank right now. 
                      //-> user is updating LeadSource = Partner Referral and SAVE. Should this work? YES.
                      //-> user is updating email address (LeadSource is already Partner Referral). Should this work? NO.
                      //-> user is updating LeadSource to Customer - Direct (LeadSource is already Partner Referral). Should this work? No.

    if(Trigger.isBefore && Trigger.isUpdate){
        //call handler method to check if leadsource is already partner referral, if so, then throw error.
        ContactTriggerHandler.validateLeadSource1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        ContactTriggerHandler.validateLeadSource2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if(Trigger.isAfter){
        //call method to calculate number of contacts.
        ContactTriggerHandler.countContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    //print that EMAIL is changed. Print old email value and New value both.
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     for (Contact newContact : trigger.new) {
            
    //         //how to check if EMAIL is changed? 
    //         Contact oldContact = Trigger.oldMap.get(newContact.Id);
    //         if(newContact.Email !=  Trigger.oldMap.get(newContact.Id).Email){
    //             system.debug('EMAIL Update ALERT... Previous Email: ' + oldContact.Email + ', Updated Email: ' + newcontact.Email);
    //         }
    //     }
    // }

    // if(Trigger.isBefore){
    //     system.debug('contact BEFORE trigger called. (before insert and before update)');
    //     //DO SOMETHING while before insert/before update BOTH. So write it HERE.

    //     if(Trigger.isInsert){
    //         system.debug('=====BEFORE INSERT=====');
    //         system.debug('Trigger.New: ' + trigger.new);
    //         system.debug('Trigger.Old: ' + trigger.old);
    //         system.debug('Trigger.NewMap: ' + trigger.newMap);
    //         system.debug('Trigger.OldMap: ' + trigger.oldMap);
    //     }
    //     if(Trigger.isUpdate){
    //         system.debug('=====BEFORE UPDATE======');
    //         system.debug('Trigger.New: ' + trigger.new);
    //         system.debug('Trigger.Old: ' + trigger.old);
    //         system.debug('Trigger.NewMap: ' + trigger.newMap);
    //         system.debug('Trigger.OldMap: ' + trigger.oldMap);
    //     }

    //     ////DO SOMETHING while before insert/before update BOTH. So write it HERE.
    // }

    // if(Trigger.isAfter){
    //     system.debug('contact AFTER trigger called. (AFTER insert and AFTER update)');
    //     if(Trigger.isInsert){
    //         system.debug('=======AFTER INSERT =======');
    //         system.debug('Trigger.New: ' + trigger.new);
    //         system.debug('Trigger.Old: ' + trigger.old);
    //         system.debug('Trigger.NewMap: ' + trigger.newMap);
    //         system.debug('Trigger.OldMap: ' + trigger.oldMap);
    //     }
    //     if(Trigger.isUpdate){
    //         system.debug('=======AFTER UPDATE ======');
    //         system.debug('Trigger.New: ' + trigger.new);
    //         system.debug('Trigger.Old: ' + trigger.old);
    //         system.debug('Trigger.NewMap: ' + trigger.newMap);
    //         system.debug('Trigger.OldMap: ' + trigger.oldMap);
    //     }
    // }

    system.debug('--end--');
}