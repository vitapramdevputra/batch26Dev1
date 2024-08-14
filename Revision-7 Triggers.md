# Trigger

- What is a trigger?
    - it is apex code, which runs automatically when record is saved (insert, update, delete, undelete)
    - we have write a triggers for every object
    - used for automation
        - creating/updated related records on parent(or child) record creation
        - sync with external system. (integration)
        - send email or chatter or validation or whatever action


- How to create trigger in VS CODE?
    - SFDX: Create apex trigger > specify name (SobjectnameTrigger)
    - update sobject in trigger

- Types of trigger
    - Before triggers and After triggers.
        - The use of before and after are different
    - These are NOT actual types. It is WHEN (or timeline) the CODE executes once we click on SAVE.
    - Before Trigger - executes Before the record is SAVED in Database.
    - After Trigger  - executes After the record is SAVED in Database.
    - CLICK ON SAVE ---> Order of execution starts 
        --> System Validation --> Before Triggers --> Custom Validation --> SAVED IN DB --> AFTER Triggers --> OTHER --> Committed

- Trigger Events
    - `trigger AccountTrigger on Account(before insert, after insert){}`
        - in above trigger `before insert` is ONE Event. `after insert` is Another Event.
        - `before update, after update, before delete, after delete, after undelete`
- Trigger Context Variables
    - Context variables gives us the CONTEXT in which our trigger is running
    - we get the details of why our trigger is running - why means because of which event? the record(s) was inserted? or updated? or deleted or undeleted?
        - we can also get information if trigger is running in before context or after context?
    - What all context variables we have studied so far?
        - `Trigger.isBefore` -> will be true when trigger is running in BEFORE context (before insert, before update, before delete)
        - `Trigger.isAfter` -> will be true when trigger is running in AFTER context (after insert, after update, after delete, after undelete)
        - `Trigger.isInsert` -> will be true when trigger is running while inserting record (before insert, after insert)
        - `Trigger.isUpdate` -> will be true when trigger is running while updating record (before update, after update)

    - Print specific event in trigger. For Lead Trigger
    ```
    trigger LeadTrigger on Lead(before insert, after insert, before update, after update){
        system.debug('--start--');
        if(Trigger.isBefore && Trigger.isInsert){
            system.debug('Lead before insert trigger called.');
        }
        if(Trigger.isAfter && Trigger.isInsert){
            system.debug('Lead after insert trigger called');
        }

        if(Trigger.isBefore && Trigger.isUpdate){
            system.debug('Lead before Update trigger called.');
        }
        if(Trigger.isAfter && Trigger.isUpdate){
            system.debug('Lead after Update trigger called');
        }

        system.debug('--end--');
    }
    ```
    - we can also use nested if conditions
    ```
     trigger LeadTrigger on Lead(before insert, after insert, before update, after update){
        system.debug('--start--');
        if(Trigger.isBefore){
            system.debug('BEFORE TRIGGER');
            if(Trigger.isInsert){
                system.debug('Lead before insert trigger called.');
            }
            if(Trigger.isUpdate){
                system.debug('Lead before Update trigger called.');
            }
        }

        if(Trigger.isAfter){
            system.debug('AFTER TRIGGER);
            if(Trigger.isinsert){
                 system.debug('Lead after insert trigger called');
            }
            if(Trigger.isUpdate){
                system.debug('Lead after Update trigger called');
            }
        }
        system.debug('--end--');
    }
    ```

- How to get newly inserted/updated data in trigger?
    - `trigger.new`
        - datatype of `trigger.new`?
            - `List<Sobject>`
            - if in Contact trigger, `List<contact> newContacts = trigger.new;`
    - In which following event `trigger.new` is present (not null)
        - Before Insert  -- trigger.new is present, ID is null.
        - After insert   -- present (not null)
        - Before update  -- present
        - After update   -- present
