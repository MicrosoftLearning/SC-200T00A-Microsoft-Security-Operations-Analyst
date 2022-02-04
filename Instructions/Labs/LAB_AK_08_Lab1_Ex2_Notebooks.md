---
lab:
    title: 'Exercise 2 - Threat Hunting using Notebooks with Microsoft Sentinel'
    module: 'Module 8 - Perform threat hunting in Microsoft Sentinel'
---

# Module 8 - Lab 1 - Exercise 2 - Threat Hunting using Notebooks with Microsoft Sentinel

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to explore the benefits of threat hunting with Microsoft Sentinel Notebooks. You can use notebooks to:

- Perform analytics that are not provided out-of-the box in Microsoft Sentinel, such as some Python machine learning features.
- Create data visualizations that are not provided out-of-the box in Microsoft Sentinel, such as custom timelines and process trees.
- Integrate data sources outside of Microsoft Sentinel, such as an on-premises data set.


### Task 1: Explore Notebooks

In this task, you will explore using notebooks in Microsoft Sentinel.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. In the Microsoft Sentinel Workspace, select **Notebooks**.

1. Next, you need to create an AzureML Workspace. Select **Configure Azure Machine Learning** and then select **Create new Azure ML workspace** button in the command bar.

1. In the Subscription box, select your subscription.

1. Select **Create new** for the Resource group and enter *RG-MachineLearning* for the Name and select **OK**. 

1. In the Workspace details section do the following:

    - Give your workspace a unique name.
    - Choose your Region (or leave the default if reasonable)
    - Keep the default Storage account, Key vault, and Application insights information.
    - The Container registry option can remain as **None**.

1. At the bottom of the page, select **Review + create**. When you see the *"Validation passed"* message, select **Create**. 

    >**Note:** It may take a few minutes to deploy the Machine Learning workspace.

1. After *Your the deployment is complete* message appears, return to the Microsoft Sentinel portal.

1. Select **Notebooks** and then select the **Templates** tab from the middle command bar. 

1. Select **A Getting Started Guide for Microsoft Sentinel ML Notebooks**. 

1. On the right pane, scroll down and select **Clone notebook template** button. Review the default option and select **Save**.

1. Once the saving is done, select the **Launch notebook** button. This will take you to the Microsoft Azure Machine Learning Studio.

1. Select **Close** if an informational window appears in the Microsoft Azure Machine Learning Studio.

1. In the command bar, to the right of the **Compute:** instance selector, select the **+** symbol to create a new compute instance.

1. Type a unique name in the *Compute name* field. This will identify you compute instance.

1. Scroll down and select the first option available. **Hint:** Workload type: Development on Notebooks and light weight testing.

1. Select the **Create** button at the bottom of the screen. Close any feedback window that may appear. This will take a few minutes, you will see a notification (bell icon) when it is done.

1. Once the Compute has been created and running, verify that the kernel to use is *Python 3.8 - AzureML*. **Hint:** This is shown in the right of the command bar. You can also increase your screen size by selecting **<<** under the *Notebooks* menu.

1. Clear all the results from the notebook by selecting the **eraser** icon from the command bar and follow the *Getting Started* tutorial.

>**Note:** If you cannot complete the steps above to access the Notebook, you can follow it on its GitHub page instead. See the notebook file here: [Microsoft Sentinel Notebooks on GitHub](https://github.com/Azure/Azure-Sentinel-Notebooks/blob/8122bca32387d60a8ee9c058ead9d3ab8f4d61e6/A%20Getting%20Started%20Guide%20For%20Azure%20Sentinel%20ML%20Notebooks.ipynb) 

## You have completed the lab.
