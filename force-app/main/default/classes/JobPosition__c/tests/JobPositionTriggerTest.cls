@isTest
private class JobPositionTriggerTest {
  static final int NUM_TEST_RECORDS = 300;

  //   static void makeContact() {
  //     return new Contact(LastName = 'TestContact');
  //   }

  //   static void makeJobPositions(Contact contact) {
  //     List<JobPosition__c> jobPositions = new List<JobPosition__c>();

  //     for (Integer i = 0; i < NUM_TEST_RECORDS; i++) {
  //       jobPositions.add(
  //         new JobPosition__c(
  //           Name = 'P' + i,
  //           Job_Position_Title__c = 'Software Engineer',
  //           Candidate_Level__c = 'Software Engineer',
  //           Open_Due_Date__c = (new Date()).plusDays(1),
  //           Priority__c = 'High',
  //           Location__c = 'Ukraine',
  //           Practice_Unit__c = (math.mod(i, 2) > 0) ? 'Salesforce' : 'Java',
  //           HR_Manager__c = contact.Id
  //         )
  //       );
  //     }
  //     return jobPositions;
  //   }

  @TestSetup
  static void makeData() {
    // contact = makeContact();
    // insert contact;
    // List<JobPosition__c> jobPositions = makeJobPositions(contact);
    // insert jobPositions;
    Contact contact = new Contact(LastName = 'TestContact');
    List<JobPosition__c> jobPositions = new List<JobPosition__c>();

    for (Integer i = 0; i < NUM_TEST_RECORDS; i++) {
      jobPositions.add(
        new JobPosition__c(
          Name = 'P' + i,
          Job_Position_Title__c = 'Software Engineer',
          Candidate_Level__c = 'Software Engineer',
          Open_Due_Date__c = (new Date()).plusDays(1),
          Priority__c = 'High',
          Location__c = 'Ukraine',
          Practice_Unit__c = (math.mod(i, 2) > 0) ? 'Salesforce' : 'Java',
          HR_Manager__c = contact.Id
        )
      );
    }
    insert contact;
    insert jobPositions;
    System.debug('Test setup worked!');
  }

  @isTest
  static void testUpdateJobPositionTitle() {
    List<JobPosition__c> testJobPositions = [
      SELECT Name, Practice_Unit__c
      FROM JobPosition__c
    ];

    for (JobPosition__c position : testJobPositions) {
      if (position.Practice_Unit__c == 'Salesforce') {
        System.assert(position.Name.startsWith('SF-'));
      } else {
        System.assert(position.Name.startsWith('P'));
      }
    }
  }
}
