public class AccountSchedule implements Schedulable{
    //schedulable JUST have ONE method...execute (no start, finish)
    public void execute(SchedulableContext sc){
        //whatever code we write here will execute at the given time.
        AccountUpdateBatch accBatch = new AccountUpdateBatch();
        Database.executeBatch(accBatch);
    }
}