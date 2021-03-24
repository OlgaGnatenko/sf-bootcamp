trigger CandidateTrigger on Candidate__c (before insert, before update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        CandidateTriggerHandler.onBeforeUpsert(Trigger.new);
    }}