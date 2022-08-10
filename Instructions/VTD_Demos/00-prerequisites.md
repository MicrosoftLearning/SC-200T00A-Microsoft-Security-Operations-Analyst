
# Microsoft Security Operations Analyst
Trainer Preparation Guide

## Purpose 

This document is for presenters preparing to teach the Microsoft Security Virtual Training Day for "Defend against threats and Secure CLoud Environments". This material is a subset of the SC-200: Microsoft Security Operations Analyst certification course.

## Demo prerequisites

The labs for this course require both a Microsoft 365 E5 licensed tenant as well as an Azure subscription.

* You can request Microsoft Learning Azure Passes for yourself.
* Ensure that you request these passes at least two weeks before you will be performing the demos. After receiving the pass, you will need to activate it. 
* The Azure pass effectively functions in the same way as the publicly available Microsoft Azure Trial Subscription. This means there are limitations on what you can do with the pass.
* The lab instructions are in the [SC-200 Microsoft Learning GitHub repository](https://github.com/MicrosoftLearning/SC-200T00A-Microsoft-Security-Operations-Analyst/tree/master/Instructions/VTD_Demos/).
* Ensure that the computer you will be using for the demos has the new Microsoft Edge browser installed.

## Activate Azure Pass

## Deploy Defender for Endpoint

### Obtain Your Microsoft 365 Credentials

Once you launch the lab, a free trial tenant will be made available to you to access in the Microsoft Virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign in to Azure and Microsoft 365 within the Microsoft Virtual Lab environment. 

Because this course can be offered by learning partners using any one of several authorized lab hosting providers, the actual steps involved to retrieve the tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions on how to retrieve this information for your course. The information that you should note for later use includes:

	- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign in to Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign in to Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
	- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	

### Initialize Microsoft Defender for Endpoint.

In this task, you will perform the initialization of the Microsoft Defender for Endpoint.


1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser, search for "edge browser update", download, and install the new Microsoft Edge browser. This is necessary to ensure you're running the latest version of Microsoft Edge in your hosted virtual machine. Start the new Edge browser.

1. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

1. In the **Sign in** dialog box, copy and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

**Note**: if you receive a message "You can't access this section.",  wait 5 minutes and try again.  Sometimes the access rules need to propagate the tenant.

1. In the Microsoft 365 Defender portal, in the menus section on the left, scroll down to Settings.

1. In Settings select Endpoints.

1. You will be in the General section Data retention selection.

**Note**: In the hosted lab environment your data storage location should be selected for you. And, it should be in the appropriate Geography for where this training tenant is being managed. You can still select the Data Retention length, but it is not required.

1. Under Endpoints, General, select Advanced features.

1. Scroll down through the list of features and confirm the Preview features are **On**.

1. If not, move the slider to the **On** position and select **Save preferences**.  

**Note**: The setup is **Complete**.  You will onboard Devices in the next task.  

### Onboard a Device.

In this task, you will onboard a device to Microsoft Defender for Endpoint.

1. Go to the Microsoft 365 Defender portal at (https://security.microsoft.com) and login with the **Tenant Email** credentials if you are not currently in the portal.

1. Select **Settings** from the left menu bar.

1. Select **Endpoints**, and then select **Onboarding** in the Device management section.

1. In the Onboard a device area select **Download Package** button.

1. Extract the downloaded zip file to a local folder like the Documents folder.

1. Right-click on the extracted file WindowsDefenderATPLocalOnboardingScript.cmd and choose **Run as Administrator**.  If you encounter the Windows SmartScreen choose to Run anyway.

**Note** By default, the file should be in the c:\users\admin\downloads directory.
    
1. Answer **Y** to questions presented by the script. When complete you should see a message in the command screen that says something like "Successfully onboarded machine..." 

1. From the Onboarding page in the portal, copy the detection test script and run it in an open command window.  You may have to open a new **Administrator: Command Prompt** window by typing *CMD* in the windows search bar and choose to **run as Administrator**.

1. In the Microsoft 365 Defender portal menu, select **Device inventory**. You should now see your device in the list.

**Note** It can take up to 5 minutes for the device to be displayed in the portal.


### Configure Role

In this task, you will configure roles for use with device groups.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar. 

1. Select **Endpoints**, and then select **Roles** in the permissions area.

1. Select the **Turn on roles** button.

1. Select **Add item**.

1. In the Add Role dialog enter the following:

    |General setting|Value|
    |---|---|
    |Role name|**Tier 1 Support**|
    |Permissions|Live Response capabilities - Advanced|

1. Select **Next**.

1. In the Assigned user groups tab. Select **sg-IT** and then select **Add selected groups**.

1. Select **Save**.

### Configure Device Groups

In this task, you will configure device groups that allow for access control and automation configuration.

1. Select **Settings** from the left menu bar. 

1. Select **Endpoints**, and in the permissions area select **Device groups**.

1. Select **Add device group**.

1. Enter the following information on the General tab:

    |General setting|Value|
    |---|---|
    |Device group name|**Regular**|
    |Automation level|Full - remediate threats automatically|

1. Select **Next**.

1. . On the Devices tab, for the OS condition select **Windows 10** and select **Next**.

1. On the Preview devices tab, select **Show preview** to see the WIN1 virtual machine. Select **Next**. 
**Hint:** If you do not see the virtual machine in the preview list, go back and select also *None* for the OS condition. The data for the VM is not populated yet.

1. For the User access tab, select **sg-IT** and then select **Add selected groups**

1. Select **Done**.

1. Device group configuration has changed. Select **Apply changes** to check matches and recalculate groupings.

1. You are going to have two device groups now; the "Regular" you just created and the "Ungrouped devices (default)" with the same reMediation level.


## Deploy sample alerts for Demo in Module 3

In this task, you will load sample security alerts and review the alert details.

1. In the Edge browser, open the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Defender*, then select **Microsoft Defender for Cloud**.

1. In the **Getting Started** menu the default selection is **Upgrade**, select or **Skip** for now.

1. Select **Security alerts** in the portal menu.

1. Select **Sample Alerts** from the command bar.

1. In the Create sample alerts (Preview) pane make sure your subscription is selected.  Make sure all sample alerts are selected and select **Create sample alerts**.  

**Note** This may take a few minutes to complete.

## Deploy Microsoft Sentinel Workspace for Demo in Module 4

In this task, you will create an Microsoft Sentinel workspace.

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select **+ Create**.

1. Next, select **+ Create a new workspace**.

**Note** First, you create a new Log Analytics Workspace.

1. Select your proper Subscription.

1. Select the **Create New** link for the Resource Group and enter a new resource group name of your choosing.

1. Under Instance details in the name field enter a name for your choosing for the Log Analytics Workspace.

**Note:** This name should be unique and will also be the Microsoft Sentinel workspace name.

1. Select the region that is appropriate for you.  The appropriate region may default or your instructor may have specific advice on which region to select.  

1. Select **Review + Create**.

1. Select **Create**. Wait for the new Log Analytics workspace to appear in the list on the Add Microsoft Sentinel to a workspace page.  This may take a minute.

1. Select the newly created workspace when it appears, then select **Add**.

## Create data connectors for Microsoft Sentinel

### Task 1: Access the Microsoft Sentinel Workspace.

In this task, you will access your Microsoft Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the browser, search for, download, and install the new Microsoft Edge browser. Start the new Edge browser.

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace that you created in the previous lab.

### Task 2: Connect the Azure Active Directory connector.

In this task, you will connect the Azure Active Directory connector.

1. In the Configuration area select **Data connectors**.  In the Data Connectors page, select the **Azure Active Directory** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Select the **Sign-in Logs** and **Audit Logs** options from the Configuration area, then select **Apply Changes**.

### Task 3: Connect the Azure Active Directory Identity Protection connector.

In this task, you will connect the Azure Active Directory Identity Protection connector.

1. From the Data Connectors Tab, select the **Azure Active Directory Identity Protection** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Select the **Connect** button.

### Task 4: Connect the Microsoft Defender for Cloud connector.

In this task, you will connect the Microsoft Defender for Cloud connector.

1. From the Data Connectors tab, select the **Microsoft Defender for Cloud** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Review the Connecting Options. Don't connect. This is for informational purposes only.

### Task 5: Connect the Microsoft Defender for Cloud Apps connector.

In this task, you will connect theMicrosoft Defender for Cloud Apps connector.

1. From the Data Connectors Tab, select the **Microsoft Defender for Cloud Apps** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. In the **Instructions** tab in the **Configuration** section, select **Alerts** and then select **Apply Changes**.

### Task 6: Connect the Microsoft Defender for Office 365 connector.

In this task, you will connect the Microsoft Defender for Office 365 connector.

1. From the Data Connectors tab, select the **Microsoft Defender for Office 365** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Select **Connect**.

### Task 7: Connect the Microsoft Defender for Identity connector.

In this task, you will connect the Microsoft Defender for Identity connector.

1. From the Data Connectors Tab, select the **Microsoft Defender for Identity** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Review the Connecting Options. Don't connect. This is for informational purposes only.

### Task 8: Connect the Microsoft Defender for Endpoint connector.

In this task, you will connect the Microsoft Defender for Endpoint connector.

1. From the Data Connectors Tab, select the **Microsoft Defender for Endpoint** connector from the list.

1. Select Open connector page on the connector information blade.

1. Select **Connect**.

### Task 9: Connect the Microsoft 365 Defender connector.

In this task, you will connect the Microsoft 365 Defender connector.

1. From the Data Connectors Tab, select the **Microsoft 365 Defender** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. Select all the checkboxes for Microsoft Defender for Endpoint.

1. Select **Apply Changes**.

### Task 3: Connect a non-Azure Windows Machine.

In this task, you will connect a non-Azure Windows virtual machine to Microsoft Sentinel.

1. Login to WIN2 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the browser, search for, download, and install the new Microsoft Edge browser. Start the new Edge browser.

1. Open a browser and log into the Azure Portal at https://portal.azure.com with your credentials.

1. In the Search bar of the Azure Portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. From the Data Connectors tab, select the **Security Events via Legacy Agent** connector from the list.

1. Select **Open connector page** on the connector information blade.

1. In the Select which events to stream area, select **All Events**, then select **Apply Changes**.

1. Select the **Install agent on a non-Azure Windows  Machine**.

**Note:** The instructions for Install agent on a Windows Virtual Machine and Install agent on a non-Azure Windows Machine may be reversed. The links take you to the proper location even with the reversed text.

1. Select **Download & install agent for non-Azure Windows machines**. 

1. Select the link for **Download Windows Agent (64 bit)**.

1. Run the .exe file that is downloaded and confirm and User Account Control prompt that may appear.

1. Select **Next** on the Welcome dialog.

1. Select **I Agree** on the Microsoft Software License Terms page.  On the Destination prompt select **Next**.

1. On the Agent Setup Options prompt, select **Connect the agent to Azure Log Analytics (OMS)** option, then select **Next**.

1. In the browser, copy the **Workspace ID** from the Agents Management page and paste into the Workspace ID in the dialog. 

1. In the browser, copy the **Primary key** from the Agents Management page and paste into the Primary key in the dialog. 

1. Select **Next**.

1. Select **Next** on the Microsoft Update page.

2. Then select **Install**.

### Task 4: Install and collect Sysmon logs.

In this task, you will install and collect Sysmon logs.

You should still be connected to the WIN2 virtual machine.  The following instructions will install Sysmon with the default configuration.  You should research community based configurations for Sysmon to be used on production machines.

1. In the browser, go to https://docs.microsoft.com/sysinternals/downloads/sysmon

1. Download Sysmon from the page by select **Download Sysmon**.

1. Open the downloaded file and extract the files to a new directory c:\sysmon

1. In the Windows Taskbar for WIN2 search box, enter *command*.  The search results will show command prompt app.  Right-click on the command prompt app and select **Run as Administrator**.  Confirm any User Account Control prompts that appear.

1. Enter *cd \sysmon*

1. type *notepad sysmon.xml* to create a new file.

1. Open a tab in the browser and navigate to: https://github.com/SwiftOnSecurity/sysmon-config/blob/master/sysmonconfig-export.xml

1. Copy the contents of that file from Github to the sysmon.xml notepad file you just created and save the file.

1. In the command prompt type the following and press enter:
    sysmon.exe -accepteula -i sysmon.xml

1. In the browser, navigate to the Azure portal at https://portal.azure.com 

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. In Microsoft Sentinel, select **Settings** from the Configuration area and then select **Workspace settings** tab.

1. Make sure your Microsoft Sentinel Workspace is selected.

1. Select **Agents configuration** in Settings.

1. Select the **Windows Event logs** tab.

1. Select **Add windows event log** button.

1. Enter **Microsoft-Windows-Sysmon/Operational** in the Log name field.

1. Select **Apply**.

## Conduct attacks

### Task 1: Attack Windows configured with Defender for Endpoint.

In this task, you will perform attacks on a host with Microsoft Defender for Endpoint configured.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the search of the task bar, enter *Command*.  Command Prompt will be displayed in the search results.  Right-click on the Command Prompt and select **Run as Administrator**. Confirm any User Account Control prompts that appear.

1. In the command prompt, enter the command in each row pressing Enter key after each row:
```
cd \
mkdir temp
cd temp
```
1. Attack 1 - Copy and run this command:

```
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

1. Attack 2 - Copy and run this command:

```
notepad c2.ps1
```
Select **Yes** to create a new file and copy the following PowerShell script into c2.ps1 and select **save**.

**Note** Paste into the Virtual Machine might have a limited length.  Paste this in three sections to ensure all the script is pasted into the Virtual Machine.  Make sure the script looks as it does in these instructions within the notepad c2.ps1 file.

```


param(
    [string]$Domain = "microsoft.com",
    [string]$Subdomain = "subdomain",
    [string]$Sub2domain = "sub2domain",
    [string]$Sub3domain = "sub3domain",
    [string]$QueryType = "TXT",
        [int]$C2Interval = 8,
        [int]$C2Jitter = 20,
        [int]$RunTime = 240
)


$RunStart = Get-Date
$RunEnd = $RunStart.addminutes($RunTime)

$x2 = 1
$x3 = 1 
Do {
    $TimeNow = Get-Date
    Resolve-DnsName -type $QueryType $Subdomain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout

    if ($x2 -eq 3 )
    {
        Resolve-DnsName -type $QueryType $Sub2domain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout
        
        $x2 = 1

    }
    else
    {
        $x2 = $x2 + 1
    }
    
    if ($x3 -eq 7 )
    {

        Resolve-DnsName -type $QueryType $Sub3domain".$(Get-Random -Minimum 1 -Maximum 999999)."$Domain -QuickTimeout

        $x3 = 1
        
    }
    else
    {
        $x3 = $x3 + 1
    }


    $Jitter = ((Get-Random -Minimum -$C2Jitter -Maximum $C2Jitter) / 100 + 1) +$C2Interval
    Start-Sleep -Seconds $Jitter
}
Until ($TimeNow -ge $RunEnd)

```

At the command prompt, enter the following, enter the command in each row pressing Enter key after each row:
```
powershell
.\c2.ps1
```
**Note:** You will see resolve errors. This is to be expected.
Let this command/powershell script run in the background. Don't close the window.  The command needs to generate log entries for some hours.  You can proceed to the next task and next exercises while this script runs.  The data created by this task will be used in the Threat Hunting lab later.  This process will not create substantial amounts of data or processing.

### Task 2: Attack Windows configured with Sysmon

In this task, you will perform attacks on a host with the Security Events connector configured and Sysmon configured.

1. Login to WIN2 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the search of the task bar, enter *CMD*.  Command Prompt will be displayed in the search results.  Right-click on the Command Prompt and select **Run as Administrator**.

1. In the command prompt, enter the command in each row pressing Enter key after each row:
```
cd \
mkdir temp
cd \temp
```

1. Attack 1 - Copy and run this command:

```
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

1. Attack 2 - Copy and run this command, enter the command in each row pressing Enter key after each row:

```
net user theusernametoadd /add
net user theusernametoadd ThePassword1!
net localgroup administrators theusernametoadd /add
```