---
lab:
    title: 'Exercise 1 - Explore Microsoft 365 Defender'
    module: 'Module 1 - Mitigate threats using Microsoft 365 Defender'
---

# Module 1 - Lab 1 - Exercise 1 - Explore Microsoft 365 Defender 

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft 365 Defender. You start by assigning preset security policies in EOP and Microsoft Defender for Office 365.


### Task 1: Obtain Your Microsoft 365 Credentials

Once you launch the lab, a free trial tenant will be made available to you to access in the Microsoft virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign in to Azure and Microsoft 365 within the Microsoft Virtual Lab environment. 

Because this course can be offered by learning partners using any one of several Authorized Lab Hosting (ALH) providers, the actual steps involved to retrieve the tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions for how to retrieve this information for your course. The information that you should note for later use includes:

- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign in to Microsoft 365 throughout the labs. This is in the format of **{username}@ZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign in to Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.


### Task 2: Apply Microsoft Defender for Office 365 preset security policies

In this task, you will assign preset security policies for EOP and Microsoft Defender for Office 365 in the Microsoft 365 security portal.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Start the Microsoft Edge browser.

3. In the Edge browser, go to the Microsoft 365 Defender portal at (https://security.microsoft.com).

4. In the **Sign in** dialog box, copy and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Note**: if you receive a message "You can't access this section." wait 5 minutes and try again. Sometimes the access rules need to propagate the tenant which can take many minutes.  

6. If shown, close the Microsoft 365 Defender quick tour.

7. From the navigation menu, under *Email & Collaboration*, select **Polices & Rules**.

8. On the *Policy & Rules* dashboard, select **Threat Policies**.

9. On the *Policy dashboard*, select **Preset Security Policies**.

10. Under *Standard protection*, select **Edit**.

11. In *EOP protections apply to*, under **Domains** write your tenant's domain name, select it and select **Next**. Notice that this configuration applies policies for anti-spam, outbound spam filter, anti-malware, anti-phishing.

12. In *Defender for Office 365 protections​ apply to*, apply the same configuration as the previous step and select **Next**. Notice that this configuration applies policies for anti-phishing, Safe Attachments, Safe Links.

13. Read the content under *Review and confirm your changes* and select **Confirm** to apply the changes and select **Done** to finish.

14. Under *Strict protection*, select **Edit**.

15. In *EOP protections apply to*, under **Groups** write **Leadership**, select it and select **Next**. Notice that this configuration applies policies for anti-spam, outbound spam filter, anti-malware, anti-phishing.

16. In *Defender for Office 365 protections​ apply to*, apply the same configuration as the previous step and select **Next**. Notice that this configuration applies policies for anti-phishing, Safe Attachments, Safe Links.

17. Read the content under *Review and confirm your changes* and select **Confirm** to apply the changes and select **Done** to finish.

18. On the top middle menu, select **Threat policies** to go back and under *Policies*, select **Safe Attachments**. Notice that both preset policies appears here and the Status is On.

19. In the menu, select **Global Settings**.

20. Read through the available options and select the toggle under **Turn on Defender for Office 365 for SharePoint, OneDrive, and Microsoft Teams** and select **Save**.

## You have completed the lab.
