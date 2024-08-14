# Annotations

- What is annotation?
    - it changes the behavior of a method. 
    - we write it on top of the method, starting with '@' sign
    - any examples?
        - `@invocableMethod` - use this annotation if we want to call apex from flows.
        - `@invocableVariable`
        - `@future`
        - `@isTest`
        - `@auraEnabled`

# Tests

- Unit tests
    - small unit of code that we can test.
    - it can be method or a part of method

- Apex Tests
    - first we create a test class
    - how?
        - naming convention: `ClassNameTest`
        - annotate the class with `@isTest`
    - we have test methods
        - some rules to define test methods
            - static method (public or private)
            - returns void
            - no parameters in test method
            - annotate the method with `@isTest`
        - we call methods which we want to test
            - verify if the method is correctly executing or not.
            - Assertions
                - `System.assertEquals(actual, expected);`
                - All the assertions MUSt pass for test method to pass.
    - code coverage
        - the code that we have already TESTED from our test methods is called code coverage.
        - blank lines, system debug, brackets, comments are ignored in code coverage.
        - to deploy code from sandbox to production --> 75% code coverage is minimum.
    - New way to assert
        - `Assert` class has new methods avaialble
        - `Assert.areEqual(expected, actual)`
        - `Assert.isTrue(boolean_check)`

- Writing APEX tests for DMLs (and SOQL)
    - If we create 100 accounts in a test method, how many records will be actually inserted in the ORG?
        - No records are inserted in the actual ORG.
        - it will be inserted in virtual org
    - And we do not read the data from the org in test class.
        - we are calling a method, in that method we have a SOQL `[select id, name from account limit 100]`
            - it will NOT access any data from the ORG.
            - it will access ONLY the data that we created in virtual Org.
        - so whenever we have a query, we have to PREPARE the data so that query doesn't fail.
    - So, the FINAL steps to write apex test becomes
        - 1. Prepare data
        - 2. call method
        - 3. assert

- How to write tests for triggers and its handlers?
    - create separate tests for trigger and its handlers.
        - how can we execute triggers from a test class?
            - create/update/delete/undelete data in test class --> call trigger.
                - any DMLs in Test class will fire the entire Order Of Execution (inculiding triggers, flows etc)
        - Just create data as expected by the handler methods.
    