@isTest
private class TestTriggerHandler {
    
    @isTest static void testReplaceName(){
        
        List<RecordType> lstRT = [SELECT ID FROM RecordType
                    WHERE DeveloperName = 'Employer'
                    LIMIT 1];
        Id empRTID = lstRT[0].Id;
        
        
        Account employer = new Account();
        employer.Name = 'Test Employer';
        employer.RecordTypeId = empRTID;
        insert employer;
        
        List<Application__c> lstTestApp = new List<Application__c>();
        for(Integer i=0; i < 200; i++){
            Application__c newApp = new Application__c(Employer__c = employer.Id,
                                                      Name = 'Whatever',
                                                      Position_Name__c = 'Tester Dude');
            lstTestApp.add(newApp);
        }
        
        Test.startTest();
        insert lstTestApp;
        Test.stopTest();
        
        Set<Id> newSetId = new Set<Id>();
        for(Application__c a : lstTestApp){
            newSetId.add(a.Id);
        }
        
        List<Application__c> lstWrongApp = [SELECT Id, Name FROM Application__c
                                           WHERE Id IN :newSetId
                                           AND Name != 'Tester Dude @ Test Employer'];
        System.assertEquals(0, lstWrongApp.size());
        System.assertEquals(200, newSetId.size());
        
    }

}