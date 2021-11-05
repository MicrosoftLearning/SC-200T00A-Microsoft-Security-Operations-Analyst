# Module 6 - Lab 1 - Exercise 4 - Connect Threat intelligence to Azure Sentinel using data connectors

### Task 1: Connect Threat intelligence.

In this task, you will connect a Threat intelligence provider with the Threat intelligence - TAXII connector.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at (https://portal.azure.com).

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace you created earlier.

7. From the Data Connectors tab, select the **Threat intelligence - TAXII** connector.

8. Select **Open connector page** on the connector information blade.

9. In the Configuration area, for the **Friendly name (for server)** enter *PhishURLs*

10. For the API root URL enter https://limo.anomali.com/api/v1/taxii2/feeds/

11. Enter **107** for the Collection ID.

12. Enter **guest** for username.

13. Enter **guest** for the password.

14. Now select **Add** button.  

Phishing URLs will be pulled and populate the ThreatIntelligenceIndicator table.

**Note:** For additional collections open https://limo.anomali.com/api/v1/taxii2/feeds/collections/ in a Browser, use the guest username and password to review the different Collection IDs available.

## You have completed the lab.