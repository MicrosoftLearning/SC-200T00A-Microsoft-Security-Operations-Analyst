---
lab:
    title: 'Exercise 2 - Threat Hunting using Notebooks with Microsoft Sentinel'
    module: 'Learning Path 10 - Perform threat hunting in Microsoft Sentinel'
---

# Learning Path 10 - Lab 1 - Exercise 2 - Threat Hunting using Notebooks with Microsoft Sentinel

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to explore the benefits of threat hunting with Microsoft Sentinel Notebooks. You can use notebooks to:

- Perform analytics that aren't provided out-of-the-box in Microsoft Sentinel, such as some Python machine learning features.
- Create data visualizations that aren't provided out-of-the-box in Microsoft Sentinel, such as custom timelines and process trees.
- Integrate data sources outside of Microsoft Sentinel, such as an on-premises data set.

>**Important:** The lab exercises for Learning Path #10 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Task 1: Explore Notebooks

In this task, you'll explore using notebooks in Microsoft Sentinel.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **defenderWorkspace**, and the required *Content Hub* solutions have been installed.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Microsoft Edge browser, navigate to the Azure portal at <https://portal.azure.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select the Microsoft Sentinel **defenderWorkspace**.

1. In the Microsoft Sentinel Workspace, select **Notebooks** under the *Threat management* area.

1. Next, you need to create an Azure Machine Learning Workspace. Select **Configure Azure Machine Learning** and then select **Create new Azure ML workspace** button in the command bar.

1. In the Subscription box, select your subscription.

1. Select **Create new** for the Resource group and enter *RG-MachineLearning* for the Name and select **OK**. 

1. In the Workspace details section do the following:

     - Give your workspace a unique name.
     - Leave **East US** as the default value for *Region*.
     - Keep the default Storage account, Key vault, and Application insights information.
     - The Container registry option can remain as **None**.

1. At the bottom of the page, select **Review + create**. When you see the *"Validation passed"* message, select **Create**. 

     >**Note:** It may take a few minutes to deploy the Machine Learning workspace.

1. After *Your deployment is complete* message appears, return to the Microsoft Sentinel portal.

1. Select **Notebooks** again and then select the **Templates** tab from the middle command bar. 

1. Select **A Getting Started Guide for Microsoft Sentinel ML Notebooks**.

1. On the right pane, scroll down and select **Create from template** button. Review the default options and then select **Save**.

1. Once the saving is done, select the **Launch notebook** button. This takes you to the Microsoft Azure Machine Learning studio.

1. Select **Close** if an informational window appears in the Microsoft Azure Machine Learning studio.

1. In the command bar, to the right of the **Compute:**  selector, select the **+** symbol to *Create Azure ML compute* instance. **Hint:** It might be hidden inside the ellipsis icon **(...)**.

     >**Note:** You can have more screen space by hiding the Azure ML Studio left blade by selecting the *Hamburger menu* (3 horizontal lines on the top left), as well as by collapsing the Notebooks Files by selecting the **<<** icon.

1. Type a unique name in the *Compute name* field. This identifies your compute instance.

1. Scroll down and select the first option available. **Hint:** Workload type: Development on Notebooks (or other IDE) and light weight testing.

1. Select the **Review + Create** button at the bottom of the screen, then scroll down and select **Create**. Close any feedback window that may appear. This takes a few minutes, you'll see a notification (bell icon) when it's done and the *Compute instance* left icon turns from blue to green.

1. Once the Compute has been created and running, verify that the kernel to use is *Python 3.10 - Pytorch and Tensorflow*. **Hint:** This is shown in the right of the command bar.

1. Select the **Authenticate** button and wait for the authentication to complete.

1. Clear all the results from the notebook by selecting the **Clear all outputs** (Eraser icon) from the command bar and follow the *Getting Started* tutorial. **Hint:** This can be found by selecting the ellipsis (...) from the command bar.

1. Review section *1 Introdution* in the notebook and proceed to section *2 Initializing the notebook and MSTICPy*.

1. In section *2 Initializing the notebook and MSTICPy*, review the content on initalizing the notebook and installing the MSTICPy package.

1. Run the *Python code* to initialize the cell by selecting the **Run cell** button (Play icon) to the left of the code.

1. It should take approximately 15 seconds to run. Once it's done, review the output messages and disregard any warnings about the Python kernel version. The code ran successfully if *msticpyconfig.yaml* was created in the *utils* folder in the *file explorer* pane on the left. It may take another 30 seconds for the file to appear.

    >**Hint:** You can clear the output messages by selecting the ellipsis (...) on the left of the code window for the *Output menu* and selecting the *Clear output* (square with an x*) icon.

1. Select the **msticpyconfig.yaml** file in the *file explorer* pane on the left to review the contents of the file and then close it.

1. Proceed to section *3 Querying data with MSTICPy* and review the contents. Don't run the *Multiple Microsoft Sentinel workspaces* code cell as it fails, but the other code cells can be run successfully.

>**Note:** If you cannot complete the steps above to access the Notebook, you can follow it on its GitHub viewwer page instead. [Getting Started with Azure ML Notebooks and Microsoft Sentinel](https://nbviewer.org/github/Azure/Azure-Sentinel-Notebooks/blob/master/A%20Getting%20Started%20Guide%20For%20Azure%20Sentinel%20ML%20Notebooks.ipynb) 

## You have completed the lab
