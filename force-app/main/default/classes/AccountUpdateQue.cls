public class AccountUpdateQue implements Queueable{
    list<account> listAcc = new list<account>();
    
    //constructor
    public AccountUpdateQue() {

    }
    public AccountUpdateQue(List<account> listAcc){
        this.listAcc = listAcc;
        system.debug('** constructor called');
    }

    public void execute(QueueableContext qc){
        system.debug('accounts to process: ' + listAcc);
        for (Account acc : listAcc) {
            acc.Name += ' -- SI';
        }
        //update listAcc; 
        Database.update(listAcc, false);
    }
}