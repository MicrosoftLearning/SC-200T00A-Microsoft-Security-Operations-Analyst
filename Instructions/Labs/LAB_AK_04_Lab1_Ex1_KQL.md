# Module 4 - Lab 1 - Exercise 1 - Create queries for Azure Sentinel using Kusto Query Language (KQL)

## Lab scenario
You are a Security Operations Analyst working at a company that is implementing Azure Sentinel. You are responsible for performing log data analysis to search for malicious activity, display visualizations, and perform threat hunting. To query log data, you use the Kusto Query Language (KQL).

### Task 1: Access the KQL testing area.

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

**Note:**  For each step, clear the previous statement from the Query Window or open a new Query Windows by selecting **+** after the last opened tab (up to 25).

1. The following statement demonstrates the use of the let statement to declare variables. In the Query Window. Enter the following statement and select **run**: 


```KQL
let timeOffset = 7d;
let discardEventId = 4688;
SecurityEvent
| where TimeGenerated > ago(timeOffset*2) and TimeGenerated < ago(timeOffset)
| where EventID != discardEventId
```

2. The following statement demonstrates the use of the let statement to declare a dynamic list. In the Query Window enter the following statement and select **run**: 


```KQL
let suspiciousAccounts = datatable(account: string) [
    @"\administrator", 
    @"NT AUTHORITY\SYSTEM"
];
SecurityEvent | where Account in (suspiciousAccounts)
```

3. The following statement demonstrates the use of the "let" statement to declare a dynamic table. In the Query Window. Enter the following statement and select **run**: 

```KQL
let LowActivityAccounts =
    SecurityEvent 
    | summarize cnt = count() by Account 
    | where cnt < 10;
LowActivityAccounts | where Account contains "Mal"
```

**Note:** When you run this script you should get no results.

4. The following statement demonstrates searching across all tables and columns for records within the query time range display in the query window. In the Query Window before running this script change the **Time range** to "Last hour". Enter the following statement and select **run**: 

```KQL
search "err"
```

**Warning:** Make sure you change back the Time range to "Last 24 hours" for the next scripts.

5. The following statement demonstrates searching across tables listed with the "in" clause for records within the query time range display in the query window. In the Query Window. Enter the following statement and select **run**: 

```KQL
search in (SecurityEvent,SecurityAlert,A*) "err"
```


6. The following statements demonstrates filter using the where operator. In the Query Window. Enter the following statement and select **run**: 

**Note:** You should "run" after entering the query from each code block below.

```KQL
SecurityEvent
| where TimeGenerated > ago(1d)
```

```KQL
SecurityEvent
| where TimeGenerated > ago(1h) and EventID == "4624"
```

```KQL
SecurityEvent
| where TimeGenerated > ago(1h)
| where EventID == 4624
| where AccountType =~ "user"
```

```KQL
SecurityEvent | where EventID in (4624, 4625)
```


7. The following statement demonstrates creating fields using the extend operator In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityAlert
| where TimeGenerated > ago(7d)
| extend severityOrder = case (
    AlertSeverity == "High", 3,
    AlertSeverity == "Medium", 2, 
    AlertSeverity == "Low", 1,
    AlertSeverity == "Informational", 0,
    -1)
```


8. The following statement demonstrates a real-world example that combines the let, dynamics list creation, and creating fields using extend. In the Query Window. Enter the following statement and select **run**: 

```KQL
let timeframe = 1d;
let DomainList = dynamic(["tor2web.org", "tor2web.com"]);
Syslog
| where TimeGenerated >= ago(timeframe)
| where ProcessName contains "squid"
| extend 
  HTTP_Status_Code = extract("(TCP_(([A-Z]+)…-9]{3}))",8,SyslogMessage),    
  Domain = extract("(([A-Z]+ [a-z]{4…Z]+ )([^ :\\/]*))",3,SyslogMessage)
