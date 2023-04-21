 **Do not use. Temporarily not operational.**

# Learning Path 6 - Lab 1 - Exercise 04 - Connect Threat intelligence to Microsoft Sentinel using data connectors

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod6_L1_Ex4.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to connect log data from the many data sources in your organization. Finally, you connect a threat intelligence feed to enhance your ability to detect and prioritize known threats.

### Task 1: Connect Threat intelligence

In this task, you will connect a Threat intelligence provider with the Threat intelligence - TAXII connector.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at (<https://portal.azure.com>).

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. From the Data Connectors tab, search for the **Threat intelligence - TAXII** connector.

1. Select **Open connector page** on the connector information blade.

1. Under the *Configuration* area, in the **Friendly name (for server)** field, enter *PhishURLs*

1. For the API root URL enter <https://limo.anomali.com/api/v1/taxii2/feeds/>

1. Enter **107** for the Collection ID.

1. Enter **guest** for username.

1. Enter **guest** for the password.

1. Now select the **Add** button.  Phishing URLs will be pulled and populate the ThreatIntelligenceIndicator table.

>**Note:** If you want to add another collection, open <https://limo.anomali.com/api/v1/taxii2/feeds/collections/> in the Edge Browser, and use the guest username and password to review the different IDs available.

## You have completed the lab
