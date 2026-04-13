---
lab:
    title: 'Exercise 2 - Create a Scheduled Query from a template'
    module: 'Learning Path 9 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 9 - Lab 1 - Exercise 2 - Create a Scheduled Query from a template

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to detect and mitigate threats using Microsoft Sentinel. After connecting your data sources to Microsoft Sentinel, you create custom analytics rules to help discover threats and anomalous behaviors in your environment.

Analytics rules search for specific events or sets of events across your environment, alert you when certain event thresholds or conditions are reached, generate incidents for your SOC to triage and investigate, and respond to threats with automated tracking and remediation processes.

>**Important:** The lab exercises for Learning Path #9 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 45 minutes

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **sentinelworkspace-01**, and the *Azure Activity* solution and data connector have been installed and connected.

<!--- To sucessfully complete this task you wil need to complete the following prerequisite tasks.

### Prerequisite task: Connect the Azure Activity data connector

In this task, you will connect the *Azure Activity* data connector.

1. In the Microsoft Sentinel navigation menu, scroll down to the *Content management* section and select **Content Hub**.

1. In the *Content hub*, search for the **Azure Activity** solution and select it from the list.

1. On the *Azure Activity* solution details page select **Manage**.

1. Select the *Azure Activity* Data connector and select **Open connector page**.

1. In the *Configuration* area under the *Instructions* tab, scroll down to "2. Connect your subscriptions...", and select **Launch Azure Policy Assignment Wizard>**.

1. In the **Basics** tab, select the ellipsis button (...) under **Scope** and select your *MOC Subscription-XXXXXXXXXXX* subscription from the drop-down list and click **Select**.

    >**Note:** *Do not* select an optional Resource Group.

1. Select the **Parameters** tab, choose your *sentinelworkspace-01* workspace from the **Primary Log Analytics workspace** drop-down list. This action will apply the subscription configuration to send the information to the Log Analytics workspace.

1. Select the **Remediation** tab and select the **Create a remediation task** checkbox. This action will apply the policy to existing Azure resources.

1. Select the **Review + Create** button to review the configuration.

1. Select **Create** to finish.

1. Please wait for the *Azure Activity* data connector to display a *Connected* status before proceeding. --->

### Task 1: Create a Scheduled Query rule

In this task, you create a *Microsoft Sentinel analytics scheduled query rule*.

1. Sign in to **WIN1** virtual machine as Admin using the provided credentials.

1. Open **Microsoft Edge** browser and navigate to **Microsoft Defender XDR** at `https://security.microsoft.com`.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Configuration** section, and select **Analytics**.

1. In the **Analytics** page, select the **Rule templates** tab, and search for **New CloudShell User**.

1. Select the **New CloudShell User** rule to open the rule details pane. Verify that you are receiving data by reviewing the green icon under *Data sources: Azure Activity*.

    > **Note:** If the data source is not shown as connected, and you completed the *Prerequisite task* above, you may need to wait longer for the process to complete.

1. Select **Create rule**.

1. In the Analytics rule wizard, on the **General** tab, change the *Severity* to **Medium**.

1. Select **Next: Set rule logic >** button:

1. For the rule query, select **View query results**. You shouldn't receive any results nor any errors.

1. Close the **Logs** window by selecting the upper right **X** and select **OK** to discard to save changes to go back to the wizard.

1. Scroll down and under *Query scheduling* set the following:

    |Setting|Value|
    |---|---|
    |Run Query every|5 minutes|
    |Lookup data from the last|1 Days|

    >**Note:** We are purposely generating many incidents for the same data. This enables the Lab to use these alerts.

1. Under the **Alert threshold** area, leave the value unchanged since we want the alert to register every event.

1. Under the **Event grouping** area, leave the **Group all events into a single alert** as the selected option since we want to generate a single alert every time it runs, as long as the query returns more results than the specified alert threshold above.

1. Select the **Next: Incident settings >** button.

1. On the **Incident settings** tab, review the default options.

1. Select the **Next: Automated response >** button.

1. Select the **Next: Review and create >** button, review the details, and then select **Save**.

### Task 2: Edit your new rule

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Configuration** section and select **Analytics**.

1. Make sure that you are in the **Active rules** tab in the command bar and select the **New CloudShell User** rule.

1. Right click the rule and select **Edit** from the **pop-up** menu.

1. Select the **Next: Set rule logic >** button.

1. Select the **Next: Incident settings >** button.

1. Select the **Next: Automated response >** button.

1. On the **Automated response** tab under **Automation rules**, select **+ Add new**.

1. For the *Automation rule name*, enter **Tier 2**.

1. For the *Actions*, select **Assign owner**.

1. Then select **Assign to me**.

1. Select **Apply**.

1. Select the **Next: Review and create >** button, review the details, and then select **Save**.
  
### Task 3: Test your new rule

In this task, you test your new scheduled query rule. You start by enabling *Cloud Shell* in the Azure portal, which will trigger the rule you created in the previous task and generate an incident.

1. In the Microsoft Edge browser, navigate to the Azure portal at `https://portal.azure.com`.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. On the menu bar of the Azure portal, Select the icon **>_** that corresponds to *Cloud Shell*. You might need to select the ellipsis icon first **(...)** if your display resolution is too low.

1. In the **Welcome to Azure Cloud Shell** window, select **Powershell**.

1. On the **Getting started** page, select **Mount storage account**, and then select your **_XXXXXXXXX-MicrosoftSentinelLabs** from the *storage account subscription* drop-down menu item and select the **Apply** button.

    >**Important:** Do not select the *No storage account required* radio button option. This will cause the incident creation to fail.

1. On the **Mount storage account** page, select **We will create a storage account for you**, and then select **Next**.

1. Wait until the Cloud Shell is provisioned, then close the Azure Cloud Shell window.

1. In the Search bar of the Azure portal, type *Activity* and then select **Activity Log**.

1. Make sure the following *Operation name* items appear: **List Storage Account Keys** and **Update Storage Account Create**. These are the operations that the KQL query you reviewed earlier will match to generate the alert. **Hint:** You might need to select **Refresh** to update the list.

1. Return to Defender XDR at `https://security.microsoft.com`.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Investigation & response** section. 

1. Expand the **Incidents & alerts** section, and then select **Incidents**.

1. You should see the newly created Incident.

    >**Note:** The event that triggers the incident may take 5+ minutes to process. Continue with the next exercise, you will come back to this view later.

1. Select the Incident and review the information in the right blade.

## Proceed to Exercise 3