| where HTTP_Status_Code == "200"
| where Domain contains "."
| where Domain has_any (DomainList)
```

**Note:** When you run this script you should get no results.

9. The following statement demonstrates sorting results using the order by operator. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityAlert
| where TimeGenerated > ago(7d)
| extend severityOrder = case (
    AlertSeverity == "High", 3,
    AlertSeverity == "Medium", 2, 
    AlertSeverity == "Low", 1,
    AlertSeverity == "Informational", 0,
    -1)
| order by severityOrder desc
```

10. The following statements demonstrate specifying fields for the result set using the project operators.

**Note:** You should "run" after entering the query from each code block below.

In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent
| project Computer, Account
```



```KQL
SecurityAlert
| where TimeGenerated > ago(7d)
| extend severityOrder = case (
    AlertSeverity == "High", 3,
    AlertSeverity == "Medium", 2, 
    AlertSeverity == "Low", 1,
    AlertSeverity == "Informational", 0,
    -1)
| order by severityOrder
| project-away severityOrder
```

### Task 3: Analyze Results in KQL with the Summarize Operator

In this task, you will build KQL statements to prepare data.

1. The following statement demonstrates the count function. In the Query Window. Enter the following statement and select **run**: 



```KQL
SecurityEvent
| where EventID == "4688"
| summarize count() by Process, Computer
```


2. The following statement demonstrates the count function. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent
| where TimeGenerated > ago(1h)
| where EventID == 4624
| summarize cnt=count() by AccountType, Computer
```



3. The following statement demonstrates the dcount function. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent
| summarize dcount(IpAddress)
```

4. The following statement is an Azure Sentinel Analytical rule to detect a password spray attempt.

The first three "where" operators will filter the result set to failed logins to disabled accounts.  Next, the statement "summarize" a distinct count of application name and group by User and IP Address.  Finally, there is a check against a variable created (threshold) to see if the number exceeds the allowed amount. In the Query Window. Enter the following statement and select **run**: 


```KQL
let timeframe = 1d;
let threshold = 3;
SigninLogs
| where TimeGenerated >= ago(timeframe)
| where ResultType == "50057"
| where ResultDescription =~ "User account is disabled. The account has been disabled by an administrator."
| summarize applicationCount = dcount(AppDisplayName) by UserPrincipalName, IPAddress
| where applicationCount >= threshold
```

**Note:** When you run this script you should get no results.

5. The following statement demonstrates the arg_max function.

The following statement will return the most current row from the SecurityEvent table for the computer SQL12.NA.contosohotels.com.  The * in the arg_max function requests all columns for the row. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent 
| where Computer == "SQL12.na.contosohotels.com"
| summarize arg_max(TimeGenerated,*) by Computer
```

6. The following statement demonstrates the arg_min function.

In this statement, the oldest SecurityEvent for the computer SQL12.NA.contosohotels.com will be returned as the result set. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent 
| where Computer == "SQL12.na.contosohotels.com"
| summarize arg_min(TimeGenerated,*) by Computer
```

7. The following statements demonstrate the importance of understanding results based on the order of the pipe "|". In the Query Window. Enter the following queries and run each separately: 

**Query 1** will have Accounts for which the last activity was a login. The SecurityEvent table will first be summarized and return the most current row for each Account.  Then only rows with EventID equals 4624 (login) will be returned.

```KQL
SecurityEvent
| summarize arg_max(TimeGenerated, *) by Account
| where EventID == "4624"
```

**Query 2** will have the most recent login for Accounts that have logged in.  The SecurityEvent table will be filtered to only include EventID = 4624. Then these results will be summarized for the most current login row by Account.

```KQL
SecurityEvent
| where EventID == "4624"
| summarize arg_max(TimeGenerated, *) by Account
```

**Note:**  You can also review the "Total CPU" and "Data used for processed query" by selecting the "Completed." bar and compare the data between both statements.

8. The following statement demonstrates the make_list function.

The make_list function returns a dynamic (JSON) array of all the values of Expression in the group. This KQL query will first filter the EventID with the where operator.  Next, for each Computer, the results are a JSON array of Accounts. The resulting JSON array will include duplicate accounts.

In the Query Window. Enter the following statement and select **run**: 

```KQL
SecurityEvent
| where EventID == "4624"
| summarize make_list(Account) by Computer
```

9. The following statement demonstrates the make_set function.

The make_set function returns a dynamic (JSON) array containing *distinct* values that Expression takes in the group. This KQL query will first filter the EventID with the where operator.  Next, for each Computer, the results are a JSON array of unique Accounts. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent
| where EventID == "4624"
| summarize make_set(Account) by Computer
```

