AccountUpdateQue aq = new AccountUpdateQue(); //new instance with NO parameters
//enqueue 
System.enqueueJob(aq);

List<account> acc = [select id, name from account limit 50];
AccountUpdateQue aq2 = new AccountUpdateQue(acc); //new instance with list of account as params
id jobId = System.enqueueJob(aq2);
system.debug('job id is ' + jobId);