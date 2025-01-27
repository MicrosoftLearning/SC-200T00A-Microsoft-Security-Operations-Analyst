---
lab:
    title: 'Exercise 1 - Configure your Microsoft Sentinel environment'
    module: 'Learning Path 7 - Configure your Microsoft Sentinel environment'
---

# Learning Path 7 - Lab 1 - Exercise 1 - Configure your Microsoft Sentinel environment

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft Sentinel. You are responsible for setting up the Microsoft Sentinel environment to meet the company requirement to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.

>**Important:** The lab exercises for Learning Path #7 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Task 1 - Create a Log Analytics workspace

Create a Log Analytics workspace, including region option. Learn more about [onboarding Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/quickstart-onboard).

1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.

1. In the Microsoft Edge browser, navigate to the Azure portal at <https://portal.azure.com>.
  
1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type "Microsoft Sentinel", then select

1. Select **+ Create**.

1. Select **Create a new workspace**.

1. Select **Create new** for the Resource group.

1. Enter *Defender-RG* and select **Ok**.

1. For the Name, enter *defenderWorkspace*.

1. You can leave the default region for the workspace.

1. Select **Review + create** to validate the new workspace.

1. Select **Create** to deploy the workspace.

### Task 2 - Deploy Microsoft Sentinel to a workspace

Deploy Microsoft Sentinel to the workspace.

1. When the workspace deployment completes, select **Refresh** to display the new workspace.

1. Select the workspace you want to add Sentinel to (created in Task 1).

1. Select **Add**.

### Task 3 - Configure data retention

1. In the Microsoft Azure "breadcrumb" menu, select **Home**.

1. In the Search bar of the Azure portal, type "Log Analytics" and select the workspace created in Task 1.

1. Expand the *Settings* section in the navigation menu and select **Usage and estimated costs**.

1. Select **Data retention**.

1. Change data retention period to **180 days**.

1. Select **OK**.

### Task 4: Create a Watchlist

In this task, you will create a watchlist in Microsoft Sentinel.

1. In the search box at the bottom of the Windows 10 screen, enter *Notepad*. Select **Notepad** from the results.

1. Type *Hostname* then enter for a new line.

1. From row 2 of the notepad, copy the following hostnames, each one in a different line:

    ```Notepad
    Host1
    Host2
    Host3
    Host4
    Host5
    ```

1. From the menu select, **File - Save As**, Name the file *HighValue.csv*, change the file type to **All files(*.*)** and select **Save**. **Hint:** The file can be saved in the *Documents* folder.

1. Close Notepad.

1. In Microsoft Sentinel, select the **Watchlist** option under the Configuration area.

1. Select **+ New** from the command bar.

1. In the Watchlist wizard, enter the following:

    |General setting|Value|
    |---|---|
    |Name|**HighValueHosts**|
    |Description|**High Value Hosts**|
    |Watchlist alias|**HighValueHosts**|

1. Select, **Next: Source >**.

1. Select **Browse for files** under *Upload file* and browse for the *HighValue.csv* file you just created.

1. In the *SearchKey field* select **Hostname**.

1. Select **Next: Review and Create >**.

1. Review the settings you entered and select **Create**.

1. The screen returns to the Watchlist page.

1. Select the *HighValueHosts* watchlist and on the right pane, select **View in logs**.

    >**Important:** It could take up to ten minutes for the watchlist to appear. **Please continue to with the following task and run this command on the next lab**.

    >**Note:** You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

1. Close the *Logs* window by selecting the 'x' in the top-right and select **OK** to discard the unsaved edits.

### Task 5: Create a Threat Indicator

In this task, you will create an indicator in Microsoft Sentinel.

1. In Microsoft Sentinel, select the **Threat intelligence** option in the Threat management area.

1. Select **+ Add New** from the command bar.

1. Select the **TI Object**.

1. From the *Object type* dropdown, select **Indicator**.

1. Select the **+ New observable** dropdown and select **Domain name**.

1. For Domain, enter a domain name, for example type *contoso.com*.

1. In the **Name** field enter the same value used for the Domain.

1. In the *Indicator types*, select **malicious-activity**.

1. Enter a **Description**

1. Set the **Valid from** field to today's date.

1. Select **Add**.

1. Select the **Logs** option under the General area. You might want to disable the "Always show queries" option and close the *Queries* window to run the KQL statements.

1. Run the following KQL statement.

    ```KQL
    ThreatIntelligenceIndicator
    ```

    >**Note:** It could take up to five minutes for the indicator to appear.

1. Scroll the results to the right to see the DomainName column. You can also run the following KQL statement to just see the DomainName column.

    ```KQL
    ThreatIntelligenceIndicator 
    | project DomainName
    ```

### Task 6: Configure log retention

In this task, you will change the retention period for the SecurityEvent table.

1. In Microsoft Sentinel, select the **Settings** option under the *Configuration* area.

1. Select **Workspace settings**.

1. In Log Analytics workspace, select the **Tables** option under the *Settings* area.

1. Search and select the table **SecurityEvent**, and then select the ellipsis button (...).

1. Select **Manage Table**.

1. Select **180 days** for *Total retention period*. Notice that *Archive period* is only 150 days, since it uses 30 days from the (default) *Interactive retention*.

1. Select **Save** to apply the changes.

## You have completed the lab
