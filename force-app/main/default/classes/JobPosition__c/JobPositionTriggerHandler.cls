public with sharing class JobPositionTriggerHandler {
  public static void onBeforeInsert(
    List<Job_Position__c> insertedJobPositions
  ) {
    JobPositionHelper.updateJobPositionTitle(insertedJobPositions);
  }

  public static void onAfterUpdate(List<Job_Position__c> updatedJobPositions) {
    JobPositionHelper.reviewHighBudgetApplication(updatedJobPositions);
  }
}
