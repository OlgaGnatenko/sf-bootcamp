@isTest
private class CandidateTriggerTest {
  static final Integer NUM_TEST_RECORDS = 300;
  static final String VISA_DATES_ERROR_TEXT = 'Please specify your visa date information';

  static Candidate__c makeCandidate(boolean visaHolder, boolean isValid) {
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
      candidate.USA_Visa_Valid_From__c = Date.today();
      candidate.USA_Visa_Valid_To__c = Date.today();
      return candidate;
    }

    candidate.USA_Visa_Valid_From__c = null;
    candidate.USA_Visa_Valid_To__c = null;
    return candidate;
  }

  static List<Candidate__c> makeCandidates() {
    List<Candidate__c> candidates = new List<Candidate__c>();
    Candidate__c candidate = null;
    boolean isValid = true;
    boolean visaHolder = true;

    for (Integer i = 0; i < NUM_TEST_RECORDS; i++) {
      if (math.mod(i, 3) == 0) {
        // non-visa holders
        visaHolder = false;
      } else {
        visaHolder = true;
        // valid visa holders i%3 == 1, invalid visa holders i%3 == 2
        isValid = (math.mod(i, 3) == 1);
      }
      candidate = makeCandidate(visaHolder, isValid);
      candidates.add(candidate);
    }
    return candidates;
  }

  // @TestSetup
  // static void makeData() {
  //   List<Candidate__c> candidates = makeCandidates();
  //   insert candidates;
  // }

  @isTest
  static void testValidateUSAVisaDates() {
    // test all 3 cases onCreate
    List<Candidate__c> candidates = makeCandidates();
    // Test.startTest();
    List<Database.SaveResult> results = Database.insert(candidates, false);
    // Test.stopTest();

    Integer i = 0;
    for (Database.SaveResult result : results) {
      if (math.mod(i, 3) <= 1) {
        System.assert(result.isSuccess() == true);
        System.assert(result.getErrors().size() == 0);
      } else {
        System.assert(result.isSuccess() == false);
        System.assert(result.getErrors().size() == 1);
        System.assert(
          result.getErrors()[0].getMessage() == VISA_DATES_ERROR_TEXT
        );
      }
      i++;
    }

    List<Candidate__c> testCandidates = [
      SELECT
        Name,
        USA_Visa_Holder__c,
        USA_Visa_Valid_From__c,
        USA_Visa_Valid_To__c
      FROM Candidate__c
    ];

    i = 0;

    // test onUpdate - invalid cases: Valid From is empty, Valid To is empty, both are empty
    for (Candidate__c candidate : testCandidates) {
      if (candidate.USA_Visa_Holder__c == true) {
        if (math.mod(i, 3) == 1) {
          candidate.USA_Visa_Valid_From__c = null;
        } else if (math.mod(i, 3) == 2) {
          candidate.USA_Visa_Valid_To__c = null;
        } else {
          candidate.USA_Visa_Valid_From__c = null;
          candidate.USA_Visa_Valid_To__c = null;
        }
        i++;
      }
    }

    // Test.startTest();
    results = Database.update(candidates, false);
    // Test.stopTest();

    i = 0;
    for (Database.SaveResult result : results) {
      if (testCandidates[i].USA_Visa_Holder__c == true) {
        System.assert(result.isSuccess() == false);
        System.assert(result.getErrors().size() == 1);
        System.assert(
          result.getErrors()[0].getMessage() == VISA_DATES_ERROR_TEXT
        );
      } else {
        System.assert(result.isSuccess() == true);
        System.assert(result.getErrors().size() == 0);
      }
      i++;
    }

    // test onUpdate - both Valid To and Valid From are not empty
    testCandidates = [
      SELECT
        Name,
        USA_Visa_Holder__c,
        USA_Visa_Valid_From__c,
        USA_Visa_Valid_To__c
      FROM Candidate__c
    ];

    for (Candidate__c candidate : testCandidates) {
      if (candidate.USA_Visa_Holder__c) {
        candidate.USA_Visa_Valid_From__c = Date.today();
        candidate.USA_Visa_Valid_To__c = Date.today();
      }
    }

    // Test.startTest();
    results = Database.update(candidates, false);
    // Test.stopTest();

    for (Database.SaveResult result : results) {
      System.assert(result.isSuccess() == true);
      System.assert(result.getErrors().size() == 0);
    }
  }
}
