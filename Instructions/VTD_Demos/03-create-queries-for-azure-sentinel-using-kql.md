# Module 3 Create queries for Azure Sentinel using Kusto Query Language (KQL)

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Azure Sentinel. You are responsible for performing log data analysis to search for malicious activity, display visualizations, and perform threat hunting. To query log data, you use the Kusto Query Language (KQL).

### Access the KQL testing area.

In this task, you will access a Log Analytics environment where you can practice writing KQL statements.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. Go to https://aka.ms/lademo in your browser. Login with the MOD Administrator credentials. 

3. Explore the available tables listed in the tab on the left side of the screen.

4. In the query editor, enter the following query and select the Run button.  You should see the query results in the bottom window.

    ```KQL
    SecurityEvent
    ```

5. Next to the first record, select the **>** to expand the information for the row.

### Task 2: Run Basic KQL Statements

In this task, you will build basic KQL statements.

1. The following statement demonstrates the use of the let statement to declare variables. In the Query Window, enter the following statement and select **run**: 


```KQL
let timeOffset = 7d;
let discardEventId = 4688;
SecurityEvent
| where TimeGenerated > ago(timeOffset*2) and TimeGenerated < ago(timeOffset)
| where EventID != discardEventId
```

1. The following statement demonstrates the use of the let statement to declare a dynamic list. In the Query Window enter the following statement and select **run**: 


```KQL
let suspiciousAccounts = datatable(account: string) [
    @"\administrator", 
    @"NT AUTHORITY\SYSTEM"
];
SecurityEvent | where Account in (suspiciousAccounts)
```

1. The following statement demonstrates searching across all tables and columns for records within the query time range display in the query window. In the Query Window before running this script change the Time range to "Last hour". Enter the following statement and select **run**: 

```KQL
search "err"
```

**Warning:** Make sure you change back the Time range to "Last 24 hours" for the next scripts.

### Create visualizations in KQL with the Render Operator

In this task, you will use generate visualizations with KQL statements.

1. The following statement demonstrates the render function visualizing results with a barchart. In the Query Window. Enter the following statement and select **run**: 

```KQL
SecurityEvent 
| summarize count() by Account
| render barchart
```

2. The following statement demonstrates the render function visualizing results with a time series.

The bin() function rounds values down to an integer multiple of the given bin size.  Used frequently in combination with summarize by .... If you have a scattered set of values, the values are grouped into a smaller set of specific values.  Combining the generated time series and pipe to a render operator with a type of timechart provides a time series visualization. In the Query Window. Enter the following statement and select **run**: 

```KQL
SecurityEvent 
| summarize count() by bin(TimeGenerated, 1d) 
| render timechart
```



## You have completed the demo.

