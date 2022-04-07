---
lab:
    title: 'Exercise 1 - Explore Microsoft 365 Defender'
    module: 'Module 1 - Mitigate threats using Microsoft 365 Defender'
---

# Module 1 - Lab 1 - Exercise 1 - Explore Microsoft 365 Defender 

## Lab scenario

![M365 Defender](../Media/SC-200-Lab_M1_L1_Ex1.png)

You are a Security Operations Analyst working at a company that is implementing Microsoft 365 Defender. You start by assigning preset security policies in EOP and Microsoft Defender for Office 365.


### Task 1: Obtain Your Microsoft 365 Credentials

Once you launch the lab, a free trial tenant will be made available to you to access in the Microsoft virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign in to Azure and Microsoft 365 within the Microsoft Virtual Lab environment. 

Because this course can be offered by learning partners using any one of several Authorized Lab Hosting (ALH) providers, the actual steps involved to retrieve the tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions for how to retrieve this information for your course. The information that you should note for later use includes:

- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign into Microsoft 365 throughout the labs. This is in the format of **{username}@ZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign into Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.


### Task 2: Apply Microsoft Defender for Office 365 preset security policies

In this task, you will assign preset security policies for EOP and Microsoft Defender for Office 365 in the Microsoft 365 security portal.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Start the Microsoft Edge browser.

1. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

1. In the **Sign in** dialog box, copy and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Note:** if you receive a message "You can't access this section." wait 5 minutes and try again. Sometimes the access rules need to propagate the tenant which can take many minutes.  

1. If shown, close the Microsoft 365 Defender quick tour.

1. From the navigation menu, under *Email & Collaboration* area, select **Policies & rules**.

1. On the *Policy & rules* dashboard, select **Threat policies**.

1. On the *Threat polies* dashboard, select **Preset Security Policies**.

    >**Note:** If you receive the message "Client Error - Error when getting bip rule" select **OK** to continue. The error is due to the hydration status of your tenant at Office 365 which is not enabled by default.

1. Under *Standard protection*, select **Manage**.

1. In *EOP protections apply to* section, under **Domains** write your tenant's domain name, select it, and then select **Next**. **Hint:** You tenant's domain name is the same that you have for you admin account, it might be something like *WWLx######.onmicrosoft.com*. Notice that this configuration applies policies for anti-spam, outbound spam filter, anti-malware, anti-phishing. 

1. In *Defender for Office 365 protections apply to* section, apply the same configuration as the previous step and select **Next**. Notice that this configuration applies policies for anti-phishing, Safe Attachments, Safe Links.

1. Read the content under *Review and confirm your changes* and select **Confirm** to apply the changes and select **Done** to finish.

1. Under *Strict protection*, select **Manage**. **Hint:** *Strict protection* is found under "Email & Collaboration - Policies & rules - Threat policies - Preset security policies".

1. In *EOP protections apply to*, under **Groups** write **Leadership**, select it, and then select **Next**. Notice that this configuration applies policies for anti-spam, outbound spam filter, anti-malware, anti-phishing.

1. In *Defender for Office 365 protections apply to* section, apply the same configuration as the previous step and select **Next**. Notice that this configuration applies policies for anti-phishing, Safe Attachments, Safe Links.

1. Read the content under *Review and confirm your changes* and select **Confirm** to apply the changes and select **Done** to finish.

1. On the top middle menu, select **Threat policies** to go back and under *Policies*, select **Safe Attachments**. Notice that both preset policies appears here and the Status is On.

1. In the menu, select the **gear** icon for **Global Settings**.

1. Read through the available integration options and select **Cancel** to go back.

1. On the **Microsoft 365 Defender** portal, from the navigation menu, select **Settings** from the left.

1. On the **Settings** page select **Microsoft 365 Defender**. You are going to see an image of a coffee mug and a message that reads: "Hang on! We're preparing new spaces for your data and connecting them". It will take several minutes to finish, so leave the page open until the next lab. 

    >**Note:** If you get the error message "We didn't plan it will fail, but something went wrong." retry the step later or do it before the next Lab.

1. When the new space completes successfully, you are going to see the Microsoft 365 Defender settings for Account, Email notifications, Preview features and Streaming API.

## You have completed the lab.