### Task 4: Create visualizations in KQL with the Render Operator

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
| summarize count() by bin(TimeGenerated, 1h) 
| render timechart
```

### Task 5: Build multi-table statements in KQL

In this task, you will build multi-table KQL statements.

1. The following statement demonstrates the union operator that takes two or more tables and returns the rows of all of them. Understanding how results are passed and impacted with the pipe character is essential. In the Query Window. Enter the following statements and select **run** for each separately to see the results: 


**Query 1** will return all rows of SecurityEvent and all rows of SecurityAlert.
```KQL
SecurityEvent 
| union SecurityAlert  
```

**Query 2** will return one row and column, which is the count of all rows of SecurityEvent and all rows of SecurityAlert.
```KQL
SecurityEvent 
| union SecurityAlert  
| summarize count() 
| project count_
```

**Query 3** will return all rows of SecurityEvent and one row for SecurityAlert.  The row for SecurityAlert will have the count of the SecurityAlert rows.
```KQL
SecurityEvent 
| union (SecurityAlert  | summarize count()) 
| project count_
```

2. The following statement demonstrates the union operator support for wildcards to union multiple tables. In the Query Window. Enter the following statement and select **run**: 


```KQL
union Security* 
| summarize count() by Type
```


3. The following statement demonstrates the join operator, which merges the rows of two tables to form a new table by matching the specified columns' values from each table. In the Query Window. Enter the following statement and select **run**: 


```KQL
SecurityEvent 
| where EventID == "4624" 
| summarize LogOnCount=count() by EventID, Account 
| project LogOnCount, Account 
| join kind = inner (
     SecurityEvent 
     | where EventID == "4634" 
     | summarize LogOffCount=count() by EventID, Account 
     | project LogOffCount, Account 
) on Account
```

The first table specified in the join is considered the Left table.  The table after the join keyword is the right table.  When working with columns from the tables, the $left.Column name and $right.Column name is to distinguish which tables column are referenced. 

### Task 6: Work with string data in KQL

In this task, you will work with structured and unstructured string fields with KQL statements.

1. The following statement demonstrates the extract function.  Extract gets a match for a regular expression from a text string. You have the option to convert the extracted substring to the indicated type. In the Query Window. Enter the following statement and select **run**: 

```KQL
print extract("x=([0-9.]+)", 1, "hello x=45.6|wo") == "45.6"
```

2. The following statements use the extract function to pull out the Account Name from the Account field of the SecurityEvent table. In the Query Window. Enter the following statement and select **run**: 


```KQL
let top5 = SecurityEvent
| where EventID == 4625 and AccountType == 'User'
| extend Account_Name = extract(@"^(.*\\)?([^@]*)(@.*)?$", 2, tolower(Account))
| summarize Attempts = count() by Account_Name
| where Account_Name != ""
| top 5 by Attempts 
| summarize make_list(Account_Name);

SecurityEvent
| where EventID == 4625 and AccountType == 'User'
| extend Name = extract(@"^(.*\\)?([^@]*)(@.*)?$", 2, tolower(Account))
| extend Account_Name = iff(Name in (top5), Name, "Other")
| where Account_Name != ""
| summarize Attempts = count() by Account_Name
```

**Note:** This script is separated by a space make sure the entire script is selected before you hit "Run" in the Query window.

3. The following statement demonstrates the parse function. Parse evaluates a string expression and parses its value into one or more calculated columns. The computed columns will have nulls for unsuccessfully parsed strings.

Review the following statement, but **do not run it**: 

```KQL
let SQlData = Event
| where Source has "MSSQL"
;
let Sqlactivity = SQlData
| where RenderedDescription !has "LGIS" and RenderedDescription !has "LGIF"
| parse RenderedDescription with * "action_id:" Action:string 
                                    " " * 
