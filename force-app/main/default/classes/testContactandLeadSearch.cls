@isTest

private class testContactandLeadSearch{
    static testmethod void testSearch(){
        Contact c = new Contact(FirstName='CA50307', LastName='Loweitz');
        Lead l = new Lead(FirstName = 'Under', LastName = 'CA50307', Company = 'Whatever');
        
        insert c;
        insert l;
        
        Test.startTest();
        List<List<SObject>> listSearch = ContactAndLeadSearch.searchContactsAndLeads('CA50307');
        Test.stopTest();
        
        List<Contact> lstContact = (Contact[])listSearch[0];
        List<Lead> lstLead = (Lead[])listSearch[1];
        
        system.assertEquals(lstContact.size(),1);
        system.assertEquals(lstLead.size(),1);
        
    }
}