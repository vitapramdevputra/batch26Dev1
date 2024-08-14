# Collections

- List
- Set
- Map

## List

- Collection of elements of same datatype. 
- Ordered by index. 
- Allows duplicate elements.
- Syntax `List<string> listStr = new List<string>();`
- Can we create a list of date?
    - `List<date> listDate = new List<date>();`
- how about list of list of string?
    - ex: list of cities in each state.
    - yes.
    - `list<list<string>> listOfList = new list<list<string>>();`
- how to add elements in a list?
    - `List<integer> listInt = new list<integer>()`;
    - `listInt.add(50);`//0
    - `listInt.add(25);`//1
    - `listInt.add(25);`//2
    - `listInt.add(50);`//3
- how can get elements from a list at a particular index?
    - `get`
    - `integer i = listInt.get(3);`//50
- size()
    - used to get number of elements in list
    - `integer numOfElements = listInt.size();` //4
- other methods
    - contains: `boolean c40 = listInt.contains(40);` //false
    - sort: `listInt.sort();` it will update the order of list
        //25, 25, 50, 50
    - isEmpty();
        ```
        list<string> l3 = new list<string>();
        //isEmpty() will return true when list is empty.

        //!isEmpty() will return true when list is NOT EMPTY.
        if(!l3.isEmpty()){
            system.debug('print l3: ' + l3);
        } else {
            system.debug('nothing to print');
        }

        ```
    - equals();
        ``` 
         List<string> listCD = new list<string>();
        //add method is used to add values to list
        listCD.add('Mark'); //0
        listCD.add('Ellie');//1
        listCD.add('Bill'); //2
        listCD.add('Mark'); //3
        listCD.add('Mark'); //4
        system.debug('candidates list is ' + listCD);

        List<string> listCD2 = new list<string>();
        //add method is used to add values to list
        listCD2.add('Mark'); 
        listCD2.add('Mark'); 
        listCD2.add('Ellie');
        listCD2.add('Mark'); 
        listCD2.add('Bill'); 

        system.debug('candidates2 list is ' + listCD2);

        system.debug(listCD.equals(listCD2));
        ```

## for each loop --list

- `List<string> l = new list<string>{'a','b','c','x','yz'};`
- iterate the above list and print length of each string
    - ```
        for(string eachStr:l){
            system.debug(eachStr + ' and its length is ' + eachStr.length());
        }
        ```


## Set

- what is set?
    - collection of unique items of a specific datatypes. No duplicates. No order. No indexes.
- syntax:
    - `set<datatype> setName = new set<datatype>();`
    - ```
        set<integer> s1 = new set<integer>();
        set<integer> s2 = new set<integer>{15,99,45,27};
        s2.add(45);
        s2.add(21);
        system.debug(s2.size());


        set<string> s3;
        s3.add('don\'t know');
        system.debug(s3.isEmpty()); //this gives error.
        ```
    - ```
        set<string> s3 = new set<string>{'apple','google', 'salesforce', 'microsoft', 'apple'};
        set<string> s4 = new set<string>();
        
        for(string eachString: s3){
            system.debug(eachString);
            s4.add(eachString.toUppercase());
        }
        system.debug('s4 ' + s4);
       ```
    - some methods of set
        - `equals`, `contains`, `size()`

## Map

- what is a map?
    - map is collection of key-value pair. Each key is associated with a value.
    - keys are unique. 
    - if we use the same key to insert different key-value pair (key is same, value is different), it will override the previous value.
- Syntax:
    ```
    Map<string, string> m1 = new map<string, string>();
    m1.put('a', 'apple');
    m1.put('b', 'ball');
    m1.put('a', 'avocado');
    m1.put('c', 'cat');
    system.debug(m1);
    ```
- how can we get a specific value from any key?
    - `m1.get('b');` ==> 'ball' (string)

- how to get all the keys froma map?
    - `set<string> allKeys = m1.keySet();`

- how to get all the values from a map?
    - `list<string> = m1.values();`

- how to do for each loop of map?
    - we have to do for each loop on keySet(), i.e set of keys, and for each key, we can get the value using `.get(key)`
    ```
        for(string eachKey: m1.keySet()){
            //for eachKey, we can get its value using .get(eachKey) method
            system.debug(eachKey + ' value is ' + m1.get(eachKey));
        }
    ```
- some more methods of map
    - `m1.containsKey('d');` ==> false, because NO such key exists in map m1.
    - equals, size
    