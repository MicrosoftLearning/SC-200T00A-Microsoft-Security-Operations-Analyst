# Module 2 - Lab 1 - Exercise 1 - Deploy Microsoft Defender for Endpoint

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.

You start by initializing the Defender for Endpoint environment. Next, you onboard the initial devices for your deployment by running the onboarding script on the devices. You configure security for the environment. Lastly, you create Device groups and assign the appropriate devices.

### Task 1 - Obtain Your Microsoft 365 Credentials

Once you launch the lab, a free trial tenant will be made available to you to access in the Microsoft virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign in to Azure and Microsoft 365 within the Microsoft Virtual Lab environment. 

Because this course can be offered by learning partners using any one of several Authorized Lab Hosting (ALH) providers, the actual steps involved to retrieve the tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions for how to retrieve this information for your course. The information that you should note for later use includes:

- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign in to Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign in to Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
    
- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	

### Task 2: Initialize Microsoft Defender for Endpoint.

In this task, you will perform the initialization of the Microsoft Defender for Endpoint portal.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Microsoft Edge browser.

3. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

4. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

**Note**: if you receive a message "You can't access this section.",  wait 5 minutes and try again.  Sometimes the access rules need to propagate the tenant which can take many minutes.  

6. On the **Microsoft 365 Defender** portal select **Settings** from the left.

7. On the **Settings** page select **Microsoft 365 Defender**.  Select **Preview features** and make sure preview features are turned on. Return to the **Settings** menu.

8. On the **Settings** page select **Device discovery**.  In Discovery setup make sure **Standard discovery** is selected.  Return to the **Settings** menu. **Note**: If you don't see the **Device discovery** option under **Settings**, logout by clicking the top-right circle with your account initials and click  **Sign out**. Login again with the **Tenant Email** credentials.

**Note**: The Defender for Endpoint setup should be performed automatically by your Microsoft 365 E5 tenant.  You can view the other settings if you like.  You will onboard Devices in the next task.  

### Task 3: Onboard a Device.

In this task, you will onboard a device to Microsoft Defender for Endpoint using the Security Center.

1. Go to the Microsoft Defender Security Center at (https://security.microsoft.com) and login with the **Tenant Email** credentials if you are not currently in the portal.

2. Select **Settings** from the left menu bar, then from the Settings page select **Endpoints**.

3. Select **Onboarding** in the Device management section.

4. In the "1. Onboard a device" area make sure "Local Script (for up to 10 devices)" is displayed in the Deployment method drop-down and select the **Download onboarding package** button.

5. Extract the downloaded zip file to a local folder like the Documents folder.

6. Right-click on the extracted file WindowsDefenderATPLocalOnboardingScript.cmd and choose **Run as Administrator**.  If you encounter the Windows SmartScreen choose to Run anyway.

**Note** By default, the file should be in the c:\users\admin\downloads directory.
    
7. Answer **Y** to questions presented by the script and press **Enter**. When complete you should see a message in the command screen that says something like "Successfully onboarded machine...". Press any key to close the window.

8. From the Onboarding page in the portal under the "2. Run a detection test" area, copy the detection test script and run it in an open command window.  You may have to open a new **Administrator: Command Prompt** window by typing *CMD* in the windows search bar and choose to **run as Administrator**. The **Administrator: Command Prompt** closes automatically after running the script.

9. In the Microsoft 365 Defender portal in the Endpoints area, select **Device inventory**. You should now see your device in the list.

**Note** It can take up to 5 minutes for the device to be displayed in the portal.


### Task 4: Configure Role

In this task, you will configure roles for use with device groups.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

2. Select **Roles** in the permissions area.

3. Select the **Turn on roles** button.

4. Select **+ Add item**.

5. In the Add role dialog enter the following:
    Role Name: Tier
    Live Response capabilities: select checkbox
    Advanced: select.

6. Select the **Assigned user groups** tab. Select **sg-IT** and then select **Add selected groups**.

7. Select **Save**.


### Task 5: Configure Device Groups

In this task, you will configure device groups that allow for access control and automation configuration.

1. In the Microsoft 365 Defender portal select **Settings** from the left menu bar, then select **Endpoints**. 

2. In the permissions area select **Device groups**.

3. Select **+ Add device group**.

4. Enter the following information on the General tab:

- Device group name: Regular
- Automation level: Full - remediate threats automatically

5. Select **Next**.

6. On the Devices tab for the OS condition select **Windows 10** and select **Next**.

7. On the Preview devices tab you may select **Show preview** and see your local Windows 10 virtual machine.  Select **Next**.

8. For the User access tab, select **sg-IT** and then select **Add selected groups** button.

9. Select **Done**.

10. Device group configuration has changed. Select **Apply changes** to check matches and recalculate groupings.


## Proceed to Exercise 2

