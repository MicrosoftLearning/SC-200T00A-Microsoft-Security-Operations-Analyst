---
lab:
    title: 'Exercise 4 - Explore Entity Behavior Analytics'
    module: 'Learning Path 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 7 - Lab 1 - Exercise 4 - Explore Entity Behavior Analytics

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules. 


You need to configure Microsoft Sentinel to perform Entity Behavior Analytics to discover anomalies and provide entity analytic pages.

>**Note:** An **[interactive lab simulation](https://mslabs.cloudguides.com/guides/SC-200%20Lab%20Simulation%20-%20Explore%20entity%20behavior%20analytics)** is available that allows you to click through this lab at your own pace. You may find slight differences between the interactive simulation and the hosted lab, but the core concepts and ideas being demonstrated are the same. 

### Task 1: Explore Entity Behavior 

In this task, you will explore Entity behavior analytics in Microsoft Sentinel.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

6. Select your Microsoft Sentinel Workspace you created earlier.

7. Select the **Entity behavior** page.

8. On the popup from *Entity behavior settings*, select **Set UEBA**.

9. On the next page, select  **Set UEBA**.

10. Review the three pre-requisite steps to enable entity behavior analytics.

11. Close the *Entity behavior configuration* page by selecting the 'x' at the top right of the page.

12. Scroll down the *Settings* page and read through the *Anomalies* paragraph.

13. Select **Go to analytics in oder to configure the anomalies**.


### Task 2: Confirm and review Anomalies rules

In this task, you will confirm Anomalies analytics rules are enabled.

1. You should be now at the *Analytics* page, *Anomalies* tab.

2. Confirm status column of the rules is *Enabled*.

3. Select any rule and then select **Edit** on the rule blade.

4. Review the *General* tab information. Notice the *Mode* is **Production** and then select **Next: Configuration**.

5. Review the *Configuration* tab information. Notice that you cannot change the **Anomaly score threshold**.

6. Then select **X** in the top right corner to exit the Analytics rule wizard.

7. Scroll right to the analytics rule you selected until see and select the ellipsis **(...)** icon.

8. Select **Duplicate** and scroll left to review the new rule with the **FLGT** tab at the beginning of the name.

9. Select **FLGT** rule and then select **Edit** on the rule blade.

10. Review the *General* tab information. Notice the *Mode* is **Flighting** and then select **Next: Configuration**.

11. Review the *Configuration* tab information. Notice that you can now change the **Anomaly score threshold**.

12. Set the value to **1** and then select **Next: Submit Feedback**.

13. Select **Next: Review** and then **Save** to update the rule.

    >**Note:** You can upgrade the **Flighting** rule to **Production** by changing the setting on this rule and save the changes. The **Production** rule will become the **Flighting** rule afterwards.
    

## Proceed to Exercise 5
