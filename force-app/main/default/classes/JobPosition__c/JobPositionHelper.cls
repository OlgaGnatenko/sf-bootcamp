public with sharing class JobPositionHelper {
  public static final String SF_PRACTICE_UNIT = 'Salesforce';
  public static final String SF_NAME_PREFIX = 'SF-';
  public static final String HIGH_BUDGET_APPLICATION_TASK_TITLE = 'Review high budget application: ';
  public static final String HIGH_BUDGET_APPLICATION_EMAIL_TEXT = 'Please review this high budget application: ';

  public static void updateJobPositionTitle(
    List<Job_Position__c> insertedJobPositions
  ) {
    for (Job_Position__c jobPosition : insertedJobPositions) {
      if (jobPosition.Practice_Unit__c == SF_PRACTICE_UNIT) {
        jobPosition.Name = SF_NAME_PREFIX + jobPosition.Name;
      }
    }
  }

  public static void reviewHighBudgetApplication(
    Map<Id, Job_Position__c> updatedJobPositions
  ) {
    for (Job_Position__c jobPosition : updatedJobPositions) {
      if (jobPosition.Position_Budget__c > 5000) {
      }
    }
  }
}
