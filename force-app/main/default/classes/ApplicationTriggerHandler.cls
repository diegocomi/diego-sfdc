public class ApplicationTriggerHandler {
    
    public static void changeApplicationName(List<Application__c> lstApp){
        for(Application__c a : lstApp){
            if(a.Position_Name__c != null && a.Employer__c != null){
                a.Name = a.Position_Name__c + ' @ ' + a.Employer__r.Name;
            }
        }
        
        update lstApp;
    }

}