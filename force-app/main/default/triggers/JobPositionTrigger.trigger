trigger JobPositionTrigger on Job_Position__c (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        JobPositionTriggerHandler.onBeforeInsert(Trigger.new);
    }
}