public class SampleClassD {
    //
    public static void method4(){
         //if this method is called from SampleClassA -- then it will ENFORCE sharing settings (user can see shared records)

        //if the methods in this class is called from SampleClassB then it will NOT ENFORCE sharing settings (user can see all the records)

        //if called from trigger, or flows, or api's etc??
            //this will NOT RESPECT sharing rules.
    }
}