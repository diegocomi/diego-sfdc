public with sharing class DC_OpportunityController {
    
    @AuraEnabled
    public static Opportunity getOpportunity(String recordId){
      return [
          SELECT Id, Amount, DC_Total_Repayment_Value__c, DC_Total_Interest_Payable__c, DC_Monthly_Repayment_Value__c, DC_Deposit__c
          FROM Opportunity
          WHERE Id = :recordId
          LIMIT 1
      ];
    }

    @AuraEnabled
    public static Opportunity updateOpportunity(Opportunity opp, Double monthlyPay, Double totalInterest, Double deposit, Double totalPay){
        opp.DC_Total_Repayment_Value__c = totalPay;
        opp.DC_Deposit__c = deposit;
        opp.DC_Monthly_Repayment_Value__c = monthlyPay;
        opp.DC_Total_Interest_Payable__c = totalInterest;

        update opp;
        return opp;

    }

}