public class StringArrayTest{
    public static List<String> generateStringArray(Integer i){
        List<String> lstString = new List<String>();
        for(Integer n = 0; n<i; n++){
            String newString = 'Test ' + n;
            lstString.add(newString);
        }
        system.debug(lstString);        
        return lstString;

    }
    
}