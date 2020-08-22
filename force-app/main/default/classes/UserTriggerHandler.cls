public class UserTriggerHandler{

 public static void storePreviousProfile(Map<Id,User> mapOldUser,List<User> lstNewUser){
     
     Boolean canAssignTemp = [SELECT Can_Temporary_Assign_Profiles__c FROM User
                             WHERE Id = :UserInfo.getUserId()].Can_Temporary_Assign_Profiles__c;

     
     if(canAssignTemp){
         
         List<User> lstUpdate = new List<User>();
         Map<Id,String> mapProfile = new Map<Id,String>();
         for(Profile p : [SELECT Id, Name FROM Profile]){
             mapProfile.put(p.Id,p.Name);
         }
         
         for(User u : lstNewUser){
             User oldUser = mapOldUser.get(u.Id);
             if(u.Temporary_Assigned_Profile__c && (oldUser.ProfileId != u.ProfileId)){
                 u.Previous_Profile__c = oldUser.ProfileId;
             }
         }
         
         
          
     }  
 }

}