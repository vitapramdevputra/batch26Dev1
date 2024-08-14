public with sharing class Carrr {
    
    public string name;//class variable or global variable
    string color;

    //if we DO NOT HAVE any contructor, there is ONE default non-parameterized constructor present behind the scenes.
    // public Carrr(){

    // }

    //we ONLY have 1 contructor which is accepting two string parameters.
        //if we create any constructor, the DEFAULT one goes away
    public Carrr(string name, string color){
        this.name = name;
        this.color = color;
        details();
    }
    

    //instance method. 
        //it means we can call this method for a specific instance of this class.
    public void details(){
       
        system.debug(name + ' color is ' + color);

        if(string.isNotBlank(this.name)){
            datetime dt = datetime.now(); //local variable

        }
    }
}