# Module 6 - Lab 1 - Exercise 3 - Connect Linux hosts to Azure Sentinel using data connectors

### Task 1: Access the Azure Sentinel Workspace.

In this task, you will access your Azure Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the browser, search for, download, and install the new Microsoft Edge browser if you have not already done so. Start the new Edge browser.

3. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select your Azure Sentinel Workspace you created in a previous lab.

### Task 2: Connect a Linux Host using the Common Event Format connector.

In this task, you will connect a Linux host to Azure Sentinel with the Common Event Format (CEF) connector.

1. Select **Data connectors** from the Configuration area in Azure Sentinel.  From the Data Connectors tab, select the **Common Event Format** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Copy to the clipboard the command shown in *1.2 Install the CEF collector on the Linux machine*.

4. The next steps are specific to limitations in copying from a virtual machine in the lab environment. In the browser, navigate to https://outlook.office.com.

5. Create a New Message to *MOD Administrator*.

6. Paste the clipboard command that was copied from the connector page and send the email message.

7. Open an InPrivate browser session on your local (not a lab virtual machine) and navigate to https://outlook.office.com.

8. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

9. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

10. Copy the command that you emailed to yourself.

11. Log in to LIN1 virtual machine as root with the password: **Passw0rd!** or whatever Linux machine credentials your lab provider has assembled for you.

12. Paste the command in the terminal window.

13. In the command, where you see the word "python" change it to "python3" and press enter to execute the command.

### Task 3: Connect a Linux host using the Syslog connector.

In this task, you will connect a Linux host to Azure Sentinel with the Syslog connector.

1. Connect to WIN1, which should already be in the Azure Sentinel portal for your workspace.  

2. From the Data Connectors tab, select the **Syslog** connector from the list.

3. Select **Open connector page** on the connector information blade.

4. Open the **Install agent on a non-Azure Linux Machine** section.

5. Select the link for **Download & install agent for non-Azure Linux machine**. 

6. Select the tab for **Linux servers**.

7. Copy the command in the *Download and onboard agent for Linux* area to the clipboard.

8. The next steps are specific to limitations in copying from a Virtual Machine in the lab environment. In the browser, navigate to https://outlook.office.com.

9. Create a New Message to *MOD Administrator*.

10. Paste the clipboard command that was copied from the connector page into the body of the email message and send it to yourself.

11. Open a browser on your local (not a lab virtual machine) and navigate to https://outlook.office.com.

12. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

13. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

14. Copy the command that you emailed to yourself.

15. Log in to LIN2 virtual machine as user *root* with the password: **Passw0rd!** or whatever Linux machine credentials your lab provider has assembled for you.  

16. Paste the command in the terminal window and press **enter**.  You have completed the task. No further labs in this course rely on this connection.

### Task 4: Configure the facilities you want to collect and their severities for the Syslog connector.

In this task, you will configure the Syslog collection facilities.

1. Connect to WIN1 virtual machine.

2. In Azure Sentinel portal, select **Settings** and then **Workspace settings** from the settings blade.

3. Select **Agents configuration** from the **Settings** area.

4. Select the **Syslog** tab.

5. Select the **+ Add facility** button.

6. Select **auth** from the drop-down menu for *Facility name*.

7. Select the **Add facility** button.

8. Enter *authpriv* from the drop-down menu for *Facility name*.

9. Select **Apply**.  You have completed this task.

## Proceed to Exercise 4