| parse RenderedDescription with * "client_ip:" ClientIP:string
" permission" * 
| parse RenderedDescription with * "session_server_principal_name:" CurrentUser:string
" " * 
| parse RenderedDescription with * "database_name:" DatabaseName:string
"schema_name:" Temp:string
"object_name:" ObjectName:string
"statement:" Statement:string
"." *
;
let FailedLogon = SQlData
| where EventLevelName has "error"
| where RenderedDescription startswith "Login"
| parse kind=regex RenderedDescription with "Login" LogonResult:string
                                            "for user '" CurrentUser:string 
                                            "'. Reason:" Reason:string 
                                            "provided" *
| parse kind=regex RenderedDescription with * "CLIENT" * ":" ClientIP:string 
                                            "]" *
;
let dbfailedLogon = SQlData
| where RenderedDescription has " Failed to open the explicitly specified database" 
| parse kind=regex RenderedDescription with "Login" LogonResult:string
                                            "for user '" CurrentUser:string 
                                            "'. Reason:" Reason:string 
                                            " '" DatabaseName:string
                                            "'" *
| parse kind=regex RenderedDescription with * "CLIENT" * ":" ClientIP:string 
                                            "]" *
;
let successLogon = SQlData
| where RenderedDescription has "LGIS"
| parse RenderedDescription with * "action_id:" Action:string 
                                    " " LogonResult:string 
                                    ":" Temp2:string
                                    "session_server_principal_name:" CurrentUser:string
                                    " " *
| parse RenderedDescription with * "client_ip:" ClientIP:string 
                                    " " *
