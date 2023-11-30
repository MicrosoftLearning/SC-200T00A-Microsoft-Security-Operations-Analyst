# Module 6 Create detections and perform investigations with Microsoft Sentinel

**Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md). 

## Create a NRT query rule

In this task, you will create a NRT (Near Real Time) analytics query rule.

1. Select the **Analytics** page under *Configuration* in Microsoft Sentinel.

1. Select the **Create** tab, then **NRT query rule**.

1. This starts the "Analytics rule wizard". For the *General* tab type:

    |Setting|Value|
    |---|---|
    |Name|**NRT PowerShell Hunt**|
    |Description|**NRT PowerShell Hunt**|
    |Tactics and Techniques|**Command and Control**|
    |Severity|**High**|

1. Select **Next: Set rule logic >** button. 

1. For the *Rule query* enter the following KQL statement:

    ```KQL
    let lookback = 2d; 
    SecurityEvent 
    | where TimeGenerated >= ago(lookback) 
    | where EventID == 4688 and Process =~ "powershell.exe"
    | extend PwshParam = trim(@"[^/\\]*powershell(.exe)+" , CommandLine) 
    | project TimeGenerated, Computer, SubjectUserName, PwshParam 
    | summarize min(TimeGenerated), count() by Computer, SubjectUserName, PwshParam
    ```

1. Select **View query results >** to make sure your query does not have any errors.

1. Close the *Logs* window by selecting the **X** in the top-right of the window and select **OK** to discard the changes. 

1. Select **Test with current data** under *Results simulation*. Notice the expected number of *Alerts per day*.

1. Under *Entity mapping* select:

    - For the *Entity type* drop-down list select **Host**.
    - For the *Identifier* drop-down list select **HostName**.
    - For the *Value* drop-down list select **Computer**.

1. Scroll down and select **Next: Incident settings>** button.

1. For the *Incident settings* tab, leave the default values and select the **Next: Automated response >** button.

1. Select **Next: Review + create >**.

1. On the *Review and create* tab, select the **Save** button to create and save the new Scheduled Analytics rule.

## Attack Detection Windows configured with the Azure Monitor Agent (AMA)

In this task, you will investigate the incident created from the `NRT` rule you created.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account for admin provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** for admin provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. In `Microsoft Sentinel`, go to the `Threat management` menu section and select **Incidents**

**Note** It may take several minutes for the `Incident` to appear.

1. You should see an incident that matches the `Severity` and `Title` you configured in the `NRT` rule you created

1. Select the `Incident` and the `detail` pane opens

1. Select **View full details** and select the **Investigate** button.

1. Explore the `Entities` associate with then `NRT PowerShell Hunt` incident.

1. Close the `Investigation` window by selecting the **X** in the top-right of the window.

1. Select the `Logs` tab and enter the following KQL statement:

    ```KQL
    let lookback = 2d; 
    SecurityEvent 
    | where TimeGenerated >= ago(lookback) 
    | where EventID == 4688 and Process =~ "powershell.exe"
    | extend PwshParam = trim(@"[^/\\]*powershell(.exe)+" , CommandLine) 
    | project TimeGenerated, Computer, SubjectUserName, PwshParam 
    | summarize min(TimeGenerated), count() by Computer, SubjectUserName, PwshParam
    ```

**Note** You may find this query in the `Queries History`, and can **Run** it from there.

1. Select the **Done** button to close the `Logs` window.

1. Close the `Incident` window by selecting the **X** in the top-right of the window.

## You have completed the Demo
