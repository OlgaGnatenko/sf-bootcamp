public with sharing class JobPositionHelper {
    public static final String SF_PRACTICE_UNIT = 'Salesforce';
    public static final String SF_NAME_PREFIX = 'SF-';


    public static void updateJobPositionTitle(List<Job_Position__c> insertedJobPositions) {
        for (Job_Position__c jobPosition: insertedJobPositions) {
            if (jobPosition.Practice_Unit__c == SF_PRACTICE_UNIT) {
                jobPosition.Name = SF_NAME_PREFIX + jobPosition.Name;
            }
        }
    }
}