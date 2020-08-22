trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> lstTask = new List<Task>();
    
    for(Order_Event__e event : trigger.new){
        if(event.Has_Shipped__c == true){
            Task t = new Task();
            t.Priority = 'Medium';
            t.Status = 'Not Started';
            t.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = event.CreatedById;
            lstTask.add(t);
        }
    }
    
    insert lstTask;

}