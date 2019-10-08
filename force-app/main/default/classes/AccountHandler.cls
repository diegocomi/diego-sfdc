public class AccountHandler{
    public static Account insertNewAccount(String s){
        Account a = new Account();
        a.Name = s;
        
        Database.SaveResult sr = Database.Insert(a, false);
        if(sr.IsSuccess()){
            return a;
        } else {
            return null;
        }
        
        
        
    }
}