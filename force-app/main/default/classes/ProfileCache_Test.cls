@isTest
private class ProfileCache_Test {
    
    @isTest
    private static void retrieveProfileCache() {
        Id retrievedProfileId;
        
        Test.startTest();
        Map<String,Profile> mapProfileByName = (Map<String,Profile>)Cache.Org.get(ProfileCache.class, 'mapProfileByName');
        retrievedProfileId = mapProfileByName.get('System Administrator').Id;
        Test.stopTest();

        Id systemAdminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;

        Assert.AreEqual(systemAdminProfileId, retrievedProfileId, 'Error retrieving profile from cacher class');
    }
}
