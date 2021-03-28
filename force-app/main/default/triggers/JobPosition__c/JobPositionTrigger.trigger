trigger JobPositionTrigger on Job_Position__c(before insert) {
  if (Trigger.isBefore && Trigger.isInsert) {
    JobPositionTriggerHandler.onBeforeInsert(Trigger.new);
  }
  if (Trigge.isAfter && Trigger.isUpdate) {
    JobPositionTriggerHandler.onAfterUpdate(Trigger.newMap);
  }

}
