public class StringDemo2 {
    public void method2(){
        string s = 'Salesforce world';
        string s2 = 'salesforce world';

        boolean c1 = s.equals(s2);
        system.debug('s.equals(s2) ==> ' + c1 );

        boolean c2 = s.equalsIgnoreCase(s2);
        system.debug('s.equalsIgnoreCase(s2) ==> ' + c2 );
    }

    public void method3(){
        string username = ' salesforce Dev  ';
        system.debug('username length => ' + username.length());

        string username2 = username.trim();//trim will remove leading and trailing space
        system.debug('username2 length => ' + username2.length());
        system.debug('username:'+username);
        system.debug('username2:'+username2);
    }

    public void method4(){
        string s4 = 'Softinnovas Salesforce';
        integer i1 = s4.indexOf('force');
        system.debug('index of force: ' + i1);

        integer i2 = s4.indexOf('x');
        system.debug('index of x: ' + i2);

         integer i3 = s4.indexOf('apex');
        system.debug('index of apex: ' + i3); //-1

         integer i4 = s4.indexOf('v');
        system.debug('index of v: ' + i4); //
    }

    public void method5(){
        //remove method
        string s4 = 'Username is salesforceDev. Password is Password';
        string s5 = s4.remove('Password');
        system.debug(s5);

        string s6 = s4.remove('Salesforce');
        system.debug(s6);
    }

    public void method6(){
        //removeEnd 
        string s6 = 'Test ---Test ---Test';
        string s7 = s6.removeEnd('---Test');

        system.debug('s6.removeEnd(---Test) ' + s7);


        string s8 = s6.removeEnd('---test');
        system.debug('s6.removeEnd(---test) ' + s8);

        string s9 = s6.removeEndIgnoreCase('---test');
        system.debug('s6.removeEndIgnoreCase(---test) ' + s9);

    }

    public void method7(){
        boolean b = true;
        string sb = 'true';
        integer i = 99;
        string si = '99';

        string s7 = string.valueOf(b);
        string s8 = string.valueOf(i);

        system.debug('s7 ' + s7 + ' ==> s7 length: ' + s7.length());
        system.debug('s8 ' + s8 + ' ==> s8 length: ' + s8.length());
    }
}