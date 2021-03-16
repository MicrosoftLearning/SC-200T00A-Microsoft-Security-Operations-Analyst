# Module 1 - Lab 1 - Exercise 1 - Deploy Microsoft Defender for Endpoint

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the SecOps team response procedures.

You start by initializing the Defender for Endpoint environment. Next, you onboard the initial devices for your deployment by running the onboarding script on the devices. You configure security for the environment. Lastly, you create Device groups and assign the appropriate devices.

### Task 1 - Obtain Your Microsoft 365 Credentials

Once you launch the lab, a free trial tenant will be made available to you to access in the Microsoft Virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign in to Azure and Microsoft 365 within the Microsoft Virtual Lab environment. 

Because this course can be offered by learning partners using any one of several authorized lab hosting providers, the actual steps involved to retrieve the tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions on how to retrieve this information for your course. The information that you should note for later use includes:

	- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign in to Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign in to Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
	- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	

### Task 2: Initialize Microsoft Defender for Endpoint.

In this task, you will perform the initialization of the Microsoft Defender for Endpoint portal.


1.  Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2.  Open the Microsoft Edge browser, search for "edge browser update", download, and install the new Microsoft Edge browser. This is necessary to ensure you're running the latest version of Microsoft Edge in your hosted virtual machine. Start the new Edge browser.

3.  In the Edge browser, go to the Microsoft Defender Security Center at (https://securitycenter.microsoft.com).

4. In the **Sign in** dialog box, copy and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

**Note**: if you receive a message "You can't access this section.",  wait 5 minutes and try again.  Sometimes the access rules need to propagate the tenant.  

6. On the **Microsoft Security Center** setup Step 2, select **Next**.

7. On Step 3 **Set up preferences**, select the data storage location appropriate for where this training tenant is being managed.  You may want to validate with your course instructor.

8. Confirm the Preview features are **On**.

9. Select **Next**.  

10. Select Continue on the **Create your cloud instance**

11. After the **Creating your Microsoft Defender for Endpoint account** progress bar completes. Step 4 options will be displayed.  Select **Start using Microsoft Defender for Endpoint**.

12. In the Setup incomplete dialog box select **Proceed anyway**.

**Note**: The setup is **Complete**.  You will onboard Devices in the next task.  

### Task 3: Onboard a Device.

In this task, you will onboard a device to Microsoft Defender for Endpoint.

1. Go to the Microsoft Defender Security Center at (https://securitycenter.microsoft.com) and login with the **Tenant Email** credentials if you are not currently in the portal.

2. Select **Settings** from the left menu bar.

3. Select **Onboarding** in the Device management section.

4. In the Onboard a device area select **Download Package** button.

5. Extract the downloaded zip file to a local folder like the Documents folder.

6. Right-click on the extracted file WindowsDefenderATPLocalOnboardingScript.cmd and choose **Run as Administrator**.  If you encounter the Windows SmartScreen choose to Run anyway.

**Note** By default, the file should be in the c:\users\admin\downloads directory.
    
7. Answer **Y** to questions presented by the script. When complete you should see a message in the command screen that says something like "Successfully onboarded machine..." 

8. From the Onboarding page in the portal, copy the detection test script and run it in an open command window.  You may have to open a new **Administrator: Command Prompt** window by typing *CMD* in the windows search bar and choose to **run as Administrator**.

9. In the Microsoft Defender Security Center portal menu, select **Device inventory**. You should now see your device in the list.

**Note** It can take up to 5 minutes for the device to be displayed in the portal.


### Task 4: Configure Role

In this task, you will configure roles for use with device groups.

1. In the Microsoft Defender Security Center portal select **Settings** from the left menu bar. 

2. Select **Roles** in the permissions area.

3. Select the **Turn on roles** button.

4. Select **Add item**.

5. In the Add Role dialog enter the following:
    Role Name: Tier
    Live Response capabilities: select checkbox
    Advanced: select.

6. Select **Next**.

7. In the Assigned user groups tab. Select **sg-IT** and then select **Add selected groups**.

8. Select **Save**.


### Task 5: Configure Device Groups

In this task, you will configure device groups that allow for access control and automation configuration.

1. Select **Settings** from the left menu bar. 

2. In the permissions area select **Device groups**.

3. Select **Add device group**.

4. Enter the following information on the General tab:

- Device group name: Regular
- Automation level: Full - remediate threats automatically
- Members: Name equals TESTLAB

5. Select **Next**.

6. For the User access tab, select **sg-IT** and then select **Add selected groups**

7. Select **Done**.


## Proceed to Exercise 2

