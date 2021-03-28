@isTest
public with sharing class JobPositionTriggerTest {
  static final Integer NUM_TEST_RECORDS = 300;
  static final String SF_PREFIX = 'SF-';

  static List<Job_Position__c> makeJobPositions(Contact contact) {
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

  @TestSetup
  static void makeData() {
    Contact contact = HiringApplicationDataEntities.makeContact();
    insert contact;
    List<Job_Position__c> jobPositions = makeJobPositions(contact);
    insert jobPositions;
  }

  @isTest
  static void testUpdateJobPositionTitle() {
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
}
