public with sharing class DragAndDropController {
    @AuraEnabled(cacheable=true)
    public static AccountStatusWrapper[] retrieveAccountsWithStatus(){
        List<AccountStatusWrapper> data = new List<AccountStatusWrapper>();
        try {
            for(Account account : [SELECT Id, Status__c, Name FROM Account LIMIT 10]){
                data.add(new AccountStatusWrapper(account));
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return data;
    }

    @AuraEnabled
    public static void updateAccountStatus(AccountStatusWrapper accountData){
        System.debug(accountData.accountId);
        System.debug(accountData.accountStatus);
        Account account = new Account(
            Id = accountData.accountId,
            Status__c = accountData.accountStatus
        );

        try {
            update account;
        } catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class AccountStatusWrapper {
        @AuraEnabled public Id accountId {get;set;}
        @AuraEnabled public String accountStatus {get;set;}
        @AuraEnabled public String accountName {get;set;}

        public AccountStatusWrapper(Account account){
            this.accountId = account.Id;
            this.accountStatus = account.Status__c;
            this.accountName = account.Name;
        }

        public AccountStatusWrapper(){}
    }
}