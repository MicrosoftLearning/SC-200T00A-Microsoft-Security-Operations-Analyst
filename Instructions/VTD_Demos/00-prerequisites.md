
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

## Initialize data connectors for Azure Sentinel

### Access the Azure Sentinel Workspace.

In this task, you will access your Azure Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the browser, search for, download, and install the new Microsoft Edge browser. Start the new Edge browser.

3. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select your Azure Sentinel Workspace that you created in the previous lab.

### Connect a non-Azure Windows Machine.

In this task, you will connect a non-Azure Windows virtual machine to Azure Sentinel.

1. Login to WIN2 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the browser, search for, download, and install the new Microsoft Edge browser. Start the new Edge browser.

3. Open a browser and log into the Azure Portal at https://portal.azure.com with your credentials.

4. In the Search bar of the Azure Portal, type *Sentinel*, then select **Azure Sentinel**.

5. Select your Azure Sentinel Workspace.

6. From the Data Connectors tab, select the **Security Events** connector from the list.

7. Select **Open connector page** on the connector information blade.

8. In the Select which events to stream area, select **All Events**, then select **Apply Changes**.

9. Select the **Install agent on a non-Azure Windows Virtual Machine**.

**Note:** The instructions for Install agent on a Windows Virtual Machine and Install agent on a non-Azure Windows Machine may be reversed. The links take you to the proper location even with the reversed text.

10. Select **Download & install agent for non-Azure Windows Virtual machines**. 

11. Select the link for **Download Windows Agent (64 bit)**.

12. Run the .exe file that is downloaded and confirm and User Account Control prompt that may appear.

13. Select **Next** on the Welcome dialog.

14. Select **I Agree** on the Microsoft Software License Terms page.  On the Destination prompt select **Next**.

15. On the Agent Setup Options prompt, select **Connect the agent to Azure Log Analytics (OMS)** option, then select **Next**.

16. In the browser, copy the **Workspace ID** from the Agents Management page and paste into the Workspace ID in the dialog. 

17. In the browser, copy the **Primary key** from the Agents Management page and paste into the Primary key in the dialog. 

18. Select **Next**.

19. Select **Next** on the Microsoft Update page.

20. Then select **Install**.

### Install and collect Sysmon logs.

In this task, you will install and collect Sysmon logs.

You should still be connected to the WIN2 virtual machine.  The following instructions will install Sysmon with the default configuration.  You should research community based configurations for Sysmon to be used on production machines.

1. In the browser, go to https://docs.microsoft.com/sysinternals/downloads/sysmon

2. Download Sysmon from the page by select **Download Sysmon**.

3. Open the downloaded file and extract the files to a new directory c:\sysmon

4. In the Windows Taskbar for WIN2 search box, enter *command*.  The search results will show command prompt app.  Right-click on the command prompt app and select **Run as Administrator**.  Confirm any User Account Control prompts that appear.

5. Enter *cd \sysmon*

6. type *notepad sysmon.xml* to create a new file.

7. Open a tab in the browser and navigate to: https://github.com/SwiftOnSecurity/sysmon-config/blob/master/sysmonconfig-export.xml

8. Copy the contents of that file from Github to the sysmon.xml notepad file you just create and save the file.

9. In the command prompt type the following and press enter:
    sysmon.exe -accepteula -i sysmon.xml

10. In the browser, navigate to the Azure portal at https://portal.azure.com 

11. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

12. In Azure Sentinel, select **Settings** from the Configuration area and then select **Workspace settings** tab.

13. Make sure your Azure Sentinel Workspace is selected.

14. Select **Agents configuration** in Settings.

15. Select the **Windows Event logs** tab.

16. Select **Add windows event log** button.

17. Enter **Microsoft-Windows-Sysmon/Operational** in the Log name field.

18. Select **Apply**.