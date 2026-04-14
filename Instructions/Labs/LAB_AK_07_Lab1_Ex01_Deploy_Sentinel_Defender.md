---
lab:
  title: Exercise 1 - Configure your Microsoft Sentinel environment
  module: Learning Path 7 - Configure your Microsoft Sentinel environment
  description: You're a Security Operations Analyst working at a company that is implementing Microsoft Sentinel. You're responsible for setting up the Microsoft Sentinel environment to meet the company requirement to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.
  duration: 30 minutes
  level: 300
  islab: true
  primarytopics:
    - Microsoft Sentinel
---

# Learning Path 7 - Lab 1 - Exercise 1 - Configure your Microsoft Sentinel environment

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to understand the configuration of the Microsoft Sentinel environment to ensure it meets the company requirements to minimize cost, meet compliance regulations, and provide the most manageable environment for your security team to perform their daily job responsibilities.

>**Important:** The lab exercises for Learning Path #7 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Optional task - Connect Microsoft Sentinel to Microsoft Defender XDR

To understand how Microsoft Sentinel is onboarded to Microsoft Defender XDR, you can perform the instructions for this simulated exercise - **[Connect Microsoft Sentinel to Defender XDR](https://learn.microsoft.com/training/modules/integrate-microsoft-defender-xdr-with-microsoft-sentinel/simulation-exercise-deploy-sentinel-to-defender)**.

  <!---### Task 1 - Explore Microsoft Sentinel settings in Defender XDR --->
    
   <!---1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.
        
            1. In the Microsoft Edge browser, navigate to Defender XDR at <https://security.microsoft.com>.
          
            1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.
        
            1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.
        
                >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password.
           
            1. In the Microsoft Defender navigation menu, scroll down and expand the **System** section.
        
            1. Select **Settings**, and then select **Microsoft Sentinel**.
        
            1. In the *SIEM workspaces*, *Workspaces* pane, the **SentinelWorkspace-01** workspace is listed as Primary and shows a *Connected* Status.
        
            1. Select the **SentinelWorkspace-01** to open the workspace settings options.
        
            1. Expand each of the different sections to explore the available configuration options.
        
            >**Warning:** Do not select the *Disconnect* or *Remove Microsoft Sentinel* icon links. Doing so can impact the functionality of your environment. --->

   <!---### Task 2 - Configure data retention --->

   <!---1. While still on the  workspace settings options page, expand **Log Analytics settings**, and select the **Configure Log Analytics workspace** link.

        1. This opens a new browser tab to the Azure portal's Log Analytics workspace settings for the **SentinelWorkspace-01**.
        
        1. Scroll down the navigation menu and expand the *Settings* section, then select **Usage and estimated costs**.
        
        1. Select **Data retention** from the menu items.
        
        1. Change data retention period to **180 days**.
        
        1. Select **OK**.
        
        1. Return to the Microsoft Defender XDR browser tab, and close the workspace settings options page. --->

### Task 1: Create a Watchlist

In this task, you create a watchlist in Microsoft Sentinel.

1. Sign in to **WIN1** virtual machine as Admin using the provided credentials.

1. In the Microsoft Edge browser, navigate to Defender XDR at `https://security.microsoft.com`.
  
1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password.

1. In the search box at the bottom of the Windows 11 screen, enter *Notepad*. Select **Notepad** from the results.

1. Type *Hostname* then enter for a new line.

1. From row 2 of the notepad, copy the following hostnames, each one in a different line:

    ```Notepad
    Host1
    Host2
    Host3
    Host4
    Host5
    ```

1. From the **File** menu, select **Save As**, in the left pane, select **Documents**, name the file **HighValue.csv**, change the **Save as type** to **All files (*.*)**, and then select **Save**.

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

1. Select **Next: Source >**.

1. Under **Upload file**, select **Browse for files**, browse to the **Documents** folder, select the **HighValue.csv** file you created, and then select **Open**.

1. In the *SearchKey field,* select **Hostname**.

1. Select **Next: Review and Create >**.

1. Review the settings you entered and select **Create**.

1. The screen returns to the Watchlist page.

1. Select **Refresh** from the menu to see the new watchlist.

1. Select the *HighValueHosts* watchlist and on the right pane, select **View in logs**.

    >**Important:** It could take up to ten minutes for the watchlist to appear. **Please continue with the following task and run this command on the next lab**.

    >**Note:** You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

### Task 2: Create a Threat Indicator

In this task, you create an indicator in Microsoft Sentinel.

1. In Microsoft Sentinel, expand the **Threat management** menu, and select the **Threat intelligence** option.

1. Select the **Open Intel management** button.

    >**Note:** This opens a page for consolidated *Intel management* within the *Microsoft Threat Intelligence* section of Defender XDR.

1. Select **+ New** from the command bar.

1. Select the **TI Object**.

1. From the *Object type* dropdown, select **Indicator**.

1. Select the **+ New observable** dropdown and select **Domain name**.

1. For Domain, enter a domain name, for example type *contoso.com*.

1. In the **Name** field, enter the same value used for the Domain.

1. In the *Indicator types*, select **malicious-activity**.

1. Set the **Valid from** field to today's date.

1. Scroll down to the **Description** and enter *This domain is known to be malicious*.

1. Select **Add**.

1. In the Microsoft Defender navigation menu, scroll up and expand the **Investigation & Response** section.

1. Expand the **Hunting** section and select **Advanced hunting**.

    >**Note:** In the default *New Query 1* tab, the **_GetWatchList('HighValueHosts')** query should still be there, and will now produce results if run.

1. Select the **+** sign to create a new query tab.

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
