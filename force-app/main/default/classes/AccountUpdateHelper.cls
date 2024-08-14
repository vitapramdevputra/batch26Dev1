public class AccountUpdateHelper {

    //invocable annotation is used to make a method to be called by a flow or PB.
    @invocableMethod(label='Update account website' description='update website if blank')
    public static void updateAccountWebsite(List<id> accIds){
        List<account> accs = new list<account>();
        for(Id eachId: accIds){
            account a = new account();
            a.Id = eachId;
            a.Website = 'softinnovasbatch26.com';
            accs.add(a);
        }
        update accs;
    }
}