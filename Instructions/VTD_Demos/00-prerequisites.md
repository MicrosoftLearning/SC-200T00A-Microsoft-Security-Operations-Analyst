
# Microsoft Security Operations Analyst
Trainer Preparation Guide

## Purpose 

This document is for presenters preparing to teach the Microsoft Security Virtual Training Day for "Modernize Security and Defend Against Threats". This material is a subset of the SC-200: Microsoft Security Operations Analyst certification course.

## Demo prerequisites

The labs for this course require both a Microsoft 365 E5 licensed tenant as well as an Azure subscription.
* You can request Microsoft Learning Azure Passes for yourself and your students. 
* Ensure that you request these passes at least two weeks before the class  starts. After receiving the passes each student will need to activate their pass. 
* The Azure pass effectively functions in the same way as the publicly available Microsoft Azure Trial Subscription. This means there are limitations on what you can do with the pass.
* The lab instructions are in the [SC-200 Microsoft Learning GitHub repository](https://github.com/MicrosoftLearning/SC-200T00A-Microsoft-Security-Operations-Analyst/tree/master/Instructions/VTD_Demos/).
* Ensure that the computer you will be using for the demos has the new Microsoft Edge browser installed.

## Deploy sample alerts for Demo in Module 2

In this task, you will load sample security alerts and review the alert details.

2. In the Edge browser, open the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Security*, then select **Security Center**.

1. If prompted to Upgrade security center, click **Skip** at the bottom.

6. Select **Security alerts** in the portal menu.

7. Select **Sample Alerts** from the command bar.

8. In the Create sample alerts (Preview) pane make sure your subscription is selected.  Make sure all sample alerts are selected and select **Create sample alerts**.  

**Note** This may take a few minutes to complete.

## Deploy Azure Sentinel Workspace for Demo in Module 4

In this task, you will create an Azure Sentinel workspace.

3.  In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select **+ Create**.

8. Next, select **+ Create a new workspace**.

**Note** First, you create a new Log Analytics Workspace.

9. Select your proper Subscription.

10. Select the **Create New** link for the Resource Group and enter a new resource group name of your choosing.

11. Under Instance details in the name field enter a name for your choosing for the Log Analytics Workspace.

**Note:** This name will also be the Azure Sentinel workspace name.

12. Select the region that is appropriate for you.  The appropriate region may default or your instructor may have specific advice on which region to select.  

13. Select **Review + Create**.

14. Select **Create**. Wait for the new Log Analytics workspace to appear in the list on the Add Azure Sentinel to a workspace page.  This may take a minute.

16. Select the newly created workspace when it appears, then select **Add**.

