# Module 7 - Lab 1 - Exercise 2 - Create a Playbook

### Task 1: Create a Security Operations Center Team in Microsoft Teams.

In this task, you will create a Microsoft Teams team for use in the lab.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the Microsoft Teams App.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. Select No, sign in to this app only.

6. Select **Teams**, then at the bottom, select **Join or create a team**.

7. Select **Create a Team** in the main window.

8. Select **From scratch**.

9. Select **Private**.

10. Give the team the name: **SOC**

11. Select **Skip**. 

12. Click the **...** next to the team name SOC.  Then select **Add Channel**.

13. Enter a channel name of *New Alerts* then select **Add**.

### Task 2: Create a Playbook in Azure Sentinel.

In this task, you will create a Logic App that will be used as a Playbook in Azure Sentinel.

1.  In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

2. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

3. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.


4. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

5. Select your Azure Sentinel Workspace.

6. Select the **Playbooks** page.

7. Review the current list of Playbooks. If any.

8. Select the **Community** page in the Configuration area on the left side of the page.

9. Select the **Go to Azure Sentinel community** button.

10. Select the **Playbooks** folder.

11. Select the **Post-Message-Teams** folder.

12. Select **Deploy to Azure**.

13. Select your Azure Subscription.

14. For Resource Group, select **Create New** and enter *rg-Playbooks*.

15. For region, select **East US 2**

16. For User Name, enter the user name **Tenant Email**

17. Select **Review + create**.

18. Now select **create**.

**Note** Wait for the deployment to finish.

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
