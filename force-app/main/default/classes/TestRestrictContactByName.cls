@isTest
private class TestRestrictContactByName{
    @isTest static void testContactInsertPoz(){
        Contact c = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME');
        
        Test.startTest();
        Database.saveResult result = Database.insert(c,false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',result.getErrors()[0].getMessage());
    }
    
    @isTest static void testContactInsertNeg(){
        Contact c = new Contact(FirstName = 'Test', LastName = 'VALIDNAME');
        
        Test.startTest();
        Database.saveResult result = Database.insert(c,false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    
    }
}