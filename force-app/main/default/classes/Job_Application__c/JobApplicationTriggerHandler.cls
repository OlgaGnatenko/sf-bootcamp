public with sharing class JobApplicationTriggerHandler {
    public static void onBeforeInsert(List<Job_Application__c> insertedJobApplications) {
        JobApplicationHelper.validateUSAVisaExpiryDate(insertedJobApplications);
    }
}