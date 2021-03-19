public class JobPositionTriggerHandler {
    public static void onAfterInsert(Map<id, Job_Position__c> insertedJobPositions) {
        JobPositionHelper.updateJobPositionTitle(insertedJobPositions);
    }
}
