trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
	List<BatchLeadConvertErrors__c> lstBLCE = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent e : trigger.new){
        BatchLeadConvertErrors__c blce = new BatchLeadConvertErrors__c();
        blce.AsyncApexJobId__c = e.AsyncApexJobId;
        blce.Records__c = e.JobScope;
        blce.StackTrace__c = e.StackTrace;
        lstBLCE.add(blce);
    }
    insert lstBLCE;
}