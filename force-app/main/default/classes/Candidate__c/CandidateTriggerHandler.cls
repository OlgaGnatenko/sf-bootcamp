public with sharing class CandidateTriggerHandler {
    public static void onBeforeUpsert(List<Candidate__c> candidates) {
        CandidateHelper.validateUSAVisaDates(candidates);
    }
}
