public class generateQuery{
    /* metod strSelectAll returns a SOQL query string for all fields in a given object, passed as parameter
    *  NB does not support related fields (e.g. Account.Name), these have to be added manually after calling the method
    */

    public static String strSelectAll(String strObjectName, Integer intLimit){
        String strSelectAll = 'SELECT';
                
        Map<String, Schema.SObjectField> mapObjFields = Schema.getGlobalDescribe().get(strObjectName).getDescribe().fields.getMap();
        for(String strField : mapObjFields.keyset()){
            strSelectAll += ' ' + strField + ',';
        }
        
        if(strSelectAll.substring(strSelectAll.length()-1, strSelectAll.length()) == ','){
            strSelectAll = strSelectAll.substring(0,strSelectAll.length()-1);
        }
        
        strSelectAll += ' FROM ' + strObjectName;
        
        if(intLimit > 0){
            strSelectAll += 'LIMIT ' + intLimit;
        }
        
        system.debug(strSelectAll);
        
        return strSelectAll;
    }
    
    public static String strSelectedFieldNames(String strObjectName){
        String strSelectedFieldNames = '';
        Map<String,Schema.SObjectField> mapObjFields = Schema.getGlobalDescribe().get(strObjectName).getDescribe().fields.getMap();
        
        for(String strField : mapObjFields.keyset()){
            strSelectedFieldNames += strField + ',';
        }
        strSelectedFieldNames += '\n';
        
        return strSelectedFieldNames;
    }
}