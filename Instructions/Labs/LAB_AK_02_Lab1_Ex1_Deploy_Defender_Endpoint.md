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


### Task 1: Initialize Microsoft Defender for Endpoint.

In this task, you will perform the initialization of the Microsoft Defender for Endpoint portal.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. If you are not already at the Microsoft 365 Defender portal, start the Microsoft Edge browser.

3. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

4. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

6. On the **Microsoft 365 Defender** portal, from the navigation menu, select **Settings** from the left.

7. On the **Settings** page select **Microsoft 365 Defender**.  Select **Preview features** and make sure preview features are turned on. Return to the **Settings** menu.

8. On the **Settings** page select **Device discovery**.  In Discovery setup make sure **Standard discovery** is selected.  Return to the **Settings** menu. **Note**: If you don't see the **Device discovery** option under **Settings**, logout by selecting the top-right circle with your account initials and select **Sign out**. Login again with the **Tenant Email** credentials.

>**Note:** The Defender for Endpoint setup should be performed automatically by your Microsoft 365 E5 tenant.  You can view the other settings if you like.  You will onboard Devices in the next task.  


### Task 2: Onboard a Device.

In this task, you will onboard a device to Microsoft Defender for Endpoint using an onboarding script.

1. If you are not already at the Microsoft 365 Defender portal in your browser, start the Microsoft Edge browser and go to (https://security.microsoft.com) and login with the **Tenant Email** credentials.

2. Select **Settings** from the left menu bar, then from the Settings page select **Endpoints**.

3. Select **Onboarding** in the Device management section.

4. In the "1. Onboard a device" area make sure "Local Script (for up to 10 devices)" is displayed in the Deployment method drop-down and select the **Download onboarding package** button. Highlight the "WindowsDefenderATPOnboardingPackage.zip" file with your mouse and select the folder icon **Show in folder**.

5. Right-click the downloaded zip file and select **Extract All...**, make sure that *Show extracted files when complete* is checked and select **Extract**.

6. Right-click on the extracted file "WindowsDefenderATPLocalOnboardingScript.cmd" and choose **Run as Administrator**.  If you encounter the Windows SmartScreen, select on **More info** and choose **Run anyway**. **Hint:** By default, the file should be in the c:\users\admin\downloads directory.
    
7. When the "User Account Control" windows is shown, select **Yes** to allow the script to run and answer **Y** to questions presented by the script and press **Enter**. When complete you should see a message in the command screen that says something like "Successfully onboarded machine to Microsoft Defender for Endpoint". Press any key to close the window.

8. From the Onboarding page in the portal under the "2. Run a detection test" area, copy the detection test script by selecting the **Copy** button.  In the windows search bar type **CMD** and choose to **Run as Administrator** on the right pane. When the "User Account Control" windows is shown, select **Yes** to allow the app to run. Paste the script by right-clicking in the **Administrator: Command Prompt** windows and press **Enter** to run it. The window closes automatically after running the script.

9. In the Microsoft 365 Defender portal in the Endpoints area, select **Device inventory**. You should now see your device in the list.

>**Note:** It can take up to 5 minutes for the device to be displayed in the portal. If the device is not shown, complete the next task and come back to check it back later.


### Task 3: Configure Role

In this task, you will configure roles for use with device groups.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

2. Select **Roles** in the permissions area.

3. Select the **Turn on roles** button.

4. Select **+ Add item**.

5. In the Add role dialog enter the following:

    |General setting|Value|
    |---|---|
    |Role name|**Tier 1 Support**|
    |Permissions|Live Response capabilities - Advanced|

6. Select the **Assigned user groups** tab. Select **sg-IT** and then select **Add selected groups**. Make sure it appears under *Azure AD user groups with this role*.

7. Select **Save**.


### Task 4: Configure Device Groups

In this task, you will configure device groups that allow for access control and automation configuration.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

2. In the permissions area select **Device groups**.

3. Select **+ Add device group**.

4. Enter the following information on the General tab:

    |General setting|Value|
    |---|---|
    |Device group name|**Regular**|
    |Automation level|Full - remediate threats automatically|

5. Select **Next**.

6. On the Devices tab for the OS condition select **Windows 10** and select **Next**.

7. On the Preview devices tab you may select **Show preview** and see the WIN1 virtual machine.  Select **Next**.

8. For the User access tab, select **sg-IT** and then select **Add selected groups** button. Make sure it appears under *Azure AD user groups with access to this device group*.

9. Select **Done**.

10. Device group configuration has changed. Select **Apply changes** to check matches and recalculate groupings.

## Proceed to Exercise 2
