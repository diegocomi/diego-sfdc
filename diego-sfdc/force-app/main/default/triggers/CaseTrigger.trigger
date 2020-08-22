trigger CaseTrigger on Case (before insert, before update, after insert, after delete, after undelete, after update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        //do something
        System.debug('The Case Trigger has run');
    }
}