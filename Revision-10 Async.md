# Aynchronous Apex

- Four types of async in apex
    - Future, Batch, Queueable, Schedulable

## Future method
- added to the queue and works when system has resources available.
- how can we make a method as future?
    - annotate with `@future`
    - some rules for future method 
        - no sobject OR object in parameters. It accepts only primitive datatype, or collection of primitive datatype.
        - must be static
        - returns void ALWAYS.

## Interface 
- interface is like a class where NO method is defined. 
- methods are JUST declared, meaning given signature (return type, name, parameters)
- the class which implements interface must implements all the methods present in interface.
- we create interface when we are architecting the WHOLE code (advance developer)
- we USE interface with `Batch`, `Queueable`, and `Schedulable`

## Batch
- why Batch? when to use Batch?
    - we use batch when we want to process lots of records (thousands) or if we are hitting governor limits in couple hundred records and we want to process a LOT of them, then we use batch.
- what does Batch apex do? how does it help in process lots of records?
    - it divides the records in different groups (chunks or batches) and processes each group of records indivially with full set of governor limits.
- how to implement batch?
    - first we have to implement an interface...
        - `implements Database.batchable<sObject>, Database.stateful`
        - with interface comes methods to implement
            - `start, execute, finish`
    - how can we get the analysis of the full batch accross the executions?
        - example: we got 10k records in start -> we are dividing it 1000 records for each chunk.
            - in finish method we want to print total number records updated successfully. 
        - we must implement `Database.stateful` if we want to get analysis like this.
- how to start the batch apex?
    - `Database.executeBatch(new batchClass());` //the default number is 200
    - `Database.executeBatch(new batchClass(), 500);`

## Schedulable
- What is it?
    - if we want to schedule a certain time or frequency at which we want to apex code then we use schedulable
- how to implement?
    - `implements Schedulable`
    - the method that we MUST implement is `execute(SchedulableContext sc)`
- how to start the schedule?
    - from UI > go to apex class > schedule apex > create a new schedule
    - CRON expression
        -