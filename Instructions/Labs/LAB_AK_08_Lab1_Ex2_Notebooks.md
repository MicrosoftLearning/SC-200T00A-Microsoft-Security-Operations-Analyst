# Module 8 - Lab 1 - Exercise 2 - Threat Hunting using Notebooks with Azure Sentinel

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Azure Sentinel. You need to explore the benefits of threat hunting with Azure Sentinel Notebooks.

### Task 1: Explore Notebooks

In this task, you will explore using notebooks in Azure Sentinel.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace.

7. In the Azure Sentinel Workspace, select **Notebooks**.

8. Next, you need to select an AzureML Workspace. Select **Configure Azure Machine Learning** and then select  **Create new Azure ML workspace** button in the command bar.

9. In the Subscription box, select your subscription.

10. Select **Create new** for the Resource group and enter *RG-MachineLearning* for the Name and select **OK**. 

11.	In the Workspace details section do the following:
- Give your workspace a unique name.
- Choose your Region (it should default with a reasonable option)
- Keep the default Storage account, Key vault, and Application insights information.
- The Container registry option can remain as **None**.

12.	At the bottom of the page, select **Review + create**. Then on the next page, select **Create**. 

**Note:** It may take a few moments to deploy the Machine Learning workspace. 

13.	After the deployment is finished, return to the Azure Sentinel portal.

14. Select **Notebooks** and then select the **Templates** tab. 

15. Select **A Getting Started Guide for Microsoft Sentinel ML Notebooks**, then select **Clone notebook template** button. In the pop-up for the name of your notebook use the default name and select **Save**.

16. Select the **Launch notebook** button. Close any window that may appear in the Microsoft Azure Machine Learning Studio.

17.	Next to the **Compute:** instance selector at the top of the screen, select the **+** symbol for **New Compute**.

18.	Type a unique name for the *Compute name* and select the first compute available since this is a lab environment. **Hint:** Workload type: Development.

19.	Select the **Create** button at the bottom of the screen. Close any feedback window that may appear. This will take a few minutes.

20.	Once the Compute has been created and running, in the top right of the notebook, verify that the kernel to use is *Python 3.8 - AzureML*.

21. Clear all the results from the notebook by selecting the **eraser** icon from the command bar and follow the Getting Started tutorial.

**Note** If you cannot complete the steps above to access the notebook, you can view it on its GitHub page instead.  See the notebook file here: [Azure Sentinal Notebooks on GitHub](https://github.com/Azure/Azure-Sentinel-Notebooks/blob/8122bca32387d60a8ee9c058ead9d3ab8f4d61e6/A%20Getting%20Started%20Guide%20For%20Azure%20Sentinel%20ML%20Notebooks.ipynb) 

## You have completed the lab.
