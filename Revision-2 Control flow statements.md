# Operators

- Comparision operators
    - equality, not equal, less than, greater than...
    - `==`. `!=`, `<`, `<=`, `>`,  `>=`
- And & OR & not
    - &&
    - ||
    - !
- Assignment operators
    - `+=`
        - `integer a = 15; a += 10; ` ==> a = 25
        - `string s = '15'; s += '10';` ==> s = 1510
    - `-=`, `*=`
    - `++`, `--`

- if/else
    ```
        if(boolean){
            //if boolean is true it will come here.
        } else {
            //if boolean is NOT True it will come to else.
        }
    ```

- Switch
    ```
    string monthname = 'October';
    string q = '';
    switch on monthname {
        when 'January', 'Febrary', 'March', 'April' {
            q = 'Q1';
        }
        when 'May', 'June', 'July' {
            q = 'Q2';
        }
        when else {
            q = 'Q3'
        }
    }
    ```

# Loops

- while loops
    ```
    integer i = 1;
    while (i <= 10){
        integer j = i*5; //multiply i by 5. 1*5, 2x5, 3x5
        system.debug(j);
        i++; //update i.
    }
    ```
- for i (traditional for loops)
    ```
    for(integer i = 1; i<=10; i++){
        system.debug(i*10);
    }
    ```