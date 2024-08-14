SoqlDemo2.soql7();
SoqlDemo2.soql5(); //always filter with Energy
SoqlDemo2.soql5('Energy');
SoqlDemo2.soql5('Apparel');
SoqlDemo2.soql5('Construction');
SoqlDemo.soql4();

list<string> listStr = new list<string>{'apex'};
string str = 'apex';


List<account> listAcc;
Account acc; //maximum 1 record is allowed


 List<opportunity> oppList = [select id, name, stagename, accountid, account.name, account.type, account.annualrevenue, amount from opportunity];
    for(opportunity opp: oppList){
        system.debug('--------');
        system.debug('name: ' + opp.name + ', stagename: ' + opp.stagename + ', amount: ' + opp.amount);
        system.debug('acc name: ' + opp.account.name + ' acc type, and annual revenue: ' + opp.account.type + ', and ' + opp.account.annualrevenue);
    }


