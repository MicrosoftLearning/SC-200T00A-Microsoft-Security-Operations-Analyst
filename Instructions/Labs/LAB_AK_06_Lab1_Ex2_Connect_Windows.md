---
lab:
    title: 'Exercise 2 - Connect Windows devices to Microsoft Sentinel using data connectors'
    module: 'Module 6 - Connect logs to Microsoft Sentinel'
---

# Module 6 - Lab 1 - Exercise 2 - Connect Windows devices to Microsoft Sentinel using data connectors

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to connect log data from the many data sources in your organization. The next source of data are Windows virtual machines inside and outside of Azure, like On-Premises environments or other Public Clouds.


### Task 1: Create a Windows Virtual Machine in Azure

In this task, you will create a Windows virtual machine in Azure.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. Select **+ Create a Resource**. **Hint:** If you were already in the Azure Portal, you might need to select *Microsoft Azure* from the top bar to go Home.

1. In the **Search services and marketplace** box, enter *Windows 10* and select **Microsoft Window 10** from the drop-down list.

1. Open the *Plan* drop-down list and select **Windows 10 Enterprise, version 21H2**. Select **Start with a pre-set configuration** to continue.

1. Select **Dev/Test** and then select **Continue to create a VM**.

1. Select **Create new** for *Resource group*, enter RG-AZWIN01 as Name and select **OK**.

    >**Note:** This will be a new resource group for tracking purposes. 

1. In *Virtual machine name*, enter AZWIN01.

1. Leave **(US) East US** as the default value for *Region*.

1. Scroll down and review the *Size* for the virtual machine. If it appears empty, select **See all sizes**, choose one of the VM sizes under *Most used by Azure users* and click **Select**.

1. Enter a *Username* of your choosing. **Hint:** Avoid reserved words like admin or root.

1. Enter a *Password* of your choosing. **Hint:** It might be easier to re-use your tenant password. It can be found in the resources tab.

1. Scroll down to the bottom of the page and select the checkbox below *Licensing* to confirm you have the eligible license.

1. Select **Review + create** and wait until the validation is passed.

1. Select **Create**. Wait for the Resource to be created, this may take a few minutes.


### Task 2: Connect an Azure Windows virtual machine

In this task, you will connect an Azure Windows virtual machine to Microsoft Sentinel.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. From the Data Connectors Tab, search for the **Security Events via Legacy Agent** connector and select it from the list.

1. Select **Open connector page** on the connector information blade.

1. In the *Configuration* section, under "1. Download and install the agent", select the **Install agent on Azure Windows Virtual Machine** option.

1. Select **Download & install agent for Azure Windows Virtual machines**. This will show the available Virtual Machines in your Azure subscription.

1. Select the **AZWIN01** virtual machine that you just created in the previous task, and then select **Connect**. Wait until the "Status" shows *This workspace*.

1. Close the window by selecting the 'x'. In the *Configuration* section, under "2. Select which events to stream", select **All Events**, then select **Apply Changes**.


### Task 3: Connect a non-Azure Windows Machine

In this task, you will connect a non-Azure Windows virtual machine to Microsoft Sentinel.

>**Important:** The next steps are done in a different machine than the one you were previously working. Look for the Virtual Machine name references.

1. Login to WIN2 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser.

1. Open a browser and log into the Azure Portal at https://portal.azure.com with the credentials you have been using in the previous labs.

1. In the Search bar of the Azure Portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select **Data connectors** then search for the **Security Events via Legacy Agent** connector and select it from the list.

1. Select **Open connector page** on the connector information blade.

1. In the *Configuration* section, under "1. Download and install the agent", now select the **Install agent on a non-Azure Windows Machine** option.

1. Select **Download & install agent for non-Azure Windows machines**. 

    >**Note:** Your Log Analytics workspace should show *2 Windows computers connected*. This corresponds to WINServer and AZWIN01 virtual machines connected earlier.

1. Select the link for **Download Windows Agent (64 bit)**.

1. Select **Open file** under the *MMASetup-AMD64.exe* file that was downloaded and select **Yes** to allow the executable to run in the User Account Control window that appears.

1. Select **Next** on the welcome dialog, select **I Agree** to the "Microsoft Software License Terms" page and **Next** on the Destination prompt to accept the default path.

1. On the Agent Setup Options prompt, select **Connect the agent to Azure Log Analytics (OMS)** option, then select **Next**.

1. In the browser with Microsoft Sentinel open, copy the **Workspace ID** from the Agents Management page and paste into the Workspace ID in the dialog. 

1. In the browser with Microsoft Sentinel open, copy the **Primary key** from the Agents Management page and paste into the Workspace key in the dialog. 

1. Select **Next** to save the configuration.

1. Select **Next** on the Microsoft Update page.

1. Then select **Install**. Wait for the Microsoft Monitoring Agent setup to finish.

1. When complete, select **Finish**.


### Task 4: Install and collect Sysmon logs

In this task, you will install and collect Sysmon logs.

>**Note:** The following instructions will install Sysmon with the default configuration. You should research community-based configurations for Sysmon to be used on production machines.

1. Open a new tab in the browser, go to https://docs.microsoft.com/sysinternals/downloads/sysmon

1. Download Sysmon from the page by selecting **Download Sysmon**.

1. Hover the *Sysmon.zip* and select the folder icon. Right-click the downloaded file and select **Extract All...** enter *C:\Sysmon* under **Files will be extracted to this folder** and select **Extract**. 

1. In the Windows Taskbar for WIN2 search box, enter *command*. The search results will show Command Prompt app. Right-click on the Command Prompt app and select **Run as Administrator**. Select **Yes** to allow the app to run in the User Account Control window that appears.

1. Type *cd \sysmon*

1. Type *notepad sysmon.xml* to create a new file. Select **Yes** to confirm the file creation.

1. Open a new tab in the browser, go to: https://github.com/SwiftOnSecurity/sysmon-config/blob/master/sysmonconfig-export.xml

1. Select the **Raw** button. Select all and copy the contents of that file from GitHub and paste it back in the sysmon.xml notepad file you just created.

1. In Notepad, select **File** and then select **Save** to save the file.

1. Back in the Command Prompt type the following and press enter: **sysmon.exe -accepteula -i sysmon.xml**

    >**Important:** Verify that "Configuration file validated" and "Sysmon started" messages appear in the output. If that is not the case, verify that the data is properly copied and that the sysmon.xml file has been saved.

1. In the browser, navigate back to the tab with the Azure portal open at https://portal.azure.com 

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel** and select your Microsoft Sentinel Workspace you created earlier.

1. In Microsoft Sentinel, select **Settings** from the Configuration area and then select **Workspace settings >** tab.

1. Select **Agents configuration** from the Settings area. The **Windows Event logs** tab should be select by default.

1. Select **+ Add windows event log** button.

1. Type **Microsoft-Windows-Sysmon/Operational** in the Log name field.

1. Select **Apply**. With this, we are going to collect all events generated by Sysmon from the Event Viewer.


### Task 5: Onboard Microsoft Defender for Endpoint Device

In this task, you will on-board a device to Microsoft Defender for Endpoint.

>**VERY IMPORTANT:** If you completed the labs for "Module 2 - Exercise 1" of this course AND have been saving your Virtual Machines until now, you can skip this task. Otherwise, you need to onboard again the WIN1 machine to Defender for Endpoint.

>**Important:** The next steps are done in a different machine than the one you were previously working. Look for the Virtual Machine name references.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com) and login with the **Tenant Email** credentials if you are not currently in the portal.

1. Select **Settings** from the left menu bar, then from the Settings page select **Endpoints**.

1. Select **Onboarding** in the Device management section.

1. Select **Download onboarding package**.

1. Extract the downloaded .zip file.

1. Run the Windows Command Prompt as **Administrator** and agree to any User Account Control prompts that appear.

1. Run the WindowsDefenderATPLocalOnboardingScript.cmd file that you just extracted as administrator. **Note:** By default the file should be in the c:\users\admin\downloads directory. Answer Y to questions presented by the script. 

1. From the Onboarding page in the portal, copy the detection test script and run it in an open command window. You may have to open a new **Administrator: Command Prompt** window by typing *CMD* in the windows search bar and choose to **Run as Administrator**.

1. In the Microsoft 365 Defender portal in the Endpoints area, select **Device inventory**. You should now see your device in the list.

## Proceed to Exercise 3
