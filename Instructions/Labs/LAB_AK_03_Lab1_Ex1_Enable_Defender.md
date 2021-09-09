# Module 3 - Lab 1 - Exercise 1 - Enable Azure Defender

## Lab scenario

You're a Security Operations Analyst working at a company that is implementing cloud workload protection with Azure Defender.  In this lab you will enable Azure Defender.

### Task 1: Access the Azure portal and set up a Subscription.

In this task, you will set up an Azure Subscription required to complete this lab and future labs.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Microsoft Edge browser.

3. In the Edge browser, navigate to the Azure portal at (https://portal.azure.com).

4. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Subscription*, then select **Subscriptions**.

**Important:** You must create the Azure Subscription as the Admin user for the tenant.

7. Utilize the "Azure Pass - Sponsorship" provided by your instructor.  These labs have been designed to use less than USD $10 of Azure services during the class.

**Note:** It could take up to 10 minutes before the subscription can be used. 

### Task 2: Create a Log Analytics Workspace.

In this task, you will create a Log Analytics workspace for use with Azure Defender.

1. In the Search bar of the Azure portal, type *Log Analytics*, then select **Log Analytics workspaces**.

2. Select **+Create** from the command bar.

3. Select **Create new** for the Resource group.

4. Enter *rg-AzureDefender*.

5. For the Name, enter something unique like: *uniquenameAzureDefender*

6. Select **Review + Create**.

7. Once the workspace validation has passed, select **Create**. Wait for the new workspace to be provisioned, this may take a few minutes.

### Task 3: Enable Azure Defender.

In this task, you will enable and configure Azure Defender.

1. In the Search bar of the Azure portal, type *Security*, then select **Security Center**.

2. On the **Getting started** page of Security Center go to the **Upgrade** section and make sure your subscription is selected, and then select **Upgrade** button.

3. The next page shows the option to install the agent on virtual machines already in the subscription. Do nothing here.

4. Select **Pricing & settings** from the Management area of the portal menu.

5. Note that your "Azure Defender plan" is "On".  Select your Subscription. 

6. Review the resources and fees.

7. Select **Auto provisioning** from the Settings area.

8. Review the Auto provisioning - Extensions. Confirm that **Log Analytics agent for Azure VMs** is **Off**.

9. Go back to the Security Center portal and select the **Pricing and settings** again.

10. Select the workspace ID you created earlier *uniquenameAzureDefender* to review the pricing.

### Task 4: Install Azure Arc on an On-Premises Server.

To make onboarding of your on-premises server easier.  Install Azure Arc, which will then enable Azure to manage the on-premises server.

In this task, you will install Azure Arc on an on-premises server.

1. Log in to WINServer virtual machine as Administrator with the password: **Passw0rd!**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Arc*, then select **Azure Arc**.

6. Select **Servers** under "Infrastructure" from the Azure Arc page menu.

7. Select **+ Add**.

8. Select **Generate script** in the "Add a single server" section.

9. Select **Next : Resource details >**.

10. Select the Resource group you created earlier. Hint: *rg-AzureDefender*

**Note** If you haven't already created a resource group. Open another tab and create the resource group.

11. Select **Next: Tags >**.

12. Select **Next: Download and run script >**.

13. Select **Register**.

**Note** Wait three minutes for processing.

14. Select the **Download** button. Hint: if your browser blocks the download take action in the browser to allow it. In Edge Browser, select the 3 dots "..." and then "Keep".

15. Open Windows PowerShell and select **Run as Administrator**.

16. Enter Administrator for the User name if prompted.

17. Enter Passw0rd! for the password if prompted.

18. Enter: cd Downloads
The screen should show:
PS C:\Users\Administrator\Downloads>

19. Type *Set-ExecutionPolicy -ExecutionPolicy Unrestricted* and press enter.

20. Enter **A** for Yes to All and press enter.

21. Type *.\OnboardingScript.ps1* and press enter.

22. Enter **R** to Run once and press enter (this may take a couple minutes).

23. Follow the instructions on the last line of the output in PowerShell, to complete the device registration.  This will include authentication of the device through a browser.  Look for the (https://microsoft.com/devicelogin) browser prompt that should appear and enter the code to authenticate.

24. On the Azure portal page, select **Close** and close the **Add servers with Azure Arc**. In the Azure Arc page, select **Servers**.

25. Select **Refresh** until WINServer server name appears.

**Note** This could take a few minutes.

### Task 5: Protect an On-Premise Server.

In this task, you will manually install the required agent on the Windows Server.

1. Go to the Azure Security Center and select the **Getting Started** page.

2. Select the **Get Started** tab.

3. Select **Configure** under the *Add non-Azure servers* section.

4. Select **Upgrade** next to the workspace you created earlier.  This may take a few minutes.  

5. Select **+ Add Servers** next to the workspace you created earlier.

6. Select **Download Windows Agent (64 bit)**.

7. Run the downloaded file.

8. Select **Next** until the wizard page for Agent Setup Options appears, Select **Connect the Agent to Azure Log Analytics (OMS)**, then select **Next**.

9. Copy and paste the Workspace ID and Primary Key from the Azure portal into the wizard page fields as appropriate and select **Next**.

10. Continue with the Install. Select **Finish** when complete.

11. Go to the Security Center portal and select **Inventory**.

12. The Server should appear in the list.  You may have to select **Refresh** to see the update and it may take a couple minutes.


# Proceed to Exercise 2