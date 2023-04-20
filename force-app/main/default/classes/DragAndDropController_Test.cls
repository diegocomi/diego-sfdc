@isTest
private without sharing class DragAndDropController_Test {
    @isTest
    private static void retrieveAccountWithStatusTest(){
        Account account = new Account(Name = 'Diego Test Account', Status__c = 'Inactive', Website = 'something.uk');
        insert account;

        DragAndDropController.AccountStatusWrapper[] data;

        Test.startTest();
        data = DragAndDropController.retrieveAccountsWithStatus();
        Test.stopTest();

        Assert.areEqual(1, data.size());
        Assert.areEqual('Inactive', data[0].accountStatus);
    }

    @isTest
    private static void updateAccountWithNewStatusTest(){
        Account account = new Account(Name = 'Diego Test Account', Status__c = 'Inactive', Website = 'something.uk');
        insert account;
        
        DragAndDropController.AccountStatusWrapper dataWrapper = new DragAndDropController.AccountStatusWrapper(account);
        dataWrapper.accountStatus = 'Active';

        Test.startTest();
        DragAndDropController.updateAccountStatus(dataWrapper);
        Test.stopTest();
        Account result = [SELECT Status__c FROM Account WHERE Id = :account.Id];
        Assert.areEqual('Active', result.Status__c);
    }

    @isTest
    private static void updateAccountWithNewStatus_NegativePath(){
        Account account = new Account(Name = 'Diego Test Account', Status__c = 'Inactive', Website = 'something.uk');
        insert account;
        DragAndDropController.AccountStatusWrapper dataWrapper = new DragAndDropController.AccountStatusWrapper();
        dataWrapper.accountId = account.Id;
        dataWrapper.accountName = account.Name;
        dataWrapper.accountStatus = 'Some non-allowed status';

        String resultErrorMessage;

        Test.startTest();
        try{
            DragAndDropController.updateAccountStatus(dataWrapper);
        } catch (Exception e) {
            resultErrorMessage = e.getMessage();
        }
        Test.stopTest();

        Assert.isNotNull(resultErrorMessage);

    }
}
