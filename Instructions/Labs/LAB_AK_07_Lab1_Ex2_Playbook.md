# Module 7 - Lab 1 - Exercise 2 - Create a Playbook

### Task 1: Create a Security Operations Center Team in Microsoft Teams.

In this task, you will create a Microsoft Teams team for use in the lab.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, open a new tan and navigate to the Microsoft Teams portal at (https://teams.microsoft.com).

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. Close any Teams pop-ups that may appear.

6. If not already selected, select **Teams** on the left menu, then at the bottom, select **Join or create a team**.

7. Select the **Create Team** button in the main window.

8. Select the **From scratch** button.

9. Select the **Private** button.

10. Give the team the name: **SOC** and select the **Create** button.

11. In the Add members to SOC screen, select the **Skip** button. 

12. Select the **...** next to the newly created SOC team and select **Add channel**.

13. Enter a channel name of *New Alerts* then select the **Add** button.

### Task 2: Create a Playbook in Azure Sentinel.

In this task, you will create a Logic App that will be used as a Playbook in Azure Sentinel.

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

2. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

3. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

4. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

5. Select your Azure Sentinel Workspace you created earlier.

6. Select the **Community** page in the *Content management* area on the left side of the page.

7. Select the **Onboard community content** link on the right pane. This will open a new tab in the Edge Browser for Azure Sentinel GitHub content.

8. Select the **Playbooks** folder.

9. Select the **Post-Message-Teams** folder.

10. In the readme.md box, go below the second *Quick Deployment* option **Deploy with alert trigger** and select **Deploy to Azure** button.  

**VERY IMPORTANT**: Be aware that they are two different Azure Sentinel triggers to use, Incident and Alert. Make sure you are selecting the Alert (second) one.

11. Make sure your Azure Subscription is selected.

12. For Resource Group, select **Create New** and enter *RG-Playbooks* and select **OK**.

13. For region, select the appropriate region for your situation. The default region will likely be optimal.

14. Make sure the *Playbook Name* is "PostMessageTeams-OnAlert" and select **Review + create**.

15. Now select **create**.

**Note** Wait for the deployment to finish before proceeding to the next task. It may take a couple minutes to deploy.

### Task 3: Update a Playbook in Azure Sentinel.

In this task, you will update the new playbook you created with the proper connection information.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

2. Select your Azure Sentinel Workspace.

3. Select the **Automation** from the Configuration area and then select the **Active Playbooks** tab.

4. Select the **PostMessageTeams-OnAlert** playbook.

5. On the Logic App page for *PostMessageTeams-OnAlert*, in the center menu, select **Edit**.

6. Select the block **When a response to an Azure Sentinel alert is triggered**.

7. Select the **Change connection** link.

8. Select **Add new** and select **Sign in**. In the new window, select your Azure subscription admin credentials when prompted.

9. Now select the block **Alert - Get incident**.

10. Select the **Change connection** link.

11. Select the connection that has your Azure subscription admin credentials under *Display Name*. **Hint:** admin@ZZZZZZ.onmicrosoft.com.

12. Now select the block **Connections**.

13. Select **Add new** and select your Azure subscription admin credentials when prompted.

14. Now in the **Post a message (V3)** block, at the end of the Team box, select the **X** to clear the contents. The edit box will be changed to a dropdown with a listing of the available teams from Microsoft Teams.  Select **SOC**.

15. Do the same for the Channel, select the **X** at the end of the edit box to clear the contents. The edit box will be changed to a dropdown with a listing of the Channels. Select **New Alerts**.

16. Select **Save** on the command bar.

The Logic App will be used in a future lab.

## Proceed to Exercise 3
