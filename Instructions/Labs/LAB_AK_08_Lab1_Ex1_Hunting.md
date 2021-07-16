# Module 8 - Lab 1 - Exercise 1 - Perform Threat Hunting in Azure Sentinel

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Azure Sentinel. You have received threat intelligence about a Command and Control (C2) technique.  You need to perform a hunt and watch for the threat.

**Note** The log data used in the lab was created in a previous module in the course.  

**Note**  Because you already experienced the process of exploring data in a previous module, the lab provides a KQL statement to start with.  

### Task 1: Create a hunting query

In this task, you will create a hunting query, bookmark a result, and create a Livestream.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace.

7. Select **Logs** 

8. Enter the following KQL Statement in the New Query 1 space:

```KQL
let lookback = 2d;
DeviceEvents
| where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),"."))
| where c2 startswith "sub"
| summarize count() by bin(TimeGenerated, 3m), c2
| where count_ > 5
| render timechart 
```

9. The goal of this statement is to provide a visualization to check for a C2 beaconing out on a consistent basis.  Take time to adjust the 3m setting to 30s and more.  Change the count_ > 5 setting to other threshold counts to witness the impact.

10. You have now identified DNS requests that are beaconing to a C2 server.  Next, determine which devices are beaconing.  Enter the following KQL Statement:

```KQL
let lookback = 2d;
DeviceEvents
| where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),"."))
| where c2 startswith "sub"
| summarize cnt=count() by bin(TimeGenerated, 5m), c2, DeviceName
| where cnt > 15
```

**Note** The generate log data is only from one device.

11. Select the **Hunting** page in the Threat Management area of the Azure Sentinel portal.

12. Select **New Query** from the command bar.

13. For the Query enter the following KQL statement:

```KQL
let lookback = 2d;
DeviceEvents
| where TimeGenerated >= ago(lookback) 
| where ActionType == "DnsQueryResponse"
| extend c2 = substring(tostring(AdditionalFields.DnsQueryString),0,indexof(tostring(AdditionalFields.DnsQueryString),"."))
| where c2 startswith "sub"
| summarize cnt=count() by bin(TimeGenerated, 5m), c2, DeviceName
| where cnt > 15
```

14. For the Name enter type *C2 Hunt*

15. For the Entity Mapping enter:

    For the Host select **DeviceName** and then select **Add**.
    For the Timestamp select **TimeGenerated** and then select **Add**.

16. Select **Create**.

17. In the Azure Sentinel | Hunting blade search for the query you just created in the list, *C2 Hunt*.

18. Select **C2 Hunt** in the list.

19.  Select the **Run Query** button on the right side of the page.

20. The result count is displayed at the top of the flyout.

21. Select **View Results**.

22. Select the first row in the results. 

23. Select **Add bookmark**.

24. Select **Create** in the pane that appears.

25. Return to the Hunting page in the Azure Sentinel portal.

26. Select the **Bookmarks** tab.

27. Select the bookmark in the results list.

28. Select **Investigate** in the flyout pane.

29. Explore the Investigation graph.

30. Return to the Hunting page in the Azure Sentinel portal.

31. Select the **Queries** tab

32. Select the **C2 Hunt** query.

33. Select the **...** at the end of the row to open the context menu.

34. Select **Add to livestream**.

# Proceed to Exercise 2
