---
lab:
    title: 'Exercise 4 - Explore Entity Behavior Analytics'
    module: 'Learning Path 9 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 9 - Lab 1 - Exercise 4 - Explore Entity Behavior Analytics

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules.

You need to configure Microsoft Sentinel to perform Entity Behavior Analytics to discover anomalies and provide entity analytic pages.

>**Important:** The lab exercises for Learning Path #9 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 15 minutes

### Task 1: Explore Entity Behavior

In this task, you will explore Entity behavior analytics in Microsoft Sentinel.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **defenderWorkspace**, and the required *Content Hub* solutions have been installed.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at <https://portal.azure.com>.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select the Microsoft Sentinel **defenderWorkspace**.

1. Select the **Entity behavior** page.

1. On the popup from *Entity behavior settings*, select **Set UEBA**.

1. On the *Settings* tab under *Entity behaviour analytics*, scroll down the *Anomalies* section and verify read through the paragraph, and verify that the *switch* is *On*.

1. Select the **Go to analytics in oder to configure the anomalies** link.

### Task 2: Confirm and review Anomalies rules

In this task, you will confirm Anomalies analytics rules are enabled.

1. You should be now at the *Analytics* page, *Anomalies* tab.

1. Confirm status column of the rules is *Enabled*.

1. Select any rule and then select **Edit** on the rule blade.

1. Review the *General* tab information. Notice the *Mode* is **Production** and then select **Next: Configuration**.

1. Review the *Configuration* tab information. Notice that you cannot change the **Anomaly score threshold**.

1. Then select **X** in the top right corner to exit the Analytics rule wizard.

1. Scroll right to the analytics rule you selected until see and select the ellipsis **(...)** icon.

1. Select **Duplicate** and scroll left to review the new rule with the **FLGT** tab at the beginning of the name.

1. Select **FLGT** rule and then select **Edit** on the rule blade.

1. Review the *General* tab information. Notice the *Mode* is **Flighting** and then select **Next: Configuration**.

1. Review the *Configuration* tab information. Notice that you can now change the **Anomaly score threshold**.

1. Set the value to **1** and then select **Next: Submit Feedback**.

1. Select **Next: Review and Create** and then **Save** to update the rule.

    >**Note:** You can upgrade the **Flighting** rule to **Production** by changing the setting on this rule and save the changes. The **Production** rule will become the **Flighting** rule afterwards.

## Proceed to Exercise 5
