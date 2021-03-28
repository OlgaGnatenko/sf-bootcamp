public with sharing class JobPositionTriggerHandler {
  public static void onBeforeInsert(
    List<Job_Position__c> insertedJobPositions
  ) {
    JobPositionHelper.updateJobPositionTitle(insertedJobPositions);
  }

  public static void onAfterUpdate(Map<Id, Job_Position__c> newPositionsMap) {
    JobPositionHelper.reviewHighBudgetApplication(newPositionsMap);
  }
}
