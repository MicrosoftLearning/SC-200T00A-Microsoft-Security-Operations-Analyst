---
lab:
    title: 'Exercise 09 - Create ASIM parsers'
    module: 'Learning Path 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 7 - Lab 1 - Exercise 09 - Deploy ASIM parsers

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to model ASIM parsers for a specific Windows registry event.  These simplified parsers will be finalized at a later time following the ASIM parser registry event normalization standard (https://docs.microsoft.com/en-us/azure/sentinel/registry-event-normalization-schema).


### Task 1: Deploy the Registry Schema ASIM parser. 

In this task, you will deploy the Registry Schema parsers from the Microsoft Sentinel GitHub repository.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select the **Community** page under the *Content management* area on the left side of the page.

1. On the right pane, select the **Onboard community content** link. This will open a new tab in the Edge Browser for Microsoft Sentinel GitHub content. **Hint:** You might need to scroll right to see the link. Alternatively, follow this link instead: [Microsoft Sentinel on GitHub](https://github.com/Azure/Azure-Sentinel).

1. Select the **ASIM** folder. In here, you can deploy a template that contains all ASIM parsers, but we will only focus on the Registry Schema.

1. Scroll down and next to **Registry**, select the **Deploy to Azure** button.

1. For *Resource Group*, select **RG-Defender** where your Sentinel workspace resides.

1. For *Workspace*, type your Sentinel workspace name, like *uniquenameDefender*.

1. Leave the other default values and select **Review + create**.

1. Select **Create** to deploy the template. Notice the Names of the different resources.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select **Logs** under the *General* left menu.

1. Open the *Schema and Filter* blade by selecting **>>** if needed.

1. Select the **Functions** tab (next to the Tables and Queries tabs). **Hint:** You might need to select the ellipsis icon **(...)** to select the tab.

1. Expand **Worspace functions**. Notice that the names correspond to the templates you just deployed.

1. Hover the **vimRegistryEventMicrosoftSecurityEvents** *workspace parser* and then select **Load the function code**.

1. Review the KQL that is parsing the Event ID 4657 to simplifying your analysis of the data in the Microsoft Sentinel workspace.

1. **Run** the query. You should not get any result nor errors, it is just for validation purposes.

1. Go back to the *Schema and Filter* blade and now hover the **inRegistry** *unifying parser* and then select **Load the function code**.

1. Notice that the unifying parsers uses the *union* operator to run all the workspace parsers at once. If you develop a parser for the Registry Schema you will need to add it here.

1. **Run** the query. You should not get any result nor errors, it is just for validation purposes.

1. This unifying parser can now be used for Analytic Rules or Hunting Queries.


## Proceed to Exercise 10

