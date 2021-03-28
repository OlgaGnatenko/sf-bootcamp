@isTest
private class JobPositionTriggerTest {
  static final Integer NUM_TEST_RECORDS = 300;
  static final String BASE_PREFIX = 'P';
  static final String SF_PREFIX = 'SF-';

  static Contact makeContact() {
    return new Contact(LastName = 'TestContact');
  }

  static List<Job_Position__c> makeJobPositions(Contact contact) {
    List<Job_Position__c> jobPositions = new List<Job_Position__c>();

    for (Integer i = 0; i < NUM_TEST_RECORDS; i++) {
      jobPositions.add(
        new Job_Position__c(
          Name = BASE_PREFIX + i,
          Job_Position_Title__c = 'Software Engineer',
          Candidate_Level__c = 'Software Engineer',
          Open_Due_Date__c = Date.today(),
          Priority__c = 'Hot',
          Location__c = 'Ukraine',
          Practice_Unit__c = (math.mod(i, 2) > 0) ? 'Salesforce' : 'Java',
          HR_Manager__c = contact.Id
        )
      );
    }
    return jobPositions;
  }

  @TestSetup
  static void makeData() {
    Contact contact = makeContact();
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
        System.assert(position.Name.startsWith(BASE_PREFIX));
      }
    }
  }
}
