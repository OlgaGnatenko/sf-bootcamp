public class JobPositionHelper {
    public static final String SF_JOB_POSITION_PRACTICE_UNIT = 'Salesforce';
    public static final String SF_JOB_POSITION_NAME_PREFIX = 'SF';


    public static void updateJobPositionTitle(List<Job_Position__c> insertedJobPositions) {
        for (Job_Position__c jobPosition: insertedJobPositions) {
            if (jobPosition.Practice_Unit__c == SF_JOB_POSITION_PRACTICE_UNIT) {
                jobPosition.Name = SF_JOB_POSITION_NAME_PREFIX + jobPosition.Name;
            }
        }
    }
}
