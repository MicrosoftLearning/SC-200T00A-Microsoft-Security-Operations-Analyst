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

### Task 1: Access the Microsoft Sentinel Workspace

In this task, you'll access your Microsoft Sentinel workspace.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **defenderWorkspace**, and the required *Content Hub* solutions have been installed.

1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser.

1. In the Edge browser, navigate to the Azure portal at <https://portal.azure.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select the Microsoft Sentinel **defenderWorkspace**.

1. Proceed to the next task.

### Task 2: Connect the Microsoft Defender for Cloud data connector

In this task, you'll connect the Microsoft Defender for Cloud data connector.

1. In the Microsoft Sentinel navigation menu, scroll down to the **Content management** section and select **Content Hub**.

1. In the *Content hub*, search for the **Microsoft Defender for Cloud** solution and select it from the list.

1. On the Microsoft Defender for Cloud solution details page, select **Manage**.

    >**Note:** The *Microsoft Defender for Cloud* solution installs the *Subscription-based Microsoft Defender for Cloud (Legacy)* Data connector, the *Tenant-based Microsoft Defender for Cloud (Preview)* Data connector, and an Analytics rule. The *Tenant-based Microsoft Defender for Cloud (Preview)* Data connector is used when a tenant has multiple subscriptions.

1. Select the *Subscription-based Microsoft Defender for Cloud (Legacy)* Data connector check-box, and select **Open connector page**.

1. In the *Configuration* section, **select** the checkbox for the *MOC Subscription-XXXXXXXXXXX* and select the **Connect** link.

1. The **Status** should now be **Connected**.

1. To enable bi-directional sync, select the **Enable Microsoft Defender for all subscriptions** link.

    >**Note:** You may have to scroll to the right to see the link.

1. On the *Microsoft Defender for Cloud - Getting started* page, the checkbox for the *MOC Subscription-XXXXXXXXXXX* should be selected, and the *Microsoft Defender plan* should display *On - Partial (30 trial days left)*.

1. Select the **X (Close)** button on the upper right to close the *Getting started* page. You should be back on the *Microsoft Defender for Cloud* configuration page.

1. The *Status* for the *MOC Subscription-XXXXXXXXXXX* should be *Connected* and *Bi-directional sync* should be **Enabled**.

    >**Note:** You may need to retry this procedure to see *Bi-directional sync Enabled*. After re-running the steps, try setting the *Bi-directional sync* drop-down to **Enabled**.

### Task 3: Connect the Azure Activity data connector

In this task, you'll connect the *Azure Activity* data connector.

1. In the Microsoft Sentinel navigation menu, scroll down to the *Content management* section and select **Content Hub**.

1. In the *Content hub*, search for the **Azure Activity** solution and select it from the list.

1. On the *Azure Activity* solution details page select **Manage**.

    >**Note:** The *Azure Activity* solution installs the *Azure Activity* Data connector, 13 Analytic rules, 14 Hunting queries and 1 Workbook.

1. Select the *Azure Activity* Data connector and select **Open connector page**.

1. In the *Configuration* area under the *Instructions* tab, scroll down to "2. Connect your subscriptions...", and select **Launch Azure Policy Assignment Wizard>**.

1. In the **Basics** tab, select the ellipsis button (...) under **Scope** and select your *MOC Subscription-XXXXXXXXXXX* subscription from the drop-down list and click **Select**.

    >**Note:** *Do not* select an optional Resource Group.

1. Select the **Parameters** tab, choose your *uniquenameDefender* workspace from the **Primary Log Analytics workspace** drop-down list. This action applies the subscription configuration to send the information to the Log Analytics workspace.

1. Select the **Remediation** tab and select the **Create a remediation task** checkbox. This action applies the policy to existing Azure resources.

1. Select the **Review + Create** button to review the configuration.

1. Select **Create** to finish.

## Proceed to Exercise 2
