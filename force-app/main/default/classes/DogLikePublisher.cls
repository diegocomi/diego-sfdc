public with sharing class DogLikePublisher {
    @AuraEnabled
    public static String publishDogLikeEvent(DogLikeEventWrapper wrapper){
        Dog_Click__e dogClickEvent = new Dog_Click__e();
        dogClickEvent.Dog_Picture__c = wrapper.dogPicture;
        dogClickEvent.Username__c = wrapper.username;
        
        Database.SaveResult publishResult = EventBus.publish(dogClickEvent);
        
        if(publishResult.isSuccess()){
            return 'success';
        } else {
            throw new AuraHandledException('exception text!');
        }
    }

    public class DogLikeEventWrapper {
        @AuraEnabled public String dogPicture;
        @AuraEnabled public String username;
    }


}