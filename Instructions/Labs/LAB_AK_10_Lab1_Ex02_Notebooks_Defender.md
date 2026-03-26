---
lab:
    title: 'Exercise 2 - Threat Hunting using Notebooks with Microsoft Sentinel in Microsoft Defender XDR'
    module: 'Learning Path 10 - Perform threat hunting in Microsoft Sentinel'
---

# Learning Path 10 - Lab 1 - Exercise 2 - Threat Hunting using Data lake Notebooks in Microsoft Sentinel

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You need to explore the benefits of threat hunting with Microsoft Sentinel Notebooks. You can use notebooks to:

- Perform analytics that aren't provided out-of-the-box in Microsoft Sentinel, such as some Python machine learning features.
- Create data visualizations that aren't provided out-of-the-box in Microsoft Sentinel, such as custom timelines and process trees.
- Integrate data sources outside of Microsoft Sentinel, such as an on-premises data set.

>**Important:** The lab exercises for Learning Path #10 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Task 1: Hunt with Data lake Notebooks

This task explores Notebooks in Microsoft Sentinel Data lake. You will be using Visual Studio Code to access Notebooks, and installing a number of Visual Studio Code extensions.

>**Note:** Visual Studio Code is already installed on the lab VM. Prior experience with Visual Studio Code, Jupyter Notebooks and Python coding is recommended.

1. Expand *Data lake exploration* in Microsoft Sentinel and select **Notebooks**.

1. The *Notebooks* page displays the list of steps to perform to use Data lake Jupyter notebooks, and provides links to available resources.

1. Go to the task bar and select the Visual Studio Code icon.

    >**Note:** Unless specified, always install the *Microsoft* published extensions.

1. Within the left menu bar, select the Extensions icon.

1. Within the search bar of Extensions, search for *Python*, and select **Install**.

1. Within the search bar of Extensions, search for *Jupyter Notebooks*, If not already installed, select **Install**.

1. Within the search bar of Extensions, search for *GitHub Copilot*, and select **Install**.

1. Within the search bar of Extensions, search for *Microsoft Sentinel*, and select **Install**.

1. Wait for all the extensions to finish installing.

1. On your keyboard, select the ctrl+shift+p keys to open the command options within the top bar.

1. Look for **MCP: Add server**, and select that option.

1. Choose the HTTP option and enter the URL: <https://sentinel.microsoft.com/mcp/data-exploration>.

1. Select **Enter** to use the default server ID.

1. A prompt will open to authenticate the server, select **Allow**.

1. For account type, choose the option **Work or school account** Assigned by your organization, and select **Continue**.

1. Enter the credentials that you were given for this lab.

1. Select **Yes, all apps**.

1. Your device will be registered, then select **Done**.

1. If not already open in the Side Bar, select the **Toggle chat** icon on the top menu bar.

    >**Hint:** Next to the search bar, or select the **Ctrl+Shift+I** keys on your keyboard.

1. Enter Copilot prompts such as the following examples:

- Which tables are good to use for hunting malicious activities on devices
- What columns within the SecurityEvent table are good to use in hunting queries
- Query the last 90 days of SecurityEvent data in my workspace, summarize your findings by the top 5 most malicious activities and format the results as a table

1. When prompted to authenticate the MCP server, select **Allow**, and select your lab credentials again.

1. At some point if you have gotten results or suggested queries from the MCP server, try asking it to make you a Notebook with the findings and suggestions.

1. When prompted select **Allow** to create the Notebook.

1. Select **Allow** when prompted to let the **Microsoft Sentinel** extension sign in, and select your lab credentials again

1. Once the Jupyter Notebook is created, review the code cells and markdown cells.

1. To save the Notebook, select **Keep** from the bottom right.

1. Select the **Microsoft Sentinel** *Shield* icon from the left menu bar.

1. In the **LAKE TABLES** section, expand the **defender** table and then expand the **Security & Audits** table.

1. The *SecurityEvent* table schema is displayed.

1. In the **NOTEBOOK SAMPLES** section, expand *Tutorials* and select the **01_GettingStartedwithSentineldatalake** tutorial notebook.

1. Once the Jupyter Notebook is open, review the different tabs, code cells and markdown cells.

>**Note:** If you want to run the code cells, feel free to do so, but it is not required for this lab. The presenters can help time permitting.

## You have completed the lab
