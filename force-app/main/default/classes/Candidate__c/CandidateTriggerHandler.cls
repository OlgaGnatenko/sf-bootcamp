public with sharing class CandidateTriggerHandler {
  public static void onBeforeUpsert(List<Candidate__c> candidates) {
    CandidateHelper.validateUSAVisaDates(candidates);
  }

  public static void onAfterUndelete(Map<Candidate__c> candidatesMap) {
    CandidateHelper.markRecoveredRecords(candidatesMap);
  }
}
