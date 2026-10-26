---
lab:
  title: Exercise 1 - Deploy Microsoft Defender for Endpoint
  module: Learning Path 4 - Mitigate threats using Microsoft Defender for Endpoint
  description: You're a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.
  duration: 30 minutes
  level: 200
  islab: true
  primarytopics:
    - Microsoft Defender
    - Microsoft Defender for Endpoint
---

# Learning Path 4 - Lab 1 - Exercise 1 - Deploy Microsoft Defender for Endpoint

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod2_L1_Ex1.png)

You're a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.

You start by initializing the Defender for Endpoint environment. Next, you onboard the initial devices for your deployment by running the onboarding script on the devices. You configure security for the environment. Lastly, you create Device groups and assign the appropriate devices.

>**Important:** The lab Virtual Machines are used through different modules. SAVE your virtual machines. If you exit the lab without saving, you will be required to re-run some configurations again.

>**Note:** Make sure you have successfully completed Task 3 of the first module.

### Estimated time to complete this lab: 30 minutes

### Task 1: Initialize Microsoft Defender for Endpoint

In this task, you'll perform the initialization of the Microsoft Defender for Endpoint.

1. Sign in to **WIN1** virtual machine as Admin using the provided credentials.

1. If you aren't already at the **Microsoft Defender XDR portal**, start the **Microsoft Edge** browser.

1. In the Microsoft Edge browser, navigate to **Microsoft Defender XDR** at `https://security.microsoft.com`.

1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Tip:** The admin's tenant email account and password can be found on the Resources tab.

1. On the **Defender XDR** portal, from the navigation menu on the left, scroll down and expand the **Setup & configuration** section and select **Settings**.

    >**Note:** Some versions of the portal may not have the **Settings** option under the **Setup & configuration** section. **Settings** may be grouped with *Reports* and *Audit*.

1. On the Settings page, select **Device discovery**.

    >**Note:** If you do not see the **Device discovery** option under **Settings**, logout by selecting the top-right circle with your account initials and select **Sign out**. Other options that you might want to try is to refresh the page with Ctrl+F5 or open the page InPrivate. Login again with the **Tenant Email** credentials.

1. In Discovery setup, make sure **Standard discovery (recommended)** is selected. 

    >**Hint:** If you do not see the option, refresh the page.

### Task 2: Onboard a Device

In this task, you'll onboard a device to Microsoft Defender for Endpoint using the Defender deployment tool.

1. In the **Defender XDR** portal, from the navigation menu on the left, scroll down and expand the **Setup & configuration** section and select **Settings**, then select **Endpoints**.

1. Select **Onboarding** in the **Device management** section.

   >**Note:** You can also perform device onboarding from the **Assets** section of the left menu. Expand **Assets** and select **Devices**. On the **Device inventory** page, scroll down to **Onboard devices**. This takes you to the **Settings > Endpoints > Onboarding** page.

1. In **Settings > Endpoints > Onboarding**, scroll to **Deploy by downloading and applying packages or files**. In the **Defender deployment tool** section, select **Onboard**.

1. In the **Generate the Defender deployment tool with an access key** pane, enter a name and select **Generate**.

1. Copy the generated deployment key, and select **Download deployment tool**, and then select **.zip**.

1. Open the downloaded ZIP file from the browser download notification, or navigate to the **Downloads** folder.

    >**Hint:** The downloaded file should be located in `C:\Users\Admin\Downloads`.

1. Right-click the downloaded ZIP file, select **Extract All...**, verify that **Show extracted files when complete** is selected, and then select **Extract**.

1. Open the extracted folder and run **DefenderDeploymentTool_Onboard_`<name>`.exe** (where `<name>` matches the name you entered).
   
1. If the **User Account Control** window appears, select **Yes**.

1. In the **Microsoft Defender deployment tool** window, select **Continue**.

1. When prompted, paste the deployment key that you copied earlier and verify that the key is shown as **Valid**.

1. Select **Continue** to start the onboarding process.

1. Wait for the onboarding process to complete successfully, then select **OK** to close the deployment tool.

1. On the **Your Defender deployment package and key are ready!** pane, verify that the **Deployment tool downloaded successfully!** message appears, and then close the pane.

### Task 3: Configure Roles

In this task, you'll configure roles for use with device groups.

1. In the Microsoft Defender XDR portal navigation menu, expand the **Setup & configuration** section and select **Settings**, then select **Microsoft Defender XDR**.

1. Select **Permissions and Roles** under the *Account* section.

1. Scroll down the page and select the **Go to Permissions and roles** link.

1. On the **Permissions and roles** page, select **+ Create custom role**.

1. On the **Basics** page In the Add role dialog, enter the following:

    |Basics setting|Value|
    |---|---|
    |Role name|**Tier 1 Support**|

1. Select **Next**.

1. On the **Permissions** page, select the following permissions:

    |Permissions group|Description|
    |---|---|
    |Security Operations|Manages day-to-day operations and responds to incidents and advisories|

1. In the pop-out page for *Security operations*, select the **All read and manage permissions** radio button.

1. Select **Apply**, and then select **Next**.

1. On the **Assign users and data sources** page, select the **Create assignment** button.

1. In the **Add assignment** dialog, enter the following:

    |Assignment setting|Value|
    |---|---|
    |Assignment name|**Tier 1 Support**|
    |Employees|**sg-IT**|
    |Data sources|**Leave default**|

1. Select **Add**, then select **Next**.

1. Select **Submit** and then **Done** when finished.

<!--- 1. On the *Permissions and roles* page, select the **Activate workloads** button. --->

### Task 4: Configure Device Groups

In this task, you'll configure device groups that allow for access control and automation configuration.

1. In the Microsoft Defender XDR portal left menu bar, expand the **Setup & configuration** section and select **Settings**, then select **Endpoints**.

1. Select **Device groups** under the permissions area.

1. Select **+ Add device group** icon.

1. Enter the following information on the General tab:

    |General setting|Value|
    |---|---|
    |Device group name|**Regular**|
    |Remediation level|Full remediation|

1. Select **Next**.

1. On the Devices tab, for the OS condition select **Windows 11** and select **Next**.

    >**Note:** Some lab hosting providers may still have *Windows 10* images for WIN1. You can select either or both.

1. On the Preview devices tab, the *Show preview* button could show the WIN1 virtual machine, but most likely the data isn't populated yet. Select **Next** to continue.

1. For the User access tab, select **sg-IT** and then select **Add selected groups** button. Make sure it appears under *Azure AD user groups with access to this device group*.

1. Select **Submit** and then **Done** when finished.

1. Device group configuration has changed. Select **Apply changes** to check matches and recalculate groupings.

1. You're going to have two device groups now; the "Regular" you created and the "Ungrouped devices (default)" with the same remediation level.

## Proceed to Exercise 2
