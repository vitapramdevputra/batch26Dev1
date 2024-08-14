public class AccountTriggerHandler {
    
    public static void updateDescription(List<account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
         for (Account newAccount : accTriggerNew) {
            if(Trigger.isInsert){
                if(newAccount.Active__c == 'Yes'){
                    newAccount.Description = 'Account is active. Enjoy buddy...';
                }
            }
            if(Trigger.isUpdate){
                //Active field is changed to Yes.
                    //1. check if active field is changed.
                    //2. trigger.new active == yes
                if(newAccount.Active__c != accTriggerOldMap.get(newAccount.Id).Active__c && newAccount.Active__c == 'Yes'){
                     newAccount.Description = 'Account is NOW active. Enjoy buddy...';
                }
            }
        }
    }

    public static void updateContactsVIP(List<account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        
        //some wrong code. Never have SOQL or DML inside LOOP. 
        // for (Account newAcc : accTriggerNew) {
        //     //check if VIP is changed.
        //     if (newAcc.vip__c != accTriggerOldMap.get(newAcc.Id).vip__c) {
        //         //update VIP in all contacts of this account.
        //         list<contact> allContacts = [select id, vip__c from contact where AccountId = :newAcc.Id];
        //         for (Contact eachContact : allContacts) {
        //             eachContact.vip__c = newAcc.vip__c;
        //         }
        //         update allContacts;
        //     }
        // }

        //prepare a set<id> with all accounts where VIP is changed.
        set<id> accountIdVIP = new set<id>();
        for (Account newAcc : accTriggerNew) {
            //check if VIP is changed.
            if (newAcc.vip__c != accTriggerOldMap.get(newAcc.Id).vip__c) {
               accountIdVIP.add(newAcc.Id);
            }
        }

        list<contact> allContacts = [select id, name, vip__c, AccountId from Contact where accountid in :accountIdVIP];
        for (Contact eachContact : allContacts) {
            //update vip of eachContact same as account's VIP field.
                //we can get account's VIP field value from NewMap.

            eachContact.vip__c = accTriggerNewMap.get(eachContact.AccountId).vip__c;
            
        }
        update allContacts;

    }

    public static void validateActiveAccount(List<account> accTriggerOld){
        //while in delete...we can throw error in old and oldMap.
            //while in insert/update...we throw error in new or newmap.
        for (Account oldAcc : accTriggerOld) {
            if (oldAcc.Active__c == 'Yes') {
                oldAcc.addError('Cannot delete active account.');
            }
        }
    }

    public static void sendEmailUndelete(List<account> accTriggerNew) {
       List<Messaging.SingleEmailMessage> emails = new list<Messaging.SingleEmailMessage>(); 
       
       for (Account newAcc : accTriggerNew) {
            Messaging.SingleEmailMessage em = new Messaging.SingleEmailMessage();
            em.setSubject('Account is restored successfully. ' + newAcc.Name);
            em.setPlainTextBody('Hi there, account is restored. Please check.');

            List<string> toAddress = new list<string>();
            toAddress.add('contactvitap@gmail.com');
            toAddress.add( UserInfo.getUserEmail()); //userinfo class is used to get USER's information.
            
            em.setToAddresses(toAddress);

            emails.add(em);
       }
       Messaging.sendEmail(emails, true);
    }

    public static void updateDescriptionUndelete(List<account> accTriggerNew) {

        //AccountTrigger: execution of AfterUndelete caused by: System.FinalException: Record is read-only Class.AccountTriggerHandler.updateDescriptionUndelete: line 89, column 1 Trigger.AccountTrigger: line 27, column 1

        list<account> updateAcc = new list<account>();
        //trigger.new is READ ONLY in AFTER Triggers.
        for (Account eachAcc : accTriggerNew) {
            Account a = new account();
            a.Id = eachAcc.Id;
            a.Description = 'Account is undeleted successfully';
            updateAcc.add(a);
        }
        //If we want to update the same record in after trigger, we HAVE to DO DML.
        update updateAcc;//DML. Fire account trigger again. 
    }


}