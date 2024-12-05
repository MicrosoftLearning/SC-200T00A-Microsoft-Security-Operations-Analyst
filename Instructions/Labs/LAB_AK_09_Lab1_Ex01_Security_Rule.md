---
lab:
    title: 'Exercise 1 - Modify a Microsoft Security rule'
    module: 'Learning Path 9 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 9 - Lab 1 - Exercise 1 - Modify a Microsoft Security rule

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod7_L1_Ex1.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to detect and mitigate threats using Microsoft Sentinel. First, you need to filter the alerts coming from Defender for Cloud into Microsoft Sentinel, by Severity.

### Estimated time to complete this lab: 10 minutes

### Task 1: Activate a Microsoft Security Rule

In this task, you will activate a Microsoft Security rule.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Microsoft Edge browser, navigate to the Azure portal at (<https://portal.azure.com>).

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created in the previous labs.

1. Select **Analytics** from the Configuration area.

1. Select the **+ Create** button from the command bar and select **Microsoft incident creation rule**.

1. Under *Name*, enter **Create incidents based on Defender for Cloud**.

1. Scroll down and under *Microsoft security service* select **Microsoft Defender for Cloud**.

1. Under *Filter by Severity*, select the *Custom* option and select **Low**, **Medium** and **High** for the severity level and go back to the rule.

1. Select the **Next: Automated response** button and then select the **Next: Review and create** button.

1. Review the changes made and select the **Save** button. The Analytics rule will be saved and incidents will be created if there is an Alert in Defender for Cloud.

1. You will now have the one *Fusion* and one *Microsoft Security* alert types.

## Proceed to Exercise 2
