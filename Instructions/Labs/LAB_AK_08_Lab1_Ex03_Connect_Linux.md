---
lab:
    title: 'Exercise 3 - Connect Linux hosts to Microsoft Sentinel using data connectors'
    module: 'Learning Path 8 - Connect logs to Microsoft Sentinel'
---

# Learning Path 8 - Lab 1 - Exercise 3 - Connect Linux hosts to Microsoft Sentinel using data connectors

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod6_L1_Ex3.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to connect log data from the many data sources in your organization. This includes data sources from Linux virtual machines using the Common Event Format (CEF) via AMA and Syslog via Legacy Agent data connectors.

>**Important:** The lab exercises for Learning Path #8 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

>**Important:** There are steps within the next Tasks that are done in different virtual machines. Look for the Virtual Machine name references.

### Task 1: Access the Microsoft Sentinel Workspace

In this task, you will access your Microsoft Sentinel workspace.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **defenderWorkspace**, and the required *Content Hub* solutions have been installed.

1. Log in to **WIN1** virtual machine as Admin with the password: **Pa55w.rd**.  

1. Start the Microsoft Edge browser.

1. In the Edge browser, navigate to the Azure portal at <https://portal.azure.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select the Microsoft Sentinel **defenderWorkspace**.

### Task 2: Connect a Linux Host using the Common Event Format connector

In this task, you will connect a Linux host to Microsoft Sentinel with the Common Event Format (CEF) via AMA data connector. You will also create a Data Collection Rule (DCR) to collect the events. Azure Arc was pre-installed on this Linux host as required for creating a DCR.

1. Launch your **LIN1** virtual machine. Login with the username and password provided by your lab hoster. **Hint:** You might need to press the Enter key to see the login prompt, and it is a good idea to write down the *Username and Password*.

1. Note the IP address for your LIN1 server. See the screenshot below as an example:

    ![linux login](../Media/LinuxLoginExample.png)

1. Go back to the **WIN1** virtual machine. Start the Microsoft Edge browser.

1. Launch Windows PowerShell by typing **Windows PowerShell** in the Search form in the Taskbar, and then select **Windows PowerShell**.

1. Enter the following PowerShell command, adjusting for your specific Linux server information, and press enter:

    ```PowerShell
    ssh insert-your-linux-IP-address-here -l insert-linux-user-name-here
    ```

1. Enter *yes* to confirm the connection and then type the user's password and press enter. Your screen should look something like this:

    ![linux login](../Media/PSconnectLinux.png)

1. In the SSH session, at the linux prompt, type the following command. *Do not press enter*:

    ```cmd
    azcmagent connect -g "RG-AZWIN01" -l "EastUS" -s "Subscription ID string"
    ```

1. Replace the **Subscription ID string** with the *Subscription ID* provided by your lab hoster (*Resources tab). Make sure to keep the quotes.

1. Type **Enter** to run the command (this may take a couple minutes).

1. In the *To sign in, use a web browser to open the page <https://microsoft.com/devicelogin> and enter the code* message, Ctrl+Click the link to open the device login page. Copy the code provided and paste it into the *Enter code to allow access* box and select **Next**.

    ![Linux azcmagent device login](../Media/device-login.png)

1. In the *Pick an account* dialog box, select your **Tenant Email** provided by your lab hosting provider. Wait for the *Authentication complete* message, close the browser tab and return to the *Command Prompt* window. Or, if you see the *Sign in* dialog box, enter your **Tenant Email** and **Tenant Password** provided by your lab hosting provider and select **Sign in**. Wait for the *Authentication complete* message, close the browser tab and return to the *Command Prompt* window.

1. When the commands complete running, leave the *Command Prompt* window open and type the following command to confirm that the connection was successful:

    ```cmd
    azcmagent show
    ```

1. In the command output, verify that *Agent status* is **Connected**. Do not close the *PowerShell Command Prompt* window yet.

1. Start the Microsoft Edge browser.

1. In the Edge browser, navigate to the Azure portal at <https://portal.azure.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select the Microsoft Sentinel **defenderWorkspace**.

1. In the Microsoft Sentinel left navigation menu, scroll down to the *Content management* section and select **Content Hub**.

1. In the *Content hub*, search for the **Common Event Format** solution and select it from the list.

1. On the *Common Event Format* solution page select **Manage**.

    >**Note:** The *Common Event Format* solution installs both the *Common Events Format (CEF) via AMA* and the *Common Events Format (CEF) via Legacy Agent* Data connectors.

1. Select the *Common Events Format (CEF) via AMA* Data connector, and select **Open connector page** on the connector information blade.

1. In the *Configuration* section, select the **+Create data collection rule** button.

1. On the *Create data collection rule* page, *Basic* tab, enter **AZLINDCR** for Rule Name, then select **Next: Resources**.

