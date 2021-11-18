---
lab:
    title: 'Exercise 1 - Configure your Azure Sentinel environment'
    module: 'Module 5 - Configure your Azure Sentinel environment'
---

# Module 5 - Lab 1 - Exercise 1 - Configure your Azure Sentinel environment

## Lab scenario

You're a Security Operations Analyst working at a company that is implementing Azure Sentinel. You're responsible for setting up the Azure Sentinel environment to meet the company requirement to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.


### Task 1: Initialize the Azure Sentinel Workspace.

In this task, you will create an Azure Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Edge browser.

3. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select **+ Create**.

8. Next, select **+ Create a new workspace**.

    >**Note:** First, you create a new Log Analytics Workspace.

9. Select your proper Subscription.

10. Select the **Create New** link for the Resource Group and enter a new resource group name of your choosing and select **Ok**.

11. Under *Instance details* in the name field enter a name for your choosing for the Log Analytics Workspace.

    >**Note:** This name will also be the Azure Sentinel workspace name.

12. Select the region that is appropriate for you. The appropriate region may default or your instructor may have specific advice on which region to select.  

13. Select **Review + Create**.

14. In the Create Log Analytics workspace area select **Create**. Wait for the new Log Analytics workspace to appear in the list on the *Add Azure Sentinel to a workspace* page.  This may take a minute.

15. Select your newly created workspace when it appears, then select **Add**. This could take a few minutes.

16. Navigate around the newly created Azure Sentinel workspace to become familiar with the user interface options.


### Task 2: Create a Watchlist.

In this task, you will create a watchlist in Azure Sentinel.

1. In the search box at the bottom of the Windows 10 screen, enter *Notepad*.  Select **Notepad** from the results.

2. Type *Hostname* then enter for a new line.

3. In Row 2 through 6 of the notepad, copy the following hostnames, each one in a different line:

```Notepad
Host1
Host2
Host3
Host4
Host5
```

4. From the menu select, **File - Save As**, Name the file *HighValue.csv*.  Then change the file type to **All files(*.*)**.  Then select **Save**.  The file can be saved in the *Documents* folder for the PC.

5. Close Notepad.

6. In Azure Sentinel, select the **Watchlist** option in the Configuration area.

7. Select **+ Add new** from the command bar.

8. In the Watchlist wizard, enter the following:

    |General setting|Value|
    |---|---|
    |Name|**HighValueHosts**|
    |Description|**High Value Hosts**|
    |Watchlist alias|**HighValueHosts**|

9. Select, **Next: Source >**.

10. Select **Browse for files** under *Upload file* and browse for the *HighValue.csv* file you just created.

11. In the *SearchKey field* select **Hostname**.

12. Select **Next: Review and Create >**.

13. Review the settings you entered and select **Create**.

14. The screen returns to the watchlists list.

15. Select your new watchlist.  On the right tab, select **View in Log Analytics**.

16. You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

```KQL
_GetWatchlist('HighValueHosts')
```

>**Note:** It could take a couple of minutes for the import to complete. You can continue with the following task and come back later to run this command.

17. Close the *Logs* window by selecting the 'x' in the top-right and click **OK** to discard the unsaved edits.


### Task 3: Create a Threat Indicator.

In this task, you will create an indicator in Azure Sentinel.

1. In Azure Sentinel, select the **Threat intelligence** option in the Threat management area.

2. Select **+ Add New** from the command bar.

3. Review the different indicator types available in the *Types* dropdown. Select the **domain-name**. Enter your initials in the Domain box. An example would be *fmg.com*.

4. For the *Threat types*, select **malicious-activity**.

5. For the *Name*, enter the same value used for the Domain. An example would be *fmg.com*.

6. Set the *Valid from* field to today's date.

7. Select **Apply**.

    >**Note:** It could take a couple of minute for the indicator to appear.

8. Select the **Logs** option in the General area. You may need to disable the "Always show queries" option and close the *Queries* window to get run the statements.

9. Run the following KQL statement.

```KQL
ThreatIntelligenceIndicator
```
Scroll the results to the right to see the DomainName column. You can also run the following KQL statement to just see the DomainName column.  

```KQL
ThreatIntelligenceIndicator
| project DomainName
```

## You have completed the lab.
