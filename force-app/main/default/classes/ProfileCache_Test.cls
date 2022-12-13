public with sharing class ProfileCache_Test {
    public ProfileCache_Test() {
        Profile p;
        
        Test.startTest();
        p = (Profile) Cache.Org.get(ProfileCache.class, 'System Administrator');
        Test.stopTest();

        Assert.AreEqual('System Administrator', p.Name, 'Error retrieving profile from cacher class');
    }
}
