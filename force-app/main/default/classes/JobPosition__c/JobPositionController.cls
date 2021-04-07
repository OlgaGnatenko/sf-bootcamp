public with sharing class JobPositionController {
  @AuraEnabled(cacheable=true)
  public static List<Job_Position__c> getJobPositions() {
    try {
      List<Job_Position__c> jobPositions = JobPositionService.getJobPositions(null);
      System.debug('jobPositions');
      System.debug(jobPositions);
      return jobPositions;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
