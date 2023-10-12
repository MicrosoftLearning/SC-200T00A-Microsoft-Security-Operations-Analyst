# Module 6 Create detections and perform investigations with Microsoft Sentinel

**Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md). 

## Attack Detection Windows configured with the Azure Monitor Agent (AMA)

In this task, you will 

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account for admin provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** for admin provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. In `Microsoft Sentinel`, go to the `Threat management` menu section and select **Incidents**

1. You should see an incident that matches the `Severity` and `Title` you configured in the `NRT` rule you created

1. Select the `Incident` and the `detail` pane opens

1. The `Owner` assignment should be **Operator1**, created from the `Automation rule`, and the `Tactics and techniques` should be **Privilege Escalation** (from the `NRT` rule)

1. Select **View full details** to see all the `Incident management` capabilities and `Incident actions`

## You have completed the Demo
