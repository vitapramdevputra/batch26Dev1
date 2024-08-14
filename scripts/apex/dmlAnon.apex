DmlDemo2.dml11BulkInsert();
DmlDemo2.dml10BulkRight();
 DmlDemo2.dml8(); // 1 DML
// DmlDemo.dml1(); // 1 DML
// DmlDemo.dml3(); // 1 DML
// DmlDemo.dml4Update(); // 2 DML


// Account acc = [select id, name from account order by createddate limit 1];
// Opportunity opp = new Opportunity();//create new instance.
// opp.Name = 'test opp';
// opp.CloseDate = date.today();
// opp.StageName = 'Negotiation';
// opp.AccountId = acc.Id; //to establish relationship.
// insert opp;


//create opportunity for latest 200 created accounts
// list<account> accList = [select id, name from account order by createddate desc limit 200];
// List<Opportunity> newOpp = new List<Opportunity>();
// for(account eachAcc: accList){
//     Opportunity opp = new Opportunity();//create new instance.
//     opp.Name = 'test opp ' + eachAcc.Name;
//     opp.CloseDate = date.today();
//     opp.StageName = 'Prospecting';
//     opp.AccountId = eachAcc.Id; //to establish relationship.
//     newOpp.add(opp);
// }
// insert newOpp;


//to update any record we NEED id. Do soql to get IDs.
List<Opportunity> oppList2 = [select id, name, stagename from opportunity order by createddate desc limit 200];
//update stagename to 'Qualification'
for(opportunity opp: oppList2){
    opp.StageName = 'Qualification';
    opp.Description = 'Updated opp'; //setting the value. To JUST set the value, we don't need to have it in the LIST.
}
update oppList2;



//get latest 200 opportunity
//update stagename to 'Negotiation/Review' if name of opp has '0' or '1' in it.
List<Opportunity> oppList = [select id, name, stagename from opportunity order by createddate desc limit 200];
//120 opp has 0 or 1 in it => so update JUST 120 opp. 
List<Opportunity> toUpdateOpp = new List<Opportunity>();
for(Opportunity opp: oppList){
    if(opp.Name.contains('0') || opp.Name.contains('1')){
        opp.StageName = 'Negotiation/Review';
        toUpdateOpp.add(opp);
    }
}
//update
update toUpdateOpp;

//update oppList; //why NOT THIS?


//delete 100 latest created opp
delete [select id from opportunity order by createddate desc limit 100];


List<Opportunity> delOpp = [select id, name from opportunity where isDeleted = true ALL ROWS];
system.debug('del opp: ' + delOpp);
system.debug(delOpp.size());

//to restore we have to use undelete DML
undelete delOpp;