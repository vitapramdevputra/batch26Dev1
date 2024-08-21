public class AccountUpdateBatch implements database.Batchable<sObject>, Database.stateful{

    integer totalRecords = 0;
    integer totalSuccessRecords = 0;
    integer totalErrorRecords = 0;

    //executes FIRSTS. We write query and get records.
    public Database.QueryLocator start(Database.BatchableContext bc){
        //queryLocator can divide the records in CHUNKs.
        Database.QueryLocator q1 = Database.getQueryLocator([select id, name, description, active__c from account]);
        return q1;
    }

    public void execute(Database.BatchableContext bc, List<account> scope){
        system.debug('EXECUTE START... scope size: ' + scope.size());
        totalRecords += scope.size();
        //update records here.
        for(account acc: scope){
            //updating description field
            acc.Description += '...updated via batch'; //appending...
        }
        //update all the accounts in scope
        //update scope; //either update all or none
        List<Database.SaveResult> results = Database.update(scope, false); //all or none is false. Means update the good ones, and error the bad ones.

        integer successCount = 0;
        integer errorCount = 0;

        for(Database.SaveResult rs: results){
            if(rs.isSuccess()){
                successCount++;
            } else {
                errorCount++;
                system.debug('some error happend. SaveResult is not success.');
            }
        }
        totalSuccessRecords += successCount;
        totalErrorRecords += errorCount;
        system.debug('** total records processed successfully: ' + successCount + '  ... error records: ' + errorCount);
        System.debug('TOTAL RECORDS: ' + totalRecords + ' -- TOTAL SUCCESS: ' + totalSuccessRecords + ' -- TOTAL ERRORS: ' + totalErrorRecords);
        
    }

    //executes at the END. When all the records are processed.
    public void finish(Database.BatchableContext bc){
        system.debug('FINISH METHOD.');
        System.debug('FINISH ::: TOTAL RECORDS: ' + totalRecords + ' -- TOTAL SUCCESS: ' + totalSuccessRecords + ' -- TOTAL ERRORS: ' + totalErrorRecords);

    }


}