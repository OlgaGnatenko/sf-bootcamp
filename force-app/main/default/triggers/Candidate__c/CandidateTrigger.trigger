trigger CandidateTrigger on Candidate__c(
  before insert,
  before update,
  after undelete
) {
  if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    CandidateTriggerHandler.onBeforeUpsert(Trigger.new);
  }
  if (Trigger.isAfter && Trigger.isUndelete) {
    CandidateTriggerHandler.onAfterUndelete(Trigger.newMap);
  }

}
