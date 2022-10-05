---
lab:
    title: 'Exercise 3 - Create a Scheduled Query'
    module: 'Module 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Module 7 - Lab 1 - Exercise 3 - Create a Scheduled Query

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod7_L1_Ex3.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to detect and mitigate threats using Microsoft Sentinel. After connecting your data sources to Microsoft Sentinel, you create custom analytics rules to help discover threats and anomalous behaviors in your environment.

Analytics rules search for specific events or sets of events across your environment, alert you when certain event thresholds or conditions are reached, generate incidents for your SOC to triage and investigate, and respond to threats with automated tracking and reMediation processes.


### Task 1: Create a Scheduled Query

In this task, you will create a scheduled query and connect it to the Teams channel you created in the previous exercise.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select **Analytics** from the Configuration area.

1. Select the **+ Create** button and then select **Scheduled query rule**.

1. In the Analytics rule wizard, on the General tab, type the Name *Azure AD Role Assignment Audit Trail*.

1. For Tactics, select **Persistence**.

1. For Severity, select **Low**.

1. Select **Next: Set rule logic >** button:

1. For the rule query, paste in the following KQL statement:

    >**Warning:** When using the Paste function to the virtual machine extra (pipe) characters could be added. Make sure you use Notepad first to paste the following query.

    ```KQL
    AuditLogs  
    | where isnotempty(InitiatedBy.user.userPrincipalName) and Result == 'success' and OperationName contains "member to role" and AADOperationType startswith "Assign"
    | extend InitiatedByUPN = tostring(InitiatedBy.user.userPrincipalName)
    | extend InitiatedFromIP = iff(tostring(AdditionalDetails.[7].value) == '', tostring(AdditionalDetails.[6].value), tostring(AdditionalDetails.[7].value))
    | extend TargetUser = tostring(TargetResources.[2].displayName)
    | extend TargetRoleName = tostring(TargetResources.[0].displayName)
    | project TimeGenerated, InitiatedByUPN, InitiatedFromIP, TargetUser, TargetRoleName, AADOperationType, OperationName
    ```

1. Select **View query results**. You should not receive any results nor any errors. If you receive an error, please review that the query appears just like the previous KQL statement. Close the *Logs* window by selecting the upper right **X** and select **OK** to discard to save changes to go back to the wizard.

1. In the to the "Analytics rule wizard - Create new scheduled rule" blade, under the *Alert enrichment* area, select **Entity mapping** and select the following values: 

    - For the *Entity type* drop-down list select **Account**.
    - For the *Identifier* drop-down list select **FullName**.
    - For the *Value* drop-down list select **InitiatedByUPN**.

1. Then select **Add new entity** and select the following values:

    - For the *Entity type* drop-down list select **IP**.
    - For the *Identifier* drop-down list select **Address**.
    - For the *Value* drop-down list select **InitiatedFromIP**.

1. Scroll down and under *Query scheduling* set the following:

    |Setting|Value|
    |---|---|
    |Run Query every|5 minutes|
    |Look data from the last|1 Day|

    >**Note:** We are purposely generating many incidents for the same data. This enables the Lab to use these alerts.

1. Under the *Alert threshold* area, leave the value unchanged since we want the alert to register every event.

1. Under the *Event grouping* area, leave the **Group all events into a single alert** as the selected option since we want to generate a single alert every time it runs, as long as the query returns more results than the specified alert threshold above.

1. Select the **Next: Incident settings >** button. 

1. On the *Incident settings* tab, review the default options.

1. Select the **Next: Automated response >** button.

1. On the Automated response tab under the *Alert automation* area, select the playbook *PostMessageTeams-OnAlert* you had created in the previous exercise.
1. Under Automation rules (Preview), select **Add new**
1. For the *Automation rule name*, enter **Tier 2**
1. For the *Actions*, select **Assign owner**
1. Then select **Assign to me**. Then select **Apply**.

1. Select the **Next: Review >** button.
  
1. Select **Create**.


### Task 2: Test our new rule

In this task, you will test your new scheduled query rule.

1. In the Search bar of the Azure portal, type *Azure Active Directory*. Then select **Azure Active Directory**.

1. Select **Users** in the Manage area so the "Users - All users" page is displayed.

1. Select user **Christie Cline** in the list so the "Christie Cline - Profile" page is displayed.

1. Select **Assigned roles** in the Manage area so the "Christie Cline - Assigned roles" page is displayed.

1. Select **+ Add assignments** from the command bar.

1. In the *Add assignments* page, *Membership* tab, under *Select role*, select **User Administrator**. and select **Add**.

    >**Note:** You may need to click on the **Refresh** button to see the new role assignment. 
    
1. Click **Next**

1. Click **Assign**

1. Close the "Christie Cline - Assigned roles" and "Users - All users" pages by selecting the 'x' in the top-right, twice.

1. In the "Contoso - Overview" Azure Active Directory page, under *Monitoring*, select **Audit logs**.

1. Select **Export data settings**. Verify that the Microsoft Sentinel's "Azure Active Directory" data connector correctly setup the configuration to send data to your Log Analytics Workspace by reviewing the information under *Diagnostic Settings*.

1. Review that there is a *Diagnostic settings* entry for the *Log Analytics workspace* you created earlier for Sentinel.

1. Close the page by selecting the 'x' in the top-right.

1. Back in the "Contoso - Audit Logs", select **Refresh** until you see the entries for the *Category: RoleManagement* that indicates the change in roles you made earlier.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select the **Incidents** menu option.

    >**Note:** The alert triggered may take 5+ minutes to process. You may continue with the next exercise and return to this point later. For automatic updating of the Incidents page, select the **Auto-refresh incidents** toggle.

1. You should see the newly created Incident. Select the Incident and review the information in the right blade.

1. Go back to Microsoft Teams by selecting the tab in your Edge browser. If you closed it, just open a new tab and type https://teams.microsoft.com. Go to the *SOC* Teams, select the *New Alerts* channel and see the message post about the incident.

## Proceed to Exercise 4
