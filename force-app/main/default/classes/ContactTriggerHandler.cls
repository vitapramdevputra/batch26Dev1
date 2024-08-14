public class ContactTriggerHandler {
    public static void validateLeadSource1(list<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        //looping each new contact
        for (Contact newContact : conTriggerNew) {
            //check if LeadSource WAS already Partner Referral.
            //old contact's lead source => Partner Referral => then throw error.

            Contact oldContact = conTriggerOldMap.get(newContact.Id);
            if(oldContact.LeadSource == 'Partner Referral'){
                newContact.addError('Cannot update the contact when Lead Source is Partner Referral.');
            }
        }
    }

    public static void validateLeadSource2(list<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        for (Contact newContact : conTriggerNew) {
            //check if lead source is changed.
            if (newContact.LeadSource != conTriggerOldMap.get(newContact.Id).LeadSource) {
                newContact.LeadSource.addError('Lead Source cannot be changed. Go away user.');
            }
        }
    }

    public static void countContacts(list<contact> conTriggerNew, List<contact> conTriggerOld, Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {

        //new set of accountids. 
        //capture all account ids for which we want to recalculate the number of contacts.
        set<id> accountIds = new set<id>();

        //for insert and undelete, check if account id is present, and add account id to set<id>
        if(Trigger.isInsert || Trigger.isUndelete){
            for (Contact newContact : conTriggerNew) {
                //check if account is present.
                if(newContact.AccountId != null){
                    //add account id to the set.
                    accountIds.add(newContact.AccountId);
                }
            }
        }
        //for delete, check if accound id is present in OLD CONTACT. and add account id to set
        if(Trigger.isDelete){
            for (Contact oldContact : conTriggerOld) {
                if(oldContact.accountId != null){
                    accountIds.add(oldContact.AccountId);
                }
            }
        }

        //for update, if account id is CHANGED. Then add old accountid and new account id to the set of accountids.
        if(Trigger.isUpdate){
            for (Contact newContact : conTriggerNew) {
                //old contact's account id USING oldMap.
                id oldContactAccId = conTriggerOldMap.get(newContact.id).AccountId;
                //check if accountid field is changed.
                if(newContact.AccountId != oldContactAccId){
                    //check if new contact account is not null.
                    if(newContact.AccountId != null){
                        accountIds.add(newContact.AccountId);
                    }

                    //check if OLD contact account is not null
                    if(oldContactAccId != null){
                        accountIds.add(oldContactAccId);
                    }
                }
            }
        }


        //with the set of account ids, we will get all the contacts. And we will update number of contact's field on account.
        system.debug('accountids: ' + accountIds);

        List<account> allAcc = [select id, name, (select name from contacts) from account where id in :accountIds];

        for (Account eachAcc : allAcc) {
            integer countContact = 0;
            if(eachAcc.contacts != null){
               countContact = eachAcc.contacts.size();
            }
            eachAcc.number_of_contacts__c = countContact;
        }
        update allAcc;

    }
}