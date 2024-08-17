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


## Batch