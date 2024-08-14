SoqlDemo3.soql11();

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