# Module 6 - Lab 1 - Exercise 1 - Connect data to Azure Sentinel using data connectors

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Azure Sentinel. You must learn how to connect log data from the many data sources in your organization. The organization has data from Microsoft 365, Microsoft 365 Defender, Azure resources, non-azure virtual machines, and network appliances.

You plan on using the Azure Sentinel data connectors to integrate the log data from the various sources. You need to write a connector plan for management that maps each of the organization's data sources to the proper Azure Sentinel data connector.

**Important Warning!**  The Virtual Machine WIN1 and WIN2 are used in Module 7.  Save your virtual machines.   If you exit the lab without saving, you will be required to install the connectors again on WIN1 and WIN2.

### Task 1: Access the Azure Sentinel Workspace.

In this task, you will access your Azure Sentinel workspace.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Open the browser, search for, download, and install the new Microsoft Edge browser if you have not already done so. Start the new Edge browser.

3. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

4. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

5. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

6. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

7. Select your Azure Sentinel Workspace that you created in the previous lab.

### Task 2: Connect the Azure Active Directory connector.

In this task, you will connect the Azure Active Directory connector.

1. In the Configuration area select **Data connectors**.  In the Data Connectors page, select the **Azure Active Directory** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Select the **Sign-in Logs** and **Audit Logs** options from the Configuration area, then select **Apply Changes**.

### Task 3: Connect the Azure Active Directory Identity Protection connector.

In this task, you will connect the Azure Active Directory Identity Protection connector.

1. From the Data Connectors Tab, select the **Azure Active Directory Identity Protection** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. From the Configuration area select the **Connect** button.

### Task 4: Connect the Azure Defender connector.

In this task, you will review the Azure Defender connector.

1. From the Data Connectors tab, select the **Azure Defender** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Review the Connecting Options. Don't connect. This is for informational purposes only.

### Task 5: Connect the Microsoft Cloud App Security connector.

In this task, you will connect the Microsoft Cloud App Security connector.

1. From the Data Connectors Tab, select the **Microsoft Cloud App Security** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Select **Alerts** and then select **Apply Changes**.

### Task 6: Connect the Microsoft Defender for Office 365 connector.

In this task, you will connect the Microsoft Defender for Office 365 connector.

1. From the Data Connectors tab, select the **Microsoft Defender for Office 365** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. In the Configuration area select **Connect**.

### Task 7: Connect the Microsoft Defender for Identity connector.

In this task, you will review the Microsoft Defender for Identity connector.

1. From the Data Connectors Tab, select the **Microsoft Defender for Identity** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Review the Connecting Options. Don't connect. This is for informational purposes only.

### Task 8: Connect the Microsoft Defender for Endpoint connector.

In this task, you will connect the Microsoft Defender for Endpoint connector.

1. From the Data Connectors Tab, select the **Microsoft Defender for Endpoint** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. In the Configuration area select **Connect**.

### Task 9: Connect the Microsoft 365 Defender connector.

In this task, you will connect the Microsoft 365 Defender connector.

1. From the Data Connectors Tab, select the **Microsoft 365 Defender** connector from the list.

2. Select **Open connector page** on the connector information blade.

3. Select all the checkboxes for Microsoft Defender for Endpoint.

4. Select **Apply Changes**.

## Proceed to Exercise 2
