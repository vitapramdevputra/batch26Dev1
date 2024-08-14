public class MethodsDemo {
    //no params
    public void welcomeMessage(){
        system.debug('Hi there, welcome to the world of apex');
    }

    //1 parameter. Datatype: string
    public void printNewMessage(string name){
        system.debug('Hi ' + name + ', welcome to the world of apex');
    }

    //1 parameter. Datatype: string
    //return type: string
    public string returnMessage(string name){
        string rt = 'Hey ' + name + ', nice to meet you buddy';
        return rt;
    }

    //it is valid to pass any datatype in parameters. And method returns any other datatype.
    public boolean nameContainsA(string name){
        boolean b = name.containsIgnoreCase('a');
        return b;
    }

    public integer indexOfA(string name){
        return name.indexOf('a');
    }
}