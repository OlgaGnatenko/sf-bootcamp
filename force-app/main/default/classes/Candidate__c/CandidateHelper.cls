public with sharing class CandidateHelper {
    public static final String VISA_DATES_ERROR_TEXT = 'Please specify your visa date information';

    public static void validateUSAVisaDates(List<Candidate__c> candidates) {
        for (Candidate__c candidate: candidates) {
            if (candidate.USA_Visa_Holder__c && (candidate.USA_Visa_Valid_From__c == null || candidate.USA_Visa_Valid_To__c == null)) {
                candidate.addError(VISA_DATES_ERROR_TEXT);
            }
        }
    }
}