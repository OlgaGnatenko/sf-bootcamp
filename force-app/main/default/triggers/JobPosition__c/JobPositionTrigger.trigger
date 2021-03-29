trigger JobPositionTrigger on Job_Position__c(before insert, after update) {
  if (Trigger.isBefore && Trigger.isInsert) {
    JobPositionTriggerHandler.onBeforeInsert(Trigger.new);
  }
  if (Trigger.isAfter && Trigger.isUpdate) {
    JobPositionTriggerHandler.onAfterUpdate(Trigger.new);
  }
}
