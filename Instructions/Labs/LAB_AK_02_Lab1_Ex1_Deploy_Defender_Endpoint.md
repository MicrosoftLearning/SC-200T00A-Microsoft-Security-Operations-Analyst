---
lab:
    title: 'Exercise 1 - Deploy Microsoft Defender for Endpoint'
    module: 'Module 2 - Mitigate threats using Microsoft Defender for Endpoint'
---

# Module 2 - Lab 1 - Exercise 1 - Deploy Microsoft Defender for Endpoint

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.

You start by initializing the Defender for Endpoint environment. Next, you onboard the initial devices for your deployment by running the onboarding script on the devices. You configure security for the environment. Lastly, you create Device groups and assign the appropriate devices.

>**Important:**  The lab Virtual Machines are used through different modules. SAVE your virtual machines. If you exit the lab without saving, you will be required to re-run some configurations again.

>**Note:** Make sure you have completed successfully the last 3 steps of the previous module.


### Task 1: Initialize Microsoft Defender for Endpoint

In this task, you will perform the initialization of the Microsoft Defender for Endpoint portal.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. If you are not already at the Microsoft 365 Defender portal, start the Microsoft Edge browser.

1. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

1. On the **Microsoft 365 Defender** portal, from the navigation menu, select **Settings** from the left.

1. On the **Settings** page select **Device discovery**. 

    >**Note:** If you do not see the **Device discovery** option under **Settings**, logout by selecting the top-right circle with your account initials and select **Sign out**. Other options that you might want to try is to refresh the page with Ctrl+F5 or open the page InPrivate. Login again with the **Tenant Email** credentials.

1. In Discovery setup make sure **Standard discovery (recommended)** is selected. **Hint:** If you do not see the option, refresh the page.


### Task 2: Onboard a Device.

In this task, you will onboard a device to Microsoft Defender for Endpoint using an onboarding script.

1. If you are not already at the Microsoft 365 Defender portal in your browser, start the Microsoft Edge browser and go to (https://security.microsoft.com) and login with the **Tenant Email** credentials.

1. Select **Settings** from the left menu bar, then from the Settings page select **Endpoints**.

1. Select **Onboarding** in the Device management section.

1. In the "1. Onboard a device" area make sure "Local Script (for up to 10 devices)" is displayed in the Deployment method drop-down and select the **Download onboarding package** button. Highlight the "WindowsDefenderATPOnboardingPackage.zip" file with your mouse and select the folder icon **Show in folder**. **Hint:** By default, the file should be in the c:\users\admin\downloads directory.

1. Right-click the downloaded zip file and select **Extract All...**, make sure that *Show extracted files when complete* is checked and select **Extract**.

1. Right-click on the extracted file "WindowsDefenderATPLocalOnboardingScript.cmd" and select **Properties**. Select the **Unblock** checkbox in the bottom right of the Properties windows and select **OK**.

1. Right-click on the extracted file "WindowsDefenderATPLocalOnboardingScript.cmd" again and choose **Run as Administrator**.  **Hint:** If you encounter the Windows SmartScreen window, select on **More info**, and choose **Run anyway**. 
    
1. When the "User Account Control" window is shown, select **Yes** to allow the script to run and answer **Y** to the question presented by the script and press **Enter**. When complete you should see a message in the command screen that says "Successfully onboarded machine to Microsoft Defender for Endpoint.

1. Press any key to continue. This will close the Command Prompt window.

1. Back in the Onboarding page from the Microsoft 365 Defender portal, under the section "2. Run a detection test", copy the detection test script by selecting the **Copy** button.  

1. In the windows search bar of the WIN1 virtual machine, type **CMD** and choose to **Run as Administrator** on the right pane for the Command Prompt app. 

1. When the "User Account Control" window is shown, select **Yes** to allow the app to run. 

1. Paste the script by right-clicking in the **Administrator: Command Prompt** windows and press **Enter** to run it. **Note:** The window closes automatically after running the script.

1. In the Microsoft 365 Defender portal, in the left-hand menu, under the Endpoints area, select **Device inventory**. You should now see your device in the list.

    >**Note:** It can take up to 5 minutes for the device to be displayed in the portal. If the device is not shown, complete the next task and come back to check it back later.


### Task 3: Configure Roles

In this task, you will configure roles for use with device groups.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

1. Select **Roles** under the permissions area.

1. Select the **Turn on roles** button.

1. Select **+ Add item**.

1. In the Add role dialog enter the following:

    |General setting|Value|
    |---|---|
    |Role name|**Tier 1 Support**|
    |Permissions|Live Response capabilities - Advanced|

1. Select the **Assigned user groups** tab on the top. Select **sg-IT** and then select **Add selected groups**. Make sure it appears under *Azure AD user groups with this role*.

1. Select **Save**.


### Task 4: Configure Device Groups

In this task, you will configure device groups that allow for access control and automation configuration.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

1. Select **Device groups** under the permissions area.

1. Select **+ Add device group** icon.

1. Enter the following information on the General tab:

    |General setting|Value|
    |---|---|
    |Device group name|**Regular**|
    |Automation level|Full - remediate threats automatically|

1. Select **Next**.

1. On the Devices tab, for the OS condition select **Windows 10** and select **Next**.

1. On the Preview devices tab, select **Show preview** to see the WIN1 virtual machine.  Select **Next**.

1. For the User access tab, select **sg-IT** and then select **Add selected groups** button. Make sure it appears under *Azure AD user groups with access to this device group*.

1. Select **Done**.

1. Device group configuration has changed. Select **Apply changes** to check matches and recalculate groupings.

1. You are going to have two device groups now; the "Regular" you just created and the "Ungrouped devices (default)" with the same remediation level.

## Proceed to Exercise 2
