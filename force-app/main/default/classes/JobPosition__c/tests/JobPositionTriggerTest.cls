@isTest
public with sharing class JobPositionTriggerTest {
  static final Integer NUM_TEST_RECORDS = 300;
  static final String SF_PREFIX = 'SF-';
  static final Integer EMAILS_ALLOWED = 15;

  static List<Job_Position__c> makeJobPositionsForTitle(Contact contact) {
    List<Job_Position__c> jobPositions = new List<Job_Position__c>();
    String practiceUnit = null;

    for (Integer i = 0; i < NUM_TEST_RECORDS; i++) {
      practiceUnit = (math.mod(i, 2) > 0) ? 'Salesforce' : 'Java';
      jobPositions.add(
        HiringApplicationDataEntities.makeJobPosition(
          contact.Id,
          i,
          'Ukraine',
          practiceUnit
        )
      );
    }
    return jobPositions;
  }

  static List<Job_Position__c> makeJobPositionsForBudget(
    Contact contact,
    Integer numRecords,
    Integer startNameNumber
  ) {
    List<Job_Position__c> jobPositions = new List<Job_Position__c>();
    for (Integer i = 0; i < numRecords; i++) {
      jobPositions.add(
        HiringApplicationDataEntities.makeJobPosition(
          contact.Id,
          startNameNumber + i,
          'Ukraine',
          'Salesforce'
        )
      );
    }
    return jobPositions;
  }

  @isTest
  static void testUpdateJobPositionTitle() {
    Contact contact = HiringApplicationDataEntities.makeContact(null);
    insert contact;
    List<Job_Position__c> jobPositions = makeJobPositionsForTitle(contact);
    insert jobPositions;

    List<Job_Position__c> testJobPositions = [
      SELECT Name, Practice_Unit__c
      FROM Job_Position__c
    ];

    for (Job_Position__c position : testJobPositions) {
      if (position.Practice_Unit__c == 'Salesforce') {
        System.assert(position.Name.startsWith(SF_PREFIX));
      } else {
        System.assert(
          position.Name.startsWith(
            HiringApplicationDataEntities.BASE_POSITION_PREFIX
          )
        );
      }
    }
  }

  @isTest
  static void testReviewHighBudgetApplication() {
    Contact contactWithoutEmail = HiringApplicationDataEntities.makeContact(
      null
    );
    Contact contactWithEmail = HiringApplicationDataEntities.makeContact(
      '111@ogred.com'
    );
    insert new List<Contact>{ contactWithoutEmail, contactWithEmail };

    List<Job_Position__c> jobPositions = makeJobPositionsForBudget(
      contactWithoutEmail,
      NUM_TEST_RECORDS - EMAILS_ALLOWED,
      0
    );
    jobPositions.addAll(
      makeJobPositionsForBudget(contactWithEmail, EMAILS_ALLOWED, NUM_TEST_RECORDS - EMAILS_ALLOWED)
    );
    insert jobPositions;

    List<Job_Position__c> testJobPositions = [
      SELECT Id, Position_Budget__c, HR_Manager__c, Name
      FROM Job_Position__c
    ];

    Integer i = 0, budget = 0;
    Set<Id> hrManagerIds = new Set<Id>();

    for (Job_Position__c jobPosition : testJobPositions) {
      budget = (math.mod(i, 2) > 0)
        ? JobPositionHelper.HIGH_BUDGET_LIMIT + 100
        : JobPositionHelper.HIGH_BUDGET_LIMIT - 100;
      jobPosition.Position_Budget__c = budget;
      hrManagerIds.add(jobPosition.HR_Manager__c);
      i++;
    }
    update testJobPositions;

    List<Task> tasks = new List<Task>([SELECT Id, WhoId, Subject FROM Task]);

    Map<String, Task> tasksByJobName = new Map<String, Task>();
    String extractedTaskName = null;
    for (Task task : tasks) {
      extractedTaskName = task.Subject.substring(
        task.Subject.lastIndexOf(': ') + 2
      );
      tasksByJobName.put(extractedTaskName, task);
    }

    for (Job_Position__c jobPosition : testJobPositions) {
      Task linkedTask = tasksByJobName.get(jobPosition.Name);
      if (jobPosition.Position_Budget__c > 5000) {
        System.assert(linkedTask != null);
        System.assert(linkedTask.WhoId == jobPosition.HR_Manager__c);
      } else {
        System.assert(linkedTask == null);
      }
    }

    // verify that emails were sent 
    Integer invocations = Limits.getEmailInvocations();
    System.assert(invocations == 2);
  }
}
