public class Calculator {
    //add method
        //pass two integers, it returns sum of two integers.
    public Integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    //we can have same name methods
        //provided number of parameters are different or datatype is different
    public Integer add(integer a, integer b, integer c){
        integer sum = a + b + c;
        return sum;
    }

    public string add(string s1, string s2){
        string sum = s1 + s2;
        return sum;
    }

    public decimal add(decimal d1, decimal d2){
        return d1+d2;
    }

}