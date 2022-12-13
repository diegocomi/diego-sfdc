public without sharing class ProfileCache implements Cache.CacheBuilder {
    public Object doLoad(String profileName){
        Profile profile = (Profile)[SELECT Id, Name FROM Profile WHERE Name = :profileName];
        return profile;
    }
}
