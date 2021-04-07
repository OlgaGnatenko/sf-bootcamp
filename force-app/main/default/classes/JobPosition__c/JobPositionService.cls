public with sharing class JobPositionService {
  public static List<Job_Position__c> getJobPositions(String practiceUnit) {
    if (practiceUnit == null)
      return [
        SELECT
          Name,
          Priority__c,
          Job_Position_Title__c,
          Candidate_Level__c,
          Practice_Unit__c,
          Location__c,
          Position_Budget__c
        FROM Job_Position__c
        ORDER BY Priority__c, Name
      ];
    return [
      SELECT
        Name,
        Priority__c,
        Job_Position_Title__c,
        Candidate_Level__c,
        Practice_Unit__c,
        Location__c,
        Position_Budget__c
      FROM Job_Position__c
      WHERE Practice_Unit__c = :practiceUnit
      ORDER BY Priority__c, Name
    ];
  }
}