- How to get prior data in trigger? 
    - `trigger.old` we get previous value. Available only in updates.
        - `List<sObject>`
    - In which following event `trigger.old` is present (not null)
        - Before Insert  -- null
        - After insert   -- null
        - Before update  -- present
        - After update   -- present
    ```
    trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
        system.debug('---START---');
        if(Trigger.isBefore && Trigger.isInsert){
            system.debug('BEFORE INSERT Trigger.New: ' + Trigger.new); //Present. ID is null.
            system.debug('BEFORE INSERT Trigger.OLD: ' + Trigger.Old); //null.
        }
        if(Trigger.isAfter && Trigger.isInsert){
            system.debug('AFTER INSERT Trigger.New: ' + Trigger.new); //Present.
            system.debug('AFTER INSERT Trigger.OLD: ' + Trigger.OLD); //null
        }

        if(Trigger.isBefore && Trigger.isUpdate){
            system.debug('BEFORE UPDATE Trigger.New: ' + Trigger.new); //Present
            system.debug('BEFORE UPDATE Trigger.OLD: ' + Trigger.Old); //Present
        }
        if(Trigger.isAfter && Trigger.isUpdate){
            system.debug('AFTER UPDATE Trigger.New: ' + Trigger.new); //Present
            system.debug('AFTER UPDATE Trigger.OLD: ' + Trigger.Old); //Present
        }
    }
    ```
- two more context variable to help us write better code?
    - `trigger.newMap`, `trigger.oldMap`
    - what are these maps?
        - `Map<id, sobject>` - for newmap -> we get all the `trigger.new` records as value and their ID as KEY.
                             - for oldmap -> we get all the `trigger.old` records as value and their ID as KEY.
    - in which events these are available?
        - `trigger.newMap` --> before insert? It is NULL in before insert. Reason? No ID, no map.
                           --> after insert? Yes. It is avaiable. 
                           --> before/after update? Yes. It is available.

- Check if ANY ONE field is changed.
    ```
    trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
        system.debug('--start--');

        //print that EMAIL is changed. Print old email value and New value both.
        if(Trigger.isBefore && Trigger.isUpdate){
            for (Contact newContact : trigger.new) {
                
                //how to check if EMAIL is changed? 
                Contact oldContact = Trigger.oldMap.get(newContact.Id);
                if(newContact.Email != oldContact.Email){
                    system.debug('EMAIL Update ALERT... Previous Email: ' + oldContact.Email + ', Updated Email: ' + newcontact.Email);
                }
            }
        }
        system.debug('--end---');
    }
    ```

- Trigger implementation (automation)
    - When to use before triggers?
        - to update fields of same record which is inserted/updated we use BEFORE TRIGGERS
        - VALIDATION
            - it is recommended to implement validation in Before triggers.
    - Example: when new Oppo is created > set Order Number field to 1 if it is blank
        - we will make trigger and triggerHandler
        ```
        public class OpportunityTriggerHandler {
    
            public static void updateOrderNumber(List<Opportunity> oppTriggerNew) {
                for (Opportunity newOpp : oppTriggerNew) {
                    if (String.isBlank(newOpp.OrderNumber__c)) {
                        newOpp.OrderNumber__c = '1';
                    }
                }
            }
        }
        ```

        ```
        trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {

            if(Trigger.isBefore && Trigger.isInsert){
                //set order number field
                //call a method to update order number field
                OpportunityTriggerHandler.updateOrderNumber(Trigger.new); //passing only trigger.new because we are calling this ONLY while BEFORE INSERT.
            }

        }
        ```

- We don't write logic code directly in trigger.
    - We create triggerHandler apex class > create method in it. > call the method from trigger.

- When to use after triggers?
    - while inserting if we need record ID then we use after triggers.
    - if we have to do any DMLs - insert/update/delete related or unrelated records, then we use after triggers.
    - any other long running process (integration, or automation)

    - EX: Inserting related record when a new record is created.
        - Create a Head of Department employee When we create a new Department.
            - create employee ONLY if head of departmnet is NOT Blank while create new department.
        - in which object's trigger we will write the code?
            - department. why? user is taking action --> automation.
        - in which trigger event?
            - after insert. why? we need id. Also, we want to create a new employee (insert dml).

- Few more trigger events
    - `before delete`,`after delete`, 
        - which context variable are available?
            - `Trigger.old` and `Trigger.OldMap` are available. (Trigger.new and Trigger.newmap is null)
    - `after undelete`
        - `Trigger.new` and `Trigger.newmap` are available.

- how many times trigger will execute if we insert or update 1500 records via IMPORT?
    - 8, because trigger executes once for every 200 records. 7x200=1400, 1x100=100

- Governor limits
    - Per transaction governor limits
        | Description      | Limits |
        | ----------- | ----------- |
        | SOQL        | 100 - Sync, 200- Async       |
        | SOQL Rows   | 50k        |
        | DMLs        | 150 |
        | DML rows    | 10k |
        | Heapsize    | 6mb - Sync, 12mb - Async|
        | CPU Time    | 10k milliseconds - Sync, 60k milliseconds  - Async|
        


- Order of execution
- Best practices