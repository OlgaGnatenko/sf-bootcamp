<?xml version="1.0" encoding="UTF-8"?>
<Profile xmlns="http://soap.sforce.com/2006/04/metadata">
    <applicationVisibilities>
        <application>Hiring_Application</application>
        <default>false</default>
        <visible>true</visible>
    </applicationVisibilities>
    <custom>true</custom>
    <fieldPermissions>
        <editable>true</editable>
        <field>Candidate__c.Phone_Number__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Candidate__c.Working_Company__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.Approval_Status__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Application__c.Desired_Salary__c</field>
        <readable>false</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Application__c.HR_Manager_s_Phone__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.Hire_Reasoning__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.Recovered__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.USA_Visa_Holder__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.USA_Visa_Valid_From__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Application__c.USA_Visa_Valid_To__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Client__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Position__c.Company_Offices__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Location__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Position__c.Maximal_requested_salary__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Position__c.Minimal_requested_salary__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Open_Due_Date__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Position_Budget__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Position_Description__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Practice_Unit__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Job_Position__c.Total_number_of_applications__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Job_Position__c.Willing_to_work_remote__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <layoutAssignments>
        <layout>Candidate__c-Candidate Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Job_Application__c-Job Application Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Job_Position__c-External Job Position Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Job_Position__c-External Job Position Layout</layout>
        <recordType>Job_Position__c.External_Job_Position</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Job_Position__c-Internal Job Position Layout</layout>
        <recordType>Job_Position__c.Internal_Job_Position</recordType>
    </layoutAssignments>
    <objectPermissions>
        <allowCreate>true</allowCreate>
        <allowDelete>true</allowDelete>
        <allowEdit>true</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Candidate__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <objectPermissions>
        <allowCreate>false</allowCreate>
        <allowDelete>false</allowDelete>
        <allowEdit>true</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Job_Application__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <objectPermissions>
        <allowCreate>false</allowCreate>
        <allowDelete>false</allowDelete>
        <allowEdit>false</allowEdit>
        <allowRead>true</allowRead>
        <modifyAllRecords>false</modifyAllRecords>
        <object>Job_Position__c</object>
        <viewAllRecords>false</viewAllRecords>
    </objectPermissions>
    <recordTypeVisibilities>
        <default>false</default>
        <recordType>Job_Position__c.External_Job_Position</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <recordTypeVisibilities>
        <default>true</default>
        <recordType>Job_Position__c.Internal_Job_Position</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <tabVisibilities>
        <tab>Candidate__c</tab>
        <visibility>DefaultOn</visibility>
    </tabVisibilities>
    <tabVisibilities>
        <tab>Job_Position__c</tab>
        <visibility>Hidden</visibility>
    </tabVisibilities>
    <userLicense>Salesforce Platform</userLicense>
    <userPermissions>
        <enabled>false</enabled>
        <name>AccessCMC</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ActivitiesAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AddDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>AllowEmailIC</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>AllowLightningLogin</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowUniversalSearch</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowViewKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApexRestServices</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApiEnabled</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AssignTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>BotManageBots</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>BotManageBotsTrainingData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanAccessCE</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanApproveFeedPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanUseNewDashboardBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CanVerifyComment</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChangeDashboardColors</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChatterComposeUiCodesnippet</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterEditOwnPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ChatterEditOwnRecordPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterFileLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInternalUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInviteExternalUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterOwnGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CloseConversations</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConfigCustomRecs</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConnectOrgToEnvironmentHub</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ConsentApiUpdate</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ContentHubUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ContentWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateCustomizeDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateDashboardFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateLtngTempFolder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateLtngTempInPub</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateReportFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateReportInLightning</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CreateWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CustomMobileAppsAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>CustomSidebarOnAllPages</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>DeleteTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DistributeFromPersWksp</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditBrandTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditEvent</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditHtmlTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditMyDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditMyReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicDocuments</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>EditPublicTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTask</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailMass</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailSingle</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableCommunityAppLauncher</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExportReport</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>FeedPinning</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ForceTwoFactor</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>GiveRecognitionBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>GovernNetworks</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>HideReadByList</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IPRestrictRequests</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IdentityEnabled</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ImportCustomObjects</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ImportPersonal</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IsotopeAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>IsotopeLEX</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>LearningManager</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>LightningExperienceUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ListEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>LtngPromoReserved01UserPerm</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageBusinessHourHolidays</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageContentPermissions</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageDashbdsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageDynamicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageEntitlements</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageExternalConnections</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageReportsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageSecurityCommandCenter</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ManageUnlistedGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>MassInlineEdit</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>MergeTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModerateChatter</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModerateNetworkUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ModifyDataClassification</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>NativeWebviewScrolling</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>NewReportBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>Packaging2PromoteVersion</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PasswordNeverExpires</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PreventClassicExperience</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>PrivacyDataAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>QuipMetricsAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>QuipUserEngagementMetrics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RemoveDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>RunFlow</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RunReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SandboxTestingInCommunityApp</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SelectFilesFromSalesforce</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SendAnnouncementEmails</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SendCustomNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ShareInternalArticles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ShowCompanyNameAsUserBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SkipIdentityConfirmation</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeDashboardRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeDashboardToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeReportsRunAsUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeToLightningDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>SubscribeToLightningReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>TransactionalEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>TransferAnyEntity</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>TwoFactorApi</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseWebLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewAllCustomSettings</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewAllForeignKeyNames</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewEncryptedData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewFlowUsageAndFlowEventData</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewHelpLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewMyTeamsDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewPublicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewPublicReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewRoles</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>ViewSecurityCommandCenter</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewSetup</name>
    </userPermissions>
    <userPermissions>
        <enabled>false</enabled>
        <name>WorkCalibrationUser</name>
    </userPermissions>
</Profile>
