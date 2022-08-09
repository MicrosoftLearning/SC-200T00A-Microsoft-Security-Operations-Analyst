# Module 7 - Threat hunting in Microsoft Sentinel

**Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md). 

## Create a hunting query

In this task, you will create a hunting query, bookmark a result, and create a Livestream.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select **Logs** 

1. Enter the following KQL Statement in the New Query 1 space:

```KQL
let lookback = 2d;
DeviceEvents | where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),"."))
| where c2 startswith "sub"
| summarize count() by bin(TimeGenerated, 3m), c2
| where count_ > 5
| render timechart 
```

1. The goal of this statement is to provide a visualization to check for a C2 beaconing out on a consistent basis.  Take time to adjust the 3m setting to 30s and more.  Change the count_ > 5 setting to other threshold counts to witness the impact.

1. You have now identified DNS requests that are beaconing to a C2 server.  Next, determine which devices are beaconing.  Enter the following KQL Statement:

```KQL
let lookback = 2d;
DeviceEvents | where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),".")) 
| where c2 startswith "sub"
| summarize cnt=count() by bin(TimeGenerated, 5m), c2, DeviceName
| where cnt > 15
```

**Note** The generated log data is only from the onboarded device.

1. Close the *Logs* window by selecting the **X** in the top-right of the window and select **OK** to discard the changes. 

1. Select the **Hunting** page in the Threat Management area of the Microsoft Sentinel portal.

1. Select **New Query** from the command bar.

1. In the *Create custom query* window, for the *Name* type **C2 Hunt**

1. For the *Custom query* enter the following KQL statement:

```KQL
let lookback = 2d;
DeviceEvents | where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),"."))
| where c2 startswith "sub"
| summarize cnt=count() by bin(TimeGenerated, 5m), c2, DeviceName
| where cnt > 15
```

1. Scroll down and under *Entity mapping (Preview)* select:

    - For the *Entity type* drop-down list select **Host**.
    - For the *Identifier* drop-down list select **HostName**.
    - For the *Value* drop-down list select **DeviceName**.

1. Scroll down and under *Tactics & Techniques* select **Command and Control** and then select **Create** to create the hunting query.

1. In the *"Microsoft Sentinel - Hunting"* blade, search for the query you just created in the list, *C2 Hunt*.

1. Select **C2 Hunt** from the list.

1. On the right pane, scroll down and select the **Run Query** button.

1. The number of results is shown in the middle pane under the *Results* column. Alternatively, scroll up to see the count over the *Results* box..

1. Select **View Results**.

1. Select the first row in the results. 

1. Select **Add bookmark**.

1. Select **Create** in the pane that appears.

1. Return to the Hunting page in the Microsoft Sentinel portal.

1. Select the **Bookmarks** tab.

1. Select the bookmark in the results list.

1. Select **Investigate** in the flyout pane.

1. Explore the Investigation graph.

1. Return to the Hunting page in the Microsoft Sentinel portal.

1. Select the **Queries** tab

1. Select the **C2 Hunt** query.

1. Select the **...** at the end of the row to open the context menu.

1. Select **Add to livestream**.