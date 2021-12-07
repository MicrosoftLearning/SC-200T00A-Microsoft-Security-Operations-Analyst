---
lab:
    title: 'Exercise 1 - Enable Microsoft Defender for Cloud'
    module: 'Module 3 - Mitigate threats using Microsoft Defender for Cloud'
---

# Module 3 - Lab 1 - Exercise 1 - Enable Microsoft Defender for Cloud

## Lab scenario

You're a Security Operations Analyst working at a company that is implementing cloud workload protection with Microsoft Defender for Cloud.  In this lab you will enable Microsoft Defender for Cloud.


### Task 1: Access the Azure portal and set up a Subscription.

In this task, you will set up an Azure Subscription required to complete this lab and future labs.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Microsoft Edge browser or open a new tab if already open.

3. In the Edge browser, navigate to the Azure portal at (https://portal.azure.com).

4. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Subscription*, then select **Subscriptions**. 

7. If the *"Azure Pass - Sponsorship"* subscription is shown (or equivalent name in your selected language), proceed to Task #2. Otherwise, ask your instructor on how to create the Azure subscription with your tenant admin user credentials. **Note:** The subscription creation process could take up to 10 minutes. 

>**Important:** These labs have been designed to use less than USD $10 of Azure services during the class.


### Task 2: Create a Log Analytics Workspace.

In this task, you will create a Log Analytics workspace for use with Microsoft Defender for Cloud.

1. In the Search bar of the Azure portal, type *Log Analytics*, then select **Log Analytics workspaces**.

2. Select **+Create** from the command bar.

3. Select **Create new** for the Resource group.

4. Enter *RG-Defender* and select **Ok**.

5. For the Name, enter something unique like: *uniquenameDefender*.

6. Select **Review + Create**.

7. Once the workspace validation has passed, select **Create**. Wait for the new workspace to be provisioned, this may take a few minutes.


### Task 3: Enable Microsoft Defender for Cloud.

In this task, you will enable and configure Microsoft Defender for Cloud.

1. In the Search bar of the Azure portal, type *Defender*, then select **Microsoft Defender for Cloud**.

2. On the **Getting started** page, go to the **Upgrade** section and make sure your subscription is selected, and then select **Upgrade** button at the bottom of the page.

3. The next page shows the option to install the agent on virtual machines already in the subscription. Do nothing here.

4. Select **Environment settings** from the Management area of the portal menu.

5. Note that your "Defender coverage" includes at least 11 plans. If you don't see it, wait for the *Trial started* notification to appear. After that, select **Refresh** and select your Subscription. 

6. Review the different Azure resources and fees under the *Microsoft Defender for* and *Pricing* columns.

7. Select **Auto provisioning** from the Settings area.

8. Review the Auto provisioning - Extensions. Confirm that **Log Analytics agent for Azure VMs** is **Off**.

9. Close the settings page by selecting the 'x' on the upper right of the page to go back to the **Environment settings** again and select the '>' on the left of your subscription.

10. Select the Log analytics workspace you created earlier *uniquenameDefender* to review the available options and pricing. Select **Enable all Microsoft Defender for Cloud plans** and select **Save**.


### Task 4: Install Azure Arc on an On-Premises Server.

To make onboarding of your on-premises server easier.  Install Azure Arc, which will then enable Azure to manage the on-premises server.

In this task, you will install Azure Arc on an on-premises server.

1. Log in to WINServer virtual machine as Administrator with the password: **Passw0rd!**.  

2. Open the Microsoft Edge browser and navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Arc*, then select **Azure Arc**.

6. In the navigation pane under **Infrastructure** select **Servers**

7. Select **+ Add**.

8. Select **Generate script** in the "Add a single server" section.

9. Select **Next** to get to the Resource details tab.

10. Select the Resource group you created earlier. Hint: *RG-Defender*

    >**Note:** If you haven't already created a resource group, open another tab and create the resource group and start over.

11. Review the *Server details* and *Network connectivity* options. Select **Next** to get to the Tags tab.

12. Select **Next** to get to the Download and run script tab.

13. Select **Register**.

    >**Note:** Wait at least three (3) minutes for processing.

14. Scroll down and select the **Download** button. Hint: if your browser blocks the download take action in the browser to allow it. In Edge Browser, select the 3 dots "..." and then select **Keep**. 

15. Right-click the Windows Start button and select **Windows PowerShell (Admin)**.

16. Enter Administrator for the Username if prompted.

17. Enter Passw0rd! for the password if prompted.

18. Enter: cd C:\Users\Administrator\Downloads

19. Type *Set-ExecutionPolicy -ExecutionPolicy Unrestricted* and press enter.

20. Enter **A** for Yes to All and press enter.

21. Type *.\OnboardingScript.ps1* and press enter.

22. Enter **R** to Run once and press enter (this may take a couple minutes).

23. Follow the instructions on the last line of the output in PowerShell, to complete the device registration.  This will include authentication of the device through a browser.  Copy the url (https://microsoft.com/devicelogin) and enter it in a new Edge browser tab. Go back to the Windows PowerShell window, copy the code to authenticate and paste it in the previously open tab and select **Next**. Select your tenant admin account and select **Continue** in the *Are you trying to sign in to Azure Connected Machine Agent?* window. 

24. After the message *"Successfully Onboarded Resource to Azure"* appears in the Windows PowerShell window, go to the Azure portal page where you downloaded the script and select **Close**. Close the **Add servers with Azure Arc** to go back to the Azure Arc **Servers** page.

25. Select **Refresh** until WINServer server name appears.

    >**Note:** This could take a few minutes.


### Task 5: Protect an On-Premises Server.

In this task, you will manually install the required agent on the Windows Server.

1. Go to **Microsoft Defender for Cloud** and select the **Getting Started** page.

2. Select the **Get Started** tab.

3. Scroll down and select **Configure** under the *Add non-Azure servers* section.

4. Select **Upgrade** next to the workspace you created earlier.  This might take a few minutes, wait until you see the notification *"Defender plans for workspace were saved successfully"*.

5. Select **+ Add Servers** next to the workspace you created earlier.

6. Select **Download Windows Agent (64 bit)**.

7. Run the downloaded file.

8. Select **Next** until the wizard page for **Agent Setup Options** appears, Select **Connect the Agent to Azure Log Analytics (OMS)**, then select **Next**.

9. Copy and paste the **Workspace ID** and **Primary Key** from the Azure portal into the wizard page fields as appropriate and select **Next**.

10. Continue with the Install. Select **Finish** when complete.

11. Go to the "Microsoft Defender for Cloud" portal and select **Inventory**.

12. The Server should appear in the list.  You may have to select **Refresh** to see the update and it will take a few minutes.

13. You can move on to the next lab and return later to the **Microsoft Defender for Cloud**. Your server will appear in the **Inventory** section. 

# Proceed to Exercise 2
