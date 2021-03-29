public with sharing class JobPositionHelper {
  public static final String SF_PRACTICE_UNIT = 'Salesforce';
  public static final String SF_NAME_PREFIX = 'SF-';
  public static final String HIGH_BUDGET_APPLICATION_TASK_TITLE = 'Review high budget position: ';
  public static final String HIGH_BUDGET_APPLICATION_EMAIL_TEXT = 'Please review this high budget position: ';

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
    List<Job_Position__c> updatedJobPositions
  ) {
    Set<Id> hrManagerIds = new Set<Id>();
    for (Job_Position__c jobPosition : updatedJobPositions) {
      hrManagerIds.add(jobPosition.HR_Manager__c);
    }
    Map<Id, Contact> hrManagers = new Map<Id, Contact>(
      [SELECT Id, Email FROM Contact WHERE Id IN :hrManagerIds]
    );

    List<Task> tasks = new List<Task>();
    List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

    for (Job_Position__c jobPosition : updatedJobPositions) {
      if (jobPosition.Position_Budget__c > 5000) {
        tasks.add(
          new Task(
            OwnerId = UserInfo.getUserId(),
            WhoId = jobPosition.HR_Manager__c,
            Subject = HIGH_BUDGET_APPLICATION_TASK_TITLE + jobPosition.Name
          )
        );

        Contact hrManager = hrManagers.get(jobPosition.HR_Manager__c);

        if (hrManager.email != null) {
          Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
          String messageText =
            HIGH_BUDGET_APPLICATION_EMAIL_TEXT + jobPosition.Name;
          message.setToAddresses(new List<String>{ hrManager.email });
          message.setSubject(messageText);
          message.setPlainTextBody(messageText);
          messages.add(message);
        }
      }
    }

    insert tasks;
    Messaging.sendEmail(messages);
  }
}
