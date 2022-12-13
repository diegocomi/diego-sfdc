@isTest
private class ProfileCache_Test {
    
    @isTest
    private static void retrieveProfileCache() {
        Profile p;
        
        Test.startTest();
        p = (Profile) Cache.Org.get(ProfileCache.class, 'System Administrator');
        Test.stopTest();

        Assert.AreEqual('System Administrator', p.Name, 'Error retrieving profile from cacher class');
    }
}
