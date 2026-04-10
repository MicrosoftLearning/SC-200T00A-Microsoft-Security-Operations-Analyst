---
lab:
    title: 'Exercise 1 - Connect data to Microsoft Sentinel using data connectors'
    module: 'Learning Path 8 - Connect logs to Microsoft Sentinel'
---

# Learning Path 8 - Lab 1 - Exercise 1 - Connect data to Microsoft Sentinel using data connectors

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod6_L1_Ex1.png)

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to connect log data from the many data sources in your organization. The organization has data from Microsoft 365, Microsoft Defender XDR, Azure resources, nonazure virtual machines, etc. You start connecting the Microsoft sources first.

>**Important:** The lab exercises for Learning Path #8 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 20 minutes

### Task 1: Access the Microsoft Sentinel Workspace in Microsoft Defender XDR

In this task, you'll access your Microsoft Sentinel workspace.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **sentinelworkspace-01**, and the required *Content Hub* solutions have been installed.

1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser.

1. In the Edge browser, navigate to the Azure portal at <https://security.microsoft.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. Proceed to the next task.

### Task 2: Manage the Microsoft Defender for Cloud data connector

In this task, you'll explore management of the Microsoft Defender for Cloud data connector.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Content management** section and select **Content Hub**.

1. In the *Content hub*, search for the **Microsoft Defender for Cloud** solution and select it from the list.

1. On the Microsoft Defender for Cloud solution details page, select **Manage**.

    >**Note:** The *Microsoft Defender for Cloud* solution installs the *Subscription-based Microsoft Defender for Cloud (Legacy)* Data connector, the *Tenant-based Microsoft Defender for Cloud (Preview)* Data connector, and an Analytics rule. The *Tenant-based Microsoft Defender for Cloud (Preview)* Data connector is used when a tenant has multiple subscriptions.

1. Select the *Tenant-based Microsoft Defender for Cloud* Data connector check-box, and select **Open connector page**.

1. A new browser tab will open on the Azure portal Data Connector page. The status should show *Connected*.

1. Review the *Configuration* section of the *Instructions* tab.

1. Note that "Microsoft Defender for Cloud alerts are connected to stream through the Microsoft 365 Defender" now, and that you "Cannot disconnect while Microsoft Defender XDR is connected".

1. Also note in the *Details pane* that the *Data types* use the *SecurityAlert* table.

1. You can now close this browser tab and return to Microsoft Defender XDR.

### Task 3: Manage the Azure Activity data connector

In this task, you'll explore management of the *Azure Activity* data connector.

1. You should still be in the Microsoft Sentinel *Content Hub*.

1. In the *Content hub*, search for the **Azure Activity** solution and select it from the list.

1. On the *Azure Activity* solution details page select **Manage**.

    >**Note:** The *Azure Activity* solution installs the *Azure Activity* Data connector, 13 Analytic rules, 14 Hunting queries and 1 Workbook.

1. Select the *Azure Activity* Data connector and select **Open connector page**.

1. Note that the status should show *Connected*

1. In the **Setup** tab, *Table management* section,  select the checkbox for the **AzureActivity** table. The *Gear* wheel for *Data retention settings* appears.

1. Select the **Data retention settings** and review the *Manage AzureActivity* settings in *Analytics tier*.

    >**Note:** This data connector is fully ported to Defender XDR.

1. Close out of the *Manage AzureActivity* page by selecting the **X** in the upper right corner.

1. Select the **Advanced options** tab at the top of page and review the *Configure UEBA* settings. Note that this setting is enabled for *Azure Activity.

1. Follow the browser *breadcrumbs* trail back to the *Content hub to finish.

## Proceed to Exercise 2
