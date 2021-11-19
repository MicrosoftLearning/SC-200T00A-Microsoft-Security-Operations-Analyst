---
lab:
    title: 'Exercise 3 - Connect Linux hosts to Azure Sentinel using data connectors'
    module: 'Module 6 - Connect logs to Azure Sentinel'
---

# Module 6 - Lab 1 - Exercise 3 - Connect Linux hosts to Azure Sentinel using data connectors


### Task 1: Access the Azure Sentinel Workspace.

In this task, you will access your Azure Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Start the Microsoft Edge browser.

3. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select your Azure Sentinel Workspace you created in a previous lab.


### Task 2: Connect a Linux Host using the Common Event Format connector.

In this task, you will connect a Linux host to Azure Sentinel with the Common Event Format (CEF) connector.

1. Select **Data connectors** from the Configuration area in Azure Sentinel.  From the Data Connectors tab, search for the **Common Event Format (CEF)** connector and select it from the list.

2. Select **Open connector page** on the connector information blade.

3. Copy to the clipboard the command shown in *1.2 Install the CEF collector on the Linux machine*.

4. Launch your LIN1 virtual machine and login with the username and password provided by your lab hoster. Note the IP address for your LIN1 server. See the screenshot below as an example:

   ![linux login](../Media/LinuxLoginExample.png)

5. Go back to the WIN1 virtual machine and launch Windows PowerShell as Administrator by right-clicking the Start menu icon and select **Windows PowerShell (Admin)**. Select **Yes** to allow the app to run in the User Account Control window that appears.

6. Enter the following PowerShell command, adjusting for your specific Linux server information, and press enter:

```PowerShell
ssh <insert your linux IP address here> -l <insert linux user name here>
```

7. Enter *yes* to confirm the connection and then type the user's password and press enter. Your screen should look something like this:

   ![linux login](../Media/PSconnectLinux.png)

8. You are now ready to paste in the *1.2 Install the CEF collector on the Linux machine* from the earlier step. Make sure that script from Azure is in the clipboard. In PowerShell right-click the top bar and choose **Edit** and then **Paste**. Once pasted add a **3** to the word *python* as shown below:

   ![ConnectorScript](../Media/ConnectorScript.png)


9. Once the script is pasted in and adjusted press enter. The script will run against your Linux server remotely. When the script processes properly it should look similar to this screen:

   ![ConnectorScript](../Media/LinuxConnected.png)


### Task 3: Connect a Linux host using the Syslog connector.

In this task, you will connect a Linux host to Azure Sentinel with the Syslog connector.

1. Connect to WIN1, which should already be in the Azure Sentinel portal for your workspace.  

2. From the Data Connectors tab, search for the **Syslog** connector and select it from the list.

3. Select **Open connector page** on the connector information blade.

4. Open the **Install agent on a non-Azure Linux Machine** section.

5. Select the link for **Download & install agent for non-Azure Linux machine**. 

6. Select the tab for **Linux servers**.

7. Copy the command in the *Download and onboard agent for Linux* area to the clipboard.

8. Launch your LIN2 virtual machine and login with the username as password provided by your lab hoster. Note the IP address for your LIN2 server. See the screenshot below as an example:

   ![linux login](../Media/LinuxLoginExample.png)

9. Go back to the WIN1 virtual machine and launch a NEW Windows PowerShell as Administrator by right-clicking the Start menu icon and select **Windows PowerShell (Admin)**. Select **Yes** to allow the app to run in the User Account Control window that appears.

   >**Note:** You can reuse the Windows PowerShell window if the *Installation completed* for the last task by entering *exit* to close the connection to LIN1.

10. Enter the following PowerShell command, adjusting for your specific Linux server information, and press enter:

```PowerShell
ssh <insert your linux IP address here> -l <insert linux user name here>
```

11. Enter *yes* to confirm the connection and then type the user's password and press enter. Your screen should look something like this:

   ![linux login](../Media/PSconnectLinux.png)

12. You are now ready to paste in the *Download and onboard agent for Linux* from the earlier step. Make sure that script from Azure is in the clipboard. In PowerShell right-click the top bar and choose **Edit** and then **Paste**.

13. Once the script is pasted in press enter. The script will run against your Linux server remotely. You have completed the task. No further labs in this course rely on this connection.


### Task 4: Configure the facilities you want to collect and their severities for the Syslog connector.

In this task, you will configure the Syslog collection facilities.

1. Connect to WIN1 virtual machine.

2. In Azure Sentinel portal, select **Settings** and then **Workspace settings** from the settings blade.

3. Select **Agents configuration** from the **Settings** area.

4. Select the **Syslog** tab.

5. Select the **+ Add facility** button.

6. Select **auth** from the drop-down menu for *Facility name*.

7. Select the **+ Add facility** button again.

8. Select **authpriv** from the drop-down menu for *Facility name*.

9. Select **Apply**.  You have completed this task.

## Proceed to Exercise 4
