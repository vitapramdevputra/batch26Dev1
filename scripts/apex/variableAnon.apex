//create a string variable.

string first = 'This is a string variable.';
system.debug('first ===> ' + first);


//naming convention is to keep first letter of variable as small, and use camel case
string firstName = 'Vitap';
string lastName = 'Ramdevputra';
string fullName = firstName + ' ' + lastName;
system.debug(fullName);
system.debug(FULLNAME); //will this work? Yes. Apex is case insensitive.
SYSTEM.debug(FullName); //will this work? Yes.
SYSTEM.DEBUG(fullname);
system.DEBUG(FULLname);


//string x = 110; //will this work? No. We cannot store integer in a string variable.


//Define a new variable
string s = 'got it'; //defining a variable means creating a variable and assigning a value.

//declare a new variable
string s2; //we are declaring a variable. We are declaring the program that we HAVE a variable called s2.
system.debug('s2 ===>>> ' + s2); //null. (there is no undefined in apex)
s2 = 'some value assigned after declaring'; //no need to write datatype once variable is ALREADY created.
system.debug('print s2 again ===>>> ' + s2);

//defining a variable, and storing empty string.
string s3 = ''; //is this null? No. This is empty string.
s3 = 'not empty anymore';


string x = 'This', y = ' is ', z = 'simple', a = '. right?';
system.debug(x + y + z + a);


string b = null;
string c = 'null';


//code block starts here

// string a2 = 'a2 milk';

// string a2 = 'milk'; //duplicate field error.

//code block ends here


string a3 = 'learning';
string b3 = 'apex';

a3 = b3; //we are assigning value of b3 to a3.
system.debug(a3);//
system.debug(b3);//