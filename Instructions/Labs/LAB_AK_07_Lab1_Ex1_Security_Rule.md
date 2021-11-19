---
lab:
    title: 'Exercise 1 - Activate a Microsoft Security rule'
    module: 'Module 7 - Create detections and perform investigations using Azure Sentinel'
---

# Module 7 - Lab 1 - Exercise 1 - Activate a Microsoft Security rule

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Azure Sentinel. You must learn how to detect and mitigate threats using Azure Sentinel.  You need to enable alerts from other Microsoft 365 and Azure services.  


### Task 1: Activate a Microsoft Security Rule

In this task, you will activate a Microsoft Security rule.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at (https://portal.azure.com).

3. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace you created in the previous labs.

7. Select **Analytics** from the Configuration area, then select the **Rule templates** tab.

8. In the search box on the Rule templates tab, enter *defender*.

9. In the result set, select **Create incidents based on Microsoft Defender for Endpoint alerts**. 

10. On the right blade, select **Create rule** button.

11. Change *Filter by Severity* to **Custom**.

12. Select **High** for the severity level.

13. Select the **Next : Automated response >** button and then select **Next: Review >** button.

14. Review the changes made and select the **Create** button.  The Analytics rule will be saved.

# Proceed to Exercise 2