1. On the *Resources* tab, expand your *MOC Subscription* under *Scope*.

    >**Hint:** You can expand the whole *Scope* hierarchy by selecting the ">" before the *Scope* column.

1. Expand **defender-RG**, then select **LIN1**.

    >**Note:** You're *LIN1* virtual machine may appear with a different name, like ubuntuxxx.

1. Select **Next: Collect**. In the *Collect* tab, select the  *LOG_ALERT* drop-down menu, and select **LOG_WARNING**.

1. Select **Next: Review + create**, and select **Create**. Wait for the deployment to finish.

    >**Note:** You may need to refresh the page.

1. The *Common Event Format (CEF) via AMA* Data connector should now show **Connected**.

1. The data collection rule installs the Azure Monitor Agent (AMA), and the The *CEF collector* install commands were pre-deployed on the LIN1 machine to install the CEF collector.

1. Return to the *PowerShell Command Prompt* window. You should still be connected to the LIN1 virtual machine.

1. At the linux prompt, type the following command, and press enter:

    ```cmd
    netstat -lnptv
    ```

1. You should see the rsyslog (or syslog-ng) daemon listening on port 514.

    >**Note:** You can query the *CommonSecurityLog* table for CEF events.

1. Type **exit** to close the remote shell connection to LIN1.

### Task 3: Connect a Linux host using the Syslog connector

In this task, you will connect a Linux host to Microsoft Sentinel with the Syslog connector.

1. Go back to the Microsoft Edge browser where you have your Microsoft Sentinel Portal open and close the "Common Event Format (CEF) via AMA" data connector page by selecting the 'x' in the top right corner.

1. In the Microsoft Sentinel left menus, scroll down to the *Content management* section and select **Content Hub**.

1. In the *Content hub*, search for the **Syslog** solution and select it from the list.

1. On the *Syslog* solution page select **Manage**.

    >**Note:** The *Syslog* solution installs two *Syslog* Data connector, 7 Analytics rules, 9 Hunting queries, 2 Parsers and 21 Workbooks.

1. Select the *Syslog via Legacy Agent* Data connector, and select **Open connector page** on the connector information blade

1. In the *Configuration* section, expand **Install agent on a non-Azure Linux Machine**.

1. Select the link for **Download & install agent for non-Azure Linux machine**.

    >**Note:** Your Log Analytics workspace should show *2 Windows computers connected*. This corresponds to WINServer and AZWIN01 virtual machines connected earlier.

1. Select the tab for **Linux servers**.

    >**Note:** Your Log Analytics workspace should show *1 Linux computers connected*. This corresponds to LIN1 (ubuntu1) virtual machine connected earlier with the CEF connector.

1. Select **Log Analytics agent instructions**.

1. Copy the command in the *Download and onboard agent for Linux* area to the clipboard.

1. Launch your LIN2 virtual machine. Login with the username as password provided by your lab hoster. **Hint:** You might need to press the Enter key to see the login prompt.

1. Note the IP address for your LIN2 server. See the screenshot below as an example:

    ![linux login](../Media/LinuxLoginExample.png)

1. Go back to the **WIN1** virtual machine. Select the Windows PowerShell used in the previous task.

1. Enter the following PowerShell command, adjusting for your specific Linux server information, and press enter:

    ```PowerShell
    ssh insert-your-linux-IP-address-here -l insert-linux-user-name-here
    ```

1. Enter *yes* to confirm the connection and then type the user's password and press enter. Your screen should look something like this:

    ![linux login](../Media/PSconnectLinux.png)

1. You are now ready to paste the *Download and onboard agent for Linux* command from the earlier step. Make sure that script is in the clipboard. In PowerShell right-click the top bar and choose **Edit** and then **Paste**.

1. Once the script is pasted, press Enter. The script will run against your Linux server remotely. Wait

1. When it finished, type **exit** to close the remote shell connection to LIN2.

### Task 4: Configure the facilities you want to collect and their severities for the Syslog connector

In this task, you will configure the Syslog collection facilities.

1. Go back to the Edge browser where you have your Microsoft Sentinel Portal open and close the "Log Analytics workspace" page and the "Syslog" data connector page by selecting the 'x' in the top right corner twice.

1. In Microsoft Sentinel portal, select **Settings** under *Configuration* and then the **Workspace settings** tab.

1. Select **Legacy agents management** under the *Classic* area.

1. Select the **Syslog** tab.

1. Select the **+ Add facility** button.

1. Select **auth** from the drop-down menu for *Facility name*.

1. Select the **+ Add facility** button again.

1. Select **syslog** from the drop-down menu for *Facility name*.

1. Select **Apply** to save your changes.

## Proceed to Exercise 4
