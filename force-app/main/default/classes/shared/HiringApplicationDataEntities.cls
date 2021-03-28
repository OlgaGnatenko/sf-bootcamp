public with sharing class HiringApplicationDataEntities {
  public static final String BASE_POSITION_PREFIX = 'P';

  public static Contact makeContact() {
    return new Contact(LastName = 'TestContact', MailingCountry = 'USA');
  }

  public static Candidate__c makeCandidate(
    boolean visaHolder,
    boolean isValid,
    Date validFrom,
    Date validTo
  ) {
    Candidate__c candidate = new Candidate__c(
      Full_Name__c = 'Mr Smith',
      Email__c = 'mrsmith@ogred.com'
    );

    if (!visaHolder) {
      candidate.USA_Visa_Holder__c = false;
      candidate.USA_Visa_Valid_From__c = null;
      candidate.USA_Visa_Valid_To__c = null;
      return candidate;
    }

    candidate.USA_Visa_Holder__c = true;
    if (isValid) {
      candidate.USA_Visa_Valid_From__c = validFrom != null
        ? validFrom
        : Date.today();
      candidate.USA_Visa_Valid_To__c = validTo != null ? validTo : Date.today();
      return candidate;
    }

    candidate.USA_Visa_Valid_From__c = null;
    candidate.USA_Visa_Valid_To__c = null;
    return candidate;
  }

  public static Job_Position__c makeJobPosition(
    ID hrManagerId,
    Integer nameCounter,
    String location,
    String practiceUnit
  ) {
    return new Job_Position__c(
      Name = BASE_POSITION_PREFIX + nameCounter,
      Job_Position_Title__c = 'Software Engineer',
      Candidate_Level__c = 'Software Engineer',
      Open_Due_Date__c = Date.today(),
      Priority__c = 'Hot',
      Location__c = location == null ? 'Ukraine' : location,
      Practice_Unit__c = practiceUnit == null ? 'Salesforce' : practiceUnit,
      HR_Manager__c = hrManagerId
    );
  }

  public static Job_Application__c makeJobApplication(
    ID positionId,
    ID candidateId
  ) {
    return new Job_Application__c(
      Application_Position__c = positionId,
      Application_Candidate__c = candidateId
    );
  }
}
