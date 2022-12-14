public without sharing class ProfileCache implements Cache.CacheBuilder {
    public Object doLoad(String cacheKey){
        Map<String,Profile> mapProfileByName = new Map<String,Profile>();
        for(Profile profile : [SELECT Id, Name FROM Profile]){
            mapProfileByName.put(profile.Name, profile);
        }
        return mapProfileByName;
    }
}
