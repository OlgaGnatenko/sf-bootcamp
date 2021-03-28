public with sharing class JobApplicationHelper {
  public static final String VISA_EXPIRY_ERROR_TEXT = 'You can not apply for this job due to your US visa expiration date';
  public static final Integer MIN_YEARS_TO_VISA_EXPIRY_DATE = 1;

  public static void validateUSAVisaExpiryDate(
    List<Job_Application__c> insertedJobApplications
  ) {
    Date minExpiryDate = Date.today().addYears(MIN_YEARS_TO_VISA_EXPIRY_DATE);
    Set<Id> positionIds = new Set<Id>();
    Set<Id> candidateIds = new Set<Id>();
    for (Job_Application__c jobApplication : insertedJobApplications) {
      candidateIds.add(jobApplication.Application_Candidate__c);
      positionIds.add(jobApplication.Application_Position__c);
    }

    Map<Id, Job_Position__c> positions = new Map<Id, Job_Position__c>(
      [SELECT Id, Location__c FROM Job_Position__c WHERE Id IN :positionIds]
    );

    Map<Id, Candidate__c> candidates = new Map<Id, Candidate__c>(
      [
        SELECT Id, USA_Visa_Holder__c, USA_Visa_Valid_To__c
        FROM Candidate__c
        WHERE Id IN :candidateIds
      ]
    );

    for (Job_Application__c jobApplication : insertedJobApplications) {
      Candidate__c candidate = candidates.get(
        jobApplication.Application_Candidate__c
      );
      Job_Position__c position = positions.get(
        jobApplication.Application_Position__c
      );
      if (position.Location__c == 'USA') {
        Boolean isValid =
          candidate.USA_Visa_Holder__c &&
          (candidate.USA_Visa_Valid_To__c >= minExpiryDate);
        if (!isValid) {
          jobApplication.addError(VISA_EXPIRY_ERROR_TEXT);
        }
      }
    }
  }
}
