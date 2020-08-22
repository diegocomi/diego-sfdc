@isTest
private class DC_OpportunityController_Test {
    @isTest
    static void testGetOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Amount = 75000;
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = date.newInstance(2020, 11, 11);
        
        insert opp;
        
        Test.startTest();
        Opportunity getOpp = DC_OpportunityController.getOpportunity(opp.Id);
        Test.stopTest();
        
        system.assertEquals(getOpp.Id, opp.Id);
    }
    
    @isTest
    static void testUpdateOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Amount = 75000;
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = date.newInstance(2020, 11, 11);
        
        insert opp;
      	Integer deposit = 1000;
        Integer monthlyPay = 2000;
        Integer totalInterest = 3000;
        Integer totalPay = 4000;
        
        Test.startTest();
        DC_OpportunityController.updateOpportunity(opp, monthlyPay, totalInterest, deposit, totalPay);
        Test.stopTest();
        
        System.assertEquals(deposit, opp.DC_Deposit__c);
        System.assertEquals(monthlyPay, opp.DC_Monthly_Repayment_Value__c);
        System.assertEquals(totalInterest, opp.DC_Total_Interest_Payable__c);
        System.assertEquals(totalPay, opp.DC_Total_Repayment_Value__c);
        
        
    }
}