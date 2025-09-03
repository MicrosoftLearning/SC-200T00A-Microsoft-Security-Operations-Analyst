# Module 4 Create queries for Microsoft Sentinel using Kusto Query Language (KQL)

<!--- **Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md). --->

>**Important:** We recommend performing the queries for this lab in the Zava (formerly Alpine Ski House) demo environment. The alternative is to use the SC-200 lab environment with Lab 06 - [Create queries for Microsoft Sentinel using Kusto Query Language (KQL)](https://microsoftlearning.github.io/SC-200T00A-Microsoft-Security-Operations-Analyst/Instructions/Labs/LAB_AK_06_Lab1_Ex01_KQL.html/). The latter require 30 minutes of deployment time.

## Access the KQL testing area

In this task, you will access a Microsoft Sentinel Log Analytics environment where you can practice writing KQL statements.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Go to <https://security.microsoft.com> in your browser. Login with the Zava or Alpine Ski House user credentials.

1. Expand the  **Investigation & response** section in the left navigation pane.

1. Expand the **Hunting** section, and select **Advanced hunting**.

1. Explore the available tables listed in the *Schema* tab on the left side of the screen. Note the *Microsoft Sentinel* tables, and the *Security and Audit* tables.

1. In the query editor, enter the following query and select the Run button.  You should see the query results in the bottom window.

    ```KQL
    SecurityEvent
    ```

1. Next to the first record, select the **>** to expand the information for the row.

### Task 2: Run Basic KQL Statements

In this task, you will build basic KQL statements.

1. The `search` operator provides a multi-table/multi-column search experience. The following queries demonstrates the use of the`search` operator.

    > **Note:** The `search` operator is resource-intensive. Limit the *Time range* to *Last 3 hours*, and use *limit | 100*.

```KQL
search "err" 

search in (SecurityEvent,SecurityAlert,A*) "err"
```

1. The `where` operator filters a table to the subset of rows that satisfy a predicate. The following queries demonstrates the use of the`where` operator.

```KQL
SecurityEvent | where EventID in (4624, 4625)

SecurityEvent 
| where TimeGenerated > ago(1d) 

SecurityEvent 
| where TimeGenerated > ago(1h) and EventID == "4624" 

SecurityEvent 
| where TimeGenerated > ago(1h) 
| where EventID == 4624 
| where AccountType =~ "user" 
```

1. The following statement demonstrates the use of the `let` statement to declare variables. In the Query Window, enter the following statement and select **run**: 

```KQL
let timeOffset = 7d;
let discardEventId = 4688;
SecurityEvent
| where TimeGenerated > ago(timeOffset*2) and TimeGenerated < ago(timeOffset)
| where EventID != discardEventId
```

1. The following statement demonstrates the use of the `let` statement to declare a dynamic list. In the Query Window enter the following statement and select **run**: 

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

1. The following statement demonstrates the render function visualizing results with a time series.

The bin() function rounds values down to an integer multiple of the given bin size.  Used frequently in combination with summarize by .... If you have a scattered set of values, the values are grouped into a smaller set of specific values.  Combining the generated time series and pipe to a render operator with a type of timechart provides a time series visualization. In the Query Window. Enter the following statement and select **run**: 

```KQL
SecurityEvent 
| summarize count() by bin(TimeGenerated, 1d) 
| render timechart
```

## You have completed the demo
