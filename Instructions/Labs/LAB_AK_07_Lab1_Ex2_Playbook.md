---
lab:
    title: 'Exercise 2 - Create a Playbook'
    module: 'Learning Path 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 7 - Lab 1 - Exercise 2 - Create a Playbook

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod7_L1_Ex2.png)

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to detect and mitigate threats using Microsoft Sentinel. Now, you want to respond and reMediate actions that can be run from Microsoft Sentinel as a routine.

With a playbook, you can help automate and orchestrate your threat response, integrate with other systems both internal and external, and can be set to run automatically in response to specific alerts or incidents, when triggered by an analytics rule or an automation rule, respectively. 

>**Note:** An **[interactive lab simulation](https://mslabs.cloudguides.com/guides/SC-200%20Lab%20Simulation%20-%20Create%20a%20playbook)** is available that allows you to click through this lab at your own pace. You may find slight differences between the interactive simulation and the hosted lab, but the core concepts and ideas being demonstrated are the same.

### Task 1: Create a Security Operations Center Team in Microsoft Teams

In this task, you'll create a Microsoft Teams team for use in the lab.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Microsoft Edge browser, open a new tab and navigate to the Microsoft Teams portal at (https://teams.microsoft.com).

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. Close any Teams pop-ups that may appear.

1. If not already selected, select **Teams** on the left menu, then at the top, select the ![plus sign icon](../Media/plus-sign-icon-lab.png) icon.

1. Select the **Create Team** option.

1. Select the **From scratch** button.

1. Select the **Private** button.

1. Give the team the name: type **SOC** and select the **Create** button.

1. In the Add members to SOC screen, select the **Skip** button. 

1. Scroll down the Teams blade to locate the newly created SOC team, select the ellipsis **(...)** on the right side of the name and select **Add channel**.

1. Enter a channel name of *New Alerts* then select the **Add** button.


### Task 2: Create a Playbook in Microsoft Sentinel

In this task, you'll create a Logic App that is used as a Playbook in Microsoft Sentinel.

1. In the Microsoft Edge browser, navigate to [Microsoft Sentinel on GitHub](https://github.com/Azure/Azure-Sentinel).

<!--- the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select the **Community** page under the *Content management* area on the left side of the page.

1. On the right pane, select the **Onboard community content** link. This opens a new tab in the Microsoft Edge Browser for Microsoft Sentinel GitHub content. **Hint:** You might need to scroll right to see the link. Alternatively, follow this link instead: [Microsoft Sentinel on GitHub](https://github.com/Azure/Azure-Sentinel). --->

1. Scroll down and select the **Solutions** folder.

1. Next select the **SentinelSOARessentials** folder, then the **Playbooks** folder.

1. Select the **Post-Message-Teams** folder.

1. In the readme.md box, scroll down to the *Quick Deployment* section, **Deploy with incident trigger (recommended)** and select the **Deploy to Azure** button.  

1. Make sure your Azure Subscription is selected.

1. For Resource Group, select **Create New**, enter *RG-Playbooks* and select **OK**.

1. Leave **(US) East US** as the default value for *Region*.

1. Rename the *Playbook Name* to "PostMessageTeams-OnIncident" and select **Review + create**.

1. Now select **Create**. 

    >**Note:** Wait for the deployment to finish before proceeding to the next task.

### Task 3: Update a Playbook in Microsoft Sentinel

In this task, you'll update the new playbook you created with the proper connection information.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select **Automation** under the *Configuration* area and then select the **Active Playbooks** tab.

1. Select **Refresh** from the command bar in case you don't see any playbooks. You should see the playbook created from the previous step with the **Microsoft Sentinel Incident** *Trigger kind*.

1. Select the **PostMessageTeams-OnIncident** playbook name.

1. On the Logic App page for *PostMessageTeams-OnIncident*, in the command menu, select **Edit**.

    >**Note:** You may need to refresh the page.

1. Select the *first* block, **Microsoft Sentinel incident (Preview)**.

1. Select the **Change connection** link.

1. Select **Add new** and select **Sign in**. In the new window, select your Azure subscription admin credentials when prompted. The last line of the block should now read "Connected to your-admin-username".

1. Now select the *second* block, **Connections**.

1. Select **Add new** and select your Azure admin credentials when prompted. The last line of the block should now read "Connected to your-admin-username".

1. The block has now been renamed to **Post a message (V3)(Preview)**, at the end of the *Team* field, select the **X** to clear the contents. The field is changed to a drop-down with a listing of the available Teams from Microsoft Teams. Select **SOC**.

1. Do the same for the *Channel* field, select the **X** at the end of the field to clear the contents. The field is changed to a drop-down with a listing of the Channels of the SOC Teams. Select **New Alerts**.

1. Select **Save** on the command bar. The Logic App will be used in a future lab.

## Proceed to Exercise 3
