public class SoqlDemo2 {
    public static void soql5(){
        List<account> accList = [select id, name, phone, type, active__c, Industry from account where Industry = 'Energy'];
        system.debug('acc list size: ' + accList.size());
    }

    public static void soql5(string industryFilter){
            //to use apex string as filter in SOQL use :variableName
        List<account> accList = [select id, name, phone, type, active__c, Industry from account where Industry = :industryFilter]; //apex :variable inside soql
        system.debug('acc list size: ' + accList.size());
        for(account eachAcc: accList){
            system.debug('account name: ' + eachAcc.Name);
            system.debug('account phone: ' + eachAcc.phone);
            system.debug('account type: ' + eachAcc.type);
            system.debug('account Industry: ' + eachAcc.Industry);
            system.debug('--------');
        }
    }

    public static void soql6(){
        list<contact> allCon = [select id, name , email, phone, accountid, account.name, account.industry, account.type, account.phone from contact ];
        for(contact eachCon: allCOn){
            system.debug('each contact name, phone, email: ' + eachCon.Name + ', ' + eachCon.Phone + ', ' + eachCon.Email);
            system.debug('account name, industry, phone: ' + eachCon.account.Name + ', ' + eachCon.account.Industry + ', ' + eachCon.account.Phone);
            system.debug('-----');
        }

    }

    public static void soql7(){
        List<Salesforce_Ticket__c> allST = [SELECT Id, Name, Subject__c, Status__c, Salesforce_Project__c, Salesforce_Project__r.Project_Name__c,Salesforce_Project__r.Status__c  FROM Salesforce_Ticket__c];
        for(Salesforce_Ticket__c eachST: allST){
            system.debug('Salesforce Ticket Id is: ' + eachST.Id + ', Salesforce Ticket name is ' + eachST.Name + ', subject: ' + eachST.subject__c);

            system.debug('Salesforce Project name, status : ' + eachST.Salesforce_Project__r.Project_Name__c + ', ' + eachST.Salesforce_Project__r.Status__c);
        } 
    }
}