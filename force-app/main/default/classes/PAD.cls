public class PAD{
 public static Boolean isBypassAccountTrigger(){
     Boolean temp = false;
     Bypass_Apex__c atb = Bypass_Apex__c.getInstance();
     temp = atb.Account_Trigger_Bypass__c;
     return temp;
     
 }

}