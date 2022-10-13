---
lab:
    title: 'Exercise 4 - Explore Entity Behavior Analytics'
    module: 'Module 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Module 7 - Lab 1 - Exercise 4 - Explore Entity Behavior Analytics

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules. 


You need to configure Microsoft Sentinel to perform Entity Behavior Analytics to discover anomalies and provide entity analytic pages.


### Task 1: Enable Entity Behavior 

In this task, you will enable Entity behavior analytics in Microsoft Sentinel.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select the **Entity behavior** page.

1. On the popup from *Entity behavior settings*, select **Set UEBA**.

1. On the next page, select  **Set UEBA**.

1. On the *Entity behavior configuration page*, **select the toggle** to *1. Turn on the UEBA feature*.

1. For *2. Sync Microsoft Sentinel with at least one of the following directory services*, select **Azure Active Directory** and then select **Apply**.

1. For *3. Select the existing data sources you want to enable for entity behavior analytics*, select **Audit Logs**, **Azure Activity**, **Security Events**, and **Signin Logs** and then select **Apply**.

1. Close the *Settings* page by click the 'x' at the top right of the page.

1. Return to the *Entity behavior* page often during the labs to see entities populated based on log data ingested and alerts created.


### Task 2: Confirm and review Anomalies rules

In this task, you will confirm Anomalies analytics rules are enabled.

1. Select the **Analytics** page.

1. Select the **Anomalies** tab.

1. Confirm status column of the rules is *Enabled*.

1. Select any rule. Then select **Edit** on the rule blade.

1. Review the *General* tab information. Then select **Next: Configuration**.

1. Review the *Configuration* tab information. Then select **X** in the top right corner to exit the Analytics rule wizard.


## Proceed to Exercise 5
