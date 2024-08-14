public class ClassD {
        private integer num;
        private string str;


        public string getStr(){
            return this.str;
        }

        public void setStr(string str){
            this.str = str;
        }

        //get method of num (calculating the num variable's value)
        public integer getNum(){
            if(string.isNotEmpty(this.str)){
                return this.str.length();
            }
            else {
                return -1;
            }
        }

        //if we JUST have get method, the variable becomes READ ONLY (like formula fields or any system fields)

}