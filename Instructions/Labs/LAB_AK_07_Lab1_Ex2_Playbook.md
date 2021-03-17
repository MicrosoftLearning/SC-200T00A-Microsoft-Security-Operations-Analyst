# Module 7 - Lab 1 - Exercise 2 - Create a Playbook

### Task 1: Create a Security Operations Center Team in Microsoft Teams.

In this task, you will create a Microsoft Teams team for use in the lab.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Microsoft Teams App from the Windows menu.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. Select **No, sign in to this app only**.

6. In Microsoft Teams, select **Teams**, then at the bottom, select **Join or create a team**.

7. Select **Create a Team** in the main window.

8. Select **From scratch**.

9. Select **Private**.

10. Give the team the name: **SOC** and select **Create**.

11. In the Add members to SOC, select **Skip**. 

12. Click the **...** next to the team name SOC, and select **Add channel**.

13. Enter a channel name of *New Alerts* then select **Add**.

### Task 2: Create a Playbook in Azure Sentinel.

In this task, you will create a Logic App that will be used as a Playbook in Azure Sentinel.

1.  In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

2. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

3. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

4. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

5. Select your Azure Sentinel Workspace you created earlier.

6. Select the **Community** page in the Configuration area on the left side of the page.

7. Select the **Go to Azure Sentinel community** button.

8. Select the **Playbooks** folder.

9. Select the **Post-Message-Teams** folder.

10. Select **Deploy to Azure** button.

11. Select your Azure Subscription.

12. For Resource Group, select **Create New** and enter *rg-Playbooks*.

13. For region, select the appropriate region for your situation.  The default region will likely be optimal.

14. For User Name, enter the user name **Tenant Email**

15. Select **Review + create**.

16. Now select **create**.

**Note** Wait for the deployment to finish before proceeding to the next task.

### Task 3: Update a Playbook in Azure Sentinel.

In this task, you will update the new playbook with the proper connection information.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

2. Select your Azure Sentinel Workspace.

3. Select the **Playbooks** page.

4. Click on the **Post-Message-Teams** playbook, 

5. On the Logic App page, select **Edit**.

6. Click on the first Connections block.  

7. Select **Add new**, and sign in.

8. Click on the second Connection block.  

9. Select **Add new**, and sign in.

10. Click on the third Connection block.  

11. Select **Add new**, and sign in.

12. In the Post a message block, for the Team, select the **X** at the end of the edit box.  The edit box will be changed to a dropdown with a listing of the Teams.  Select **SOC**.

13. For the Channel, select the **X** at the end of the edit box.  The edit box will be changed to a dropdown with a listing of the Channels.  Select **New Alerts**.

14. Select **Save**.

The Logic App will be used in a future lab.


# Proceed to Exercise 3
