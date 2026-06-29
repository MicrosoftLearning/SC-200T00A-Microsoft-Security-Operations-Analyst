---
lab:
  title: Exercise 1 - Configure your Microsoft Sentinel environment
  module: Learning Path 6 - Configure your Microsoft Sentinel environment
  description: You're a Security Operations Analyst working at a company that is implementing Microsoft Sentinel. You're responsible for setting up the Microsoft Sentinel environment to meet the company requirement to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.
  duration: 30 minutes
  level: 300
  islab: true
  primarytopics:
    - Microsoft Sentinel
---

# Learning Path 6 - Lab 1 - Exercise 1 - Configure your Microsoft Sentinel environment

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to understand the configuration of the Microsoft Sentinel environment to ensure it meets the company requirements to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.

>**Important:** The lab exercises for Learning Path #6 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Optional task - Connect Microsoft Sentinel to Microsoft Defender XDR

In this interactive guide, which takes approximately 10 minutes to complete, you onboard a new Microsoft Sentinel workspace to Defender XDR.

Select the image below to get started.

[![Thumbnail for Connecting Microsoft Sentinel to Defender XDR.](../media/interactive-guide-sentinel-new.png)](https://microsoftlearning.github.io/click-throughs/docs/IG/interactive_guide_connect_microsoft_sentinel_with_microsoft_defender_xdr_web/story.html?azure-portal=true)

### Task 1: Create a Watchlist

In this task, you create a watchlist in Microsoft Sentinel.

1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.

1. In the Microsoft Edge browser, navigate to Defender XDR at `https://security.microsoft.com`.
  
1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password.

1. In the search box at the bottom of the Windows 11 screen, enter *Notepad*. Select **Notepad** from the results.

1. Type **Hostname** then enter for a new line.

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

1. In the Microsoft Defender navigation menu, scroll to and expand the **Microsoft Sentinel** section.

1. Expand the **Configuration** menu, and select **Watchlist**.

1. Select **+ New** from the command bar.

1. In the Watchlist wizard, enter the following:

    |General setting|Value|
    |---|---|
    |Name|**HighValueHosts**|
    |Description|**High Value Hosts**|
    |Watchlist alias|**HighValueHosts**|

    >**Note:** As this is a shared environment, you may want to add your initials to the watchlist name and alias to avoid conflicts.

2. Select, **Next: Source >**.

3. Select **Browse for files** under *Upload file* and browse for the *HighValue.csv* file you created.

4. In the *SearchKey field,* select **Hostname**.

5. Select **Next: Review and Create >**.

6. Review the settings you entered and select **Create**.

7. The screen returns to the Watchlist page.

8. Select **Refresh** from the menu to see the new watchlist.

9. Select the *HighValueHosts* watchlist and on the right pane, select **View in logs**.

    >**Important:** It could take up to ten minutes for the watchlist to appear. **Please continue to with the following task and run this command on the next lab**.

    >**Note:** You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

### Task 2: Create a Threat Indicator

In this task, you create an indicator in Microsoft Sentinel.

1. In Microsoft Sentinel, expand the *Threat management* menu, and select the **Threat intelligence** option.

1. Select the **Open Intel management** button.

    >**Note:** This opens a page for consolidated *Intel management* within the *Microsoft Threat Intelligence* section of Defender XDR.

1. Select **+ New** from the command bar.

1. Select the **TI Object**.

1. From the *Object type* dropdown, select **Indicator**.

1. Select the **+ New observable** dropdown and select **Domain name**.

1. For Domain, enter a domain name, for example type *contoso.com*.

    >**Important:** If there are existing indicators for the same domain, you should append your initials or a unique identifier such as your student ID to avoid conflicts.

1. In the **Name** field, enter the same value used for the Domain.

1. In the *Indicator types*, select **malicious-activity**.

1. Set the **Valid from** field to today's date.

1. Scroll down to the **Description** and enter *This domain is known to be malicious*.

1. Select **Add**.

1. In the Microsoft Defender navigation menu, scroll up and expand the **Investigation & Response** section.

1. Expand the **Hunting** section and select **Advanced hunting**.

    >**Note:** In the default *New Query 1* tab, the **_GetWatchList('HighValueHosts')** query should still be there, and will now produce results if run.

1. Select the *+* sign to create a new query tab.

1. Run the following KQL statement.

    ```KQL
    ThreatIntelIndicators
    ```

    >**Note:** It could take up to five minutes for the indicator to appear.

1. Scroll the results to the right to see the ObservableValue column. You can also run the following KQL statement to just see the ObservableValue column.

    ```KQL
    ThreatIntelIndicators 
    | project ObservableValue
    ```

### Task 3: Configure log retention

In this task, you'll change the retention period for the SecurityEvent table.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Configuration** section and select **Tables**.

1. In the Search box, type **SecurityEvent**, and then select the table **SecurityEvent** from the results.

    >**Note:** There will be multiple variations of the SecurityEvent table. We recommend selecting the correct *SecurityEvent_CL* table.

1. Select the **Data retention settings** gear icon.

    >**Note:** This opens a page with *Analytics tier* and *Data lake tier* settings.

1. Change the *Analytics retention period* to **90 days**.

1. The *Total retention period* is now **Same as Analytics retention (90 days)**. 

1. Select **Save** to apply the changes.

1. Select the radio button for *Data lake tier*, and notice that Retention is set to *180 days*. 

## You have completed the lab