;
(union isfuzzy=true
Sqlactivity, FailedLogon, dbfailedLogon, successLogon )
| project TimeGenerated, Computer, EventID, Action, ClientIP, LogonResult, CurrentUser, Reason, DatabaseName, ObjectName, Statement
```

4. The following statement demonstrates working with Dynamics Fields:

Within a Log Analytics table, there are field types defined as Dynamic.  Dynamic fields contain a key-value pair such as:
{"eventCategory":"Autoscale","eventName":"GetOperationStatusResult","operationId":"xxxxxxxx-6a53-4aed-bab4-575642a10226","eventProperties":"{\"OldInstancesCount\":6,\"NewInstancesCount\":5}","eventDataId":" xxxxxxxx -efe3-43c2-8c86-cd84f70039d3","eventSubmissionTimestamp":"2020-11-30T04:06:17.0503722Z","resource":"ch-appfevmss-pri","resourceGroup":"CH-RETAILRG-PRI","resourceProviderValue":"MICROSOFT.COMPUTE","subscriptionId":" xxxxxxxx -7fde-4caf-8629-41dc15e3b352","activityStatusValue":"Succeeded"}

To access the strings within a Dynamic field, use the dot notation.  The Properties_d field from the AzureActivity table is of type dynamic. In this example, you could access the eventCategory with the Properties_d.eventCategory field name.

In the Query Window. Enter the following statement and **run**: 

```KQL
AzureActivity
| project Properties_d.eventCategory
```

**Note:** When you run this script you should get no results.

Review the following statement only, **do not run** it: 

```KQL
SigninLogs 
| where TimeGenerated >= ago(1d)
| extend OS = DeviceDetail.operatingSystem, Browser = DeviceDetail.browser
| extend ConditionalAccessPol0Name = tostring(ConditionalAccessPolicies[0].displayName), ConditionalAccessPol0Result = tostring(ConditionalAccessPolicies[0].result)
| extend ConditionalAccessPol1Name = tostring(ConditionalAccessPolicies[1].displayName), ConditionalAccessPol1Result = tostring(ConditionalAccessPolicies[1].result)
| extend ConditionalAccessPol2Name = tostring(ConditionalAccessPolicies[2].displayName), ConditionalAccessPol2Result = tostring(ConditionalAccessPolicies[2].result)
| extend StatusCode = tostring(Status.errorCode), StatusDetails = tostring(Status.additionalDetails)
| extend State = tostring(LocationDetails.state), City = tostring(LocationDetails.city)
| extend Date = startofday(TimeGenerated), Hour = datetime_part("Hour", TimeGenerated)
| summarize count() by Date, Identity, UserDisplayName, UserPrincipalName, IPAddress, ResultType, ResultDescription, StatusCode, StatusDetails, ConditionalAccessPol0Name, ConditionalAccessPol0Result, ConditionalAccessPol1Name, ConditionalAccessPol1Result, ConditionalAccessPol2Name, ConditionalAccessPol2Result, Location, State, City
| sort by Date
```

5. The following statement demonstrates functions to manipulate JSON stored in string fields. Many logs submit data in JSON format, which requires you to know how to transform JSON data to queryable fields. 

In the Query Window. Enter the following statements individually and select **Run**: 

```KQL
SecurityAlert
| extend ExtendedProperties = todynamic(ExtendedProperties) 
| extend ActionTaken = ExtendedProperties.ActionTaken
| extend AttackerIP = ExtendedProperties["Attacker IP"]
```


```KQL
SecurityAlert
| mv-expand entity = todynamic(Entities)
```


```KQL
SecurityAlert
| where TimeGenerated >= ago(7d)
| mv-apply entity = todynamic(Entities) on 
( where entity.Type == "account" | extend account = strcat (entity.NTDomain, "\\", entity.Name))
```

6. Parsers are functions that define a virtual table with already parsed unstructured strings fields such as Syslog data. The following is a KQL query created by the community for Mailbox forwarding monitoring.  

Review the following statement, but **do not run it**: 

```KQL
OfficeActivity
    | where TimeGenerated >= ago(30d)
    | where Operation == 'New-InboxRule'
    | extend details = parse_json(Parameters)
    | where details contains 'ForwardTo' or details contains 'RedirectTo'
    | extend ForwardTo = iif(details[0].Name contains 'ForwardTo', details[0].Value,
        iif(details[1].Name contains 'ForwardTo', details[1].Value, 
            iif(details[2].Name contains 'ForwardTo', details[2].Value,  
                iif(details[3].Name contains 'ForwardTo', details[3].Value, 
                    iif(details[4].Name contains 'ForwardTo', details[4].Value,
                        'Check Parameters')))))
    | extend RedirectTo = iif(details[0].Name contains 'RedirectTo', details[0].Value,
        iif(details[1].Name contains 'RedirectTo', details[1].Value,
            iif(details[2].Name contains 'RedirectTo', details[2].Value,
                iif(details[3].Name contains 'RedirectTo', details[3].Value,
                    iif(details[4].Name contains 'RedirectTo', details[4].Value,
                        'Check Parameters')))))
    | extend RuleName = iif(details[3].Name contains 'Name', details[3].Value,
         iif(details[4].Name contains 'Name', details[4].Value,
            iif(details[5].Name contains 'Name', details[5].Value,
                'Check Parameters')))
    | extend RuleParameters = iif(details[2].Name != 'ForwardTo' and  details[2].Name != 'RedirectTo', 
        strcat(tostring(details[2].Name), '-', tostring(details[2].Value)),
        iif(details[3].Name != 'ForwardTo' and  details[3].Name != 'RedirectTo' and details[3].Name != 'Name',
            strcat(tostring(details[3].Name), '-', tostring(details[3].Value)), 
                iff(details[4].Name != 'ForwardTo' and details[4].Name != 'RedirectTo' and details[4].Name != 'Name' and details[4].Name != 'StopProcessingRules',
                strcat(tostring(details[4].Name), '-', tostring(details[4].Value)),
                'All Mail')))
    | project TimeGenerated, Operation, RuleName, RuleParameters, iif(details contains 'ForwardTo', ForwardTo, RedirectTo), ClientIP, UserId
    | project-rename Email_Forwarded_To = Column1, Creating_User = UserId
```

To create a function:

**Note:** You will not be able to do this in the lademo environment used for data in this lab, but it's an important concept to be used in your environment. 

After running the query, select the **Save** button, enter the Name: MailboxForward, and select **Save As** Function from the drop-down.   

The function will be available in KQL by using the function alias:

```KQL
MailboxForward
```

## You have completed the lab.

