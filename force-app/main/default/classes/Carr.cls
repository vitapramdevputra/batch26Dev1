public class Carr {
    //class variables. Can be used inside the entire class.
    private string carNumber; //instance variables
    string name; //private by default. 
    integer mfgYear; //if we don't specify access modifier, then it is private by default.
    string color;
    private decimal price;


    //constructor. 
    //name is same as class name.
    //no mention of return. (no void, no string, nothing.)
    //constructor is called as soon as we create instance of class.
    public Carr(){
        system.debug('a new carr instance is created');
        mfgYear = 2024;
        details();
    }

    public Carr(string carname){
        system.debug('carr with carname constructor called.');
        this.name = carname;
        mfgYear = 2024;
        details();
    }

    public Carr(string carNumber, string name, integer mfgYear, string color, decimal price ){
        //this keyword.
            //this. means class variables.
        this.carNumber = carNumber;
        this.name = name;
        this.mfgYear = mfgYear;
        this.color = color;
        this.price = price;
        details();
    }

    //instance method
    public void details(){
        system.debug('car number: ' + this.carNumber);
        system.debug('name: ' + this.name);
        system.debug('mfg year: ' + this.mfgYear);
        system.debug('color: ' + this.color);
        system.debug('price: ' + this.price);
    }
}