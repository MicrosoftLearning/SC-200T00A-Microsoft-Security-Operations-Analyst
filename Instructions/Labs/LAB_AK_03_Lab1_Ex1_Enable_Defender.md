# Module 3 - Lab 1 - Exercise 1 - Enable Azure Defender

## Lab scenario

You're a Security Operations Analyst working at a company that is implementing cloud workload protection with Azure Defender.

### Task 1: Access the Azure portal and set up a Subscription.

In this task, you will set up an Azure Subscription required to complete this lab and future labs.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2.  Open the browser, search for, download, and install the new Microsoft Edge browser. Start the new Edge browser.

3.  In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Subscription*, then select **Subscription**.

**Important** It is important to create the Azure Subscription as the Admin user for the tenant.

7. Select **Add** for a new Subscription.

8. Follow the page instructions to create a new subscription.

**Note** It could take up to 30 minutes before the subscription can be used.

### Task 2: Create a Log Analytics Workspace.

In this task, you will create a Log Analytics workspace for use with Azure Defender.

1. In the Search bar of the Azure portal, type *Log Analytics*, then select Log Analytics workspaces.

2. Select **New** from the command bar.

3. Create new for the Resource group.

4. Enter *rg-AzureDefender*.

5. For the Name, enter: *laAzureDefender*

6. Select **Review and Create**.

7. Select **Create**.

**Note** Wait for the new workspace to be provisioned.

### Task 3: Enable Azure Defender.

In this task, you will enable and configure Azure Defender.

1. In the Search bar of the Azure portal, type *Security*, then select **Security Center**.

2. On the Getting Started page of Security Center select **Upgrade**. Make sure your Subscription and the laAzureDefender workspace are selected.

3. The next page shows the option to install the agent on virtual machines already in the subscription.  Do nothing here.

4. Select the Pricing and settings from the portal menu.

5. Select your Subscription 

6. Review the resources and fees.  Turn Server Off then select **Save**.

**Note:** This is for lab purposes only.  It is good to understand which resources will be automatically covered and the fees involved.  The next steps are to disable Azure Defender for Servers.  The purpose of this is to manage the cost in your Azure subscription. Normally, you would leave this enabled.

7. Select **Auto provisioning**.

8. Review the Auto provisioning - Extensions. Confirm that Log Analytics agent for Azure VMs is **Off**.

9. Select the **Pricing and settings** from the portal menu.

10. Select  **laAzureDefender**

11. Turn Server Off, then select **Save**.



### Task 4: Install Azure Arc on an On-Premises Server.

To make onboarding of your On-Premise server easier.  Install Azure Arc, which will then enable Azure to manage the On-Premise server.

In this task, you will install Azure Arc on an On-premises server.

1. Log in to WINServer virtual machine as Administrator with the password: **Passw0rd!**.  

2.  In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Azure Arc*, then select **Azure Arc**.

6. Select **Servers** from the page menu.

7. Select **Add**.

8. Select *Generate script* in the Add a single server section.

9. Select **Next : Resource details**.

10. Select a Resource Group.
**Note** If you haven't already created a resource group. Open another tab and create the resource group.

11. Select **Next: Tags**.

12. Select **Next: Download and run script**.

13. Select **Register**.

**Note** Wait three minutes.

14. Select **Download**. 

15. Open Windows PowerShell and **Run as Administrator**.

16. Enter Administrator for the User name.

17. Enter Passw0rd! for the password.

18. Enter: cd Downloads
The screen should show:
PS C:\Users\Administrators\Downloads

19. Enter: Set-ExecutionPolicy -ExecutionPolicy Unrestricted

20. Enter **A** for Yes to All.

21. Enter: .\OnboardingScript.ps1

22. Select **R** to Run once.

23. Follow the on-screen instructions to complete the device registration.

24. On the Azure Arc portal page, select **Servers**.

25. Select **Refresh** until the server name appears.

**Note** This could take a few minutes.

### Task 5: Protect an On-Premise Server.

In this task, you will manually install the required agent on the Windows Server.

1. Select **Getting started** in the Security Center portal.

2. Select the **Get Started** tab.

3. Select **Configure** under the Add non-Azure servers section.

4. Select **Upgrade** next to the laAzureDefender workspace.

5. Select **Add Server** next to the laAzureDefender workspace.

6. Select **Download Windows Agent (64 bit)**.

7. Run the downloaded file.

8. Select **next** until the wizard page for Agent Setup Options appears, Select **Connect the Agent to Log Analytics (OMS)**, then select **Next**.

9. Copy and paste the Workspace ID and Primary Key from the Azure portal into the wizard page.

10. Continue with the Install. Then select **Finish**.

11. Select **Inventory** in the Security Center portal.

12. The Server should appear in the list.

**Note** The Server should appear as unprotected.  This is correct as we turned off the Azure Defender plans for Servers. 

# Proceed to Exercise 2


