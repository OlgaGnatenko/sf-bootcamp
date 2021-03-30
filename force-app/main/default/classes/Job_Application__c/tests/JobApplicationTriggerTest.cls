@isTest
public with sharing class JobApplicationTriggerTest {
  static final Integer NUM_PARTIAL_TEST_RECORDS = 50;

  static List<Job_Application__c> makeApplications() {
    Candidate__c candidateWithoutVisa = HiringApplicationDataEntities.makeCandidate(
      false,
      false,
      null,
      null
    );
    Candidate__c candidateWithValidVisa = HiringApplicationDataEntities.makeCandidate(
      true,
      true,
      Date.today().addDays(-1),
      Date.today().addYears(2)
    );
    Candidate__c candidateWithExpiredVisa = HiringApplicationDataEntities.makeCandidate(
      true,
      true,
      Date.today().addDays(-1),
      Date.today()
    );

    insert new List<Candidate__c>{
      candidateWithoutVisa,
      candidateWithValidVisa,
      candidateWithExpiredVisa
    };

    Contact hrManager = HiringApplicationDataEntities.makeContact(null);
    insert hrManager;

    Job_Position__c jobPositionUSA = HiringApplicationDataEntities.makeJobPosition(
      hrManager.id,
      1,
      'USA',
      null
    );
    Job_Position__c jobPositionUkraine = HiringApplicationDataEntities.makeJobPosition(
      hrManager.id,
      2,
      'Ukraine',
      null
    );

    insert new List<Job_Position__c>{jobPositionUSA, jobPositionUkraine};

    List<Job_Application__c> applications = new List<Job_Application__c>();
    Job_Application__c application = null;
    for (Integer i = 0; i < NUM_PARTIAL_TEST_RECORDS; i++) {
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUkraine.Id,
          candidateWithoutVisa.Id
        )
      );
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUkraine.Id,
          candidateWithValidVisa.Id
        )
      );
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUkraine.Id,
          candidateWithExpiredVisa.Id
        )
      );
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUSA.Id,
          candidateWithoutVisa.Id
        )
      );
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUSA.Id,
          candidateWithValidVisa.Id
        )
      );
      applications.add(
        HiringApplicationDataEntities.makeJobApplication(
          jobPositionUSA.Id,
          candidateWithExpiredVisa.Id
        )
      );
    }

    return applications;
  }

  @isTest
  static void testValidateVisaExpiryDates() {
    List<Job_Application__c> applications = makeApplications();
    List<Database.SaveResult> results = Database.insert(applications, false);

    Map<Id, Candidate__c> testCandidates = new Map<Id, Candidate__c>(
      [SELECT Id, USA_Visa_Holder__c, USA_Visa_Valid_To__c FROM Candidate__c]
    );

    Map<Id, Job_Position__c> testPositions = new Map<Id, Job_Position__c>(
      [SELECT Id, Location__c FROM Job_Position__c]
    );

    Integer i = 0;
    for (Database.SaveResult result : results) {
      Candidate__c testCandidate = testCandidates.get(
        applications[i].Application_Candidate__c
      );
      Job_Position__c testPosition = testPositions.get(
        applications[i].Application_Position__c
      );

      if (testPosition.Location__c != 'USA') {
        System.assert(result.isSuccess() == true);
        System.assert(result.getErrors().size() == 0);
      } else if (!testCandidate.USA_Visa_Holder__c) {
        System.assert(result.isSuccess() == false);
        System.assert(result.getErrors().size() == 1);
        System.assert(
          result.getErrors()[0].getMessage() == JobApplicationHelper.VISA_EXPIRY_ERROR_TEXT
        );
      } else if (
        testCandidate.USA_Visa_Valid_To__c <
        Date.today()
          .addYears(JobApplicationHelper.MIN_YEARS_TO_VISA_EXPIRY_DATE)
      ) {
        System.assert(result.isSuccess() == false);
        System.assert(result.getErrors().size() == 1);
        System.assert(
          result.getErrors()[0].getMessage() == JobApplicationHelper.VISA_EXPIRY_ERROR_TEXT
        );
      } else {
        System.assert(result.isSuccess() == true);
        System.assert(result.getErrors().size() == 0);
      }
      i++;
    }
  }
}
