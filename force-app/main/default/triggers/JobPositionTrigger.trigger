trigger JobPositionTrigger on Job_Position__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        JobPositionTriggerHandler(Trigger.new);
    }
}