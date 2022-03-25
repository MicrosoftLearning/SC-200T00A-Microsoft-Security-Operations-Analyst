---
lab:
    title: 'Exercise 6 - Create Detections'
    module: 'Module 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Module 7 - Lab 1 - Exercise 6 - Create Detections

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You are going to work with Log Analytics KQL queries and from there, you will create custom analytics rules to help discover threats and anomalous behaviors in your environment.

Analytics rules search for specific events or sets of events across your environment, alert you when certain event thresholds or conditions are reached, generate incidents for your SOC to triage and investigate, and respond to threats with automated tracking and remediation processes.


### Task 1: Attack 1 Detection with Sysmon

In this task, you will create a detection for **Attack 1** on the host with the Security Events connector and Sysmon installed.

>**Important:** The next steps are done in a different machine than the one you were previously working. Look for the Virtual Machine name references.

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account for admin provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** for admin provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select **Logs** from the General section and make sure the log *Time Range:* is set to **Last 24 hours**.

1. First, you need to see where the data is stored. **Run** the following KQL Statement:

    ```KQL
    search "temp\\startup.bat"
    ```

1. The result should show data from four different tables:

    - *DeviceProcessEvents*. Source: Defender for Endpoint connector.
    - *DeviceRegistryEvents*. Source: Defender for Endpoint connector.
    - *Event*. Source: Log Analytics Agent, Sysmon/Operational Windows Event Logs (Agents configuration).
    - *SecurityEvent*. Source: Log Analytics Agent, Security Windows Event Logs (Default).

    Since we are receiving data from various sources, we will need to build two KQL statements that we could *union* later. In our initial investigation, you will look at each separately.

    >**Note:** On rare occasions, the initial data loading process takes longer than expected. When that happens, the tables do not appear in the results for some hours. You may continue now if you only see the *Event* table, since that will be the one that you will use now.

1. Our first data source to analyze is Sysmon from Windows hosts. **Run** the following KQL Statement to show only the results from the *Event* table:

    ```KQL
    search in (Event) "temp\\startup.bat"
    ```

1. Expand the first row to see all the columns related to the record. A few of the fields like *EventData* and *ParameterXml* have multiple data items stored as structured data. This makes it difficult to query on specific fields. 

1. For that, we have to build a KQL statement that parses the data from each row, allowing us to have meaningful fields. In the Microsoft Sentinel Community on GitHub, there are many examples in the Parsers folder. Open another tab in your Edge browser and type **https://github.com/Azure/Azure-Sentinel**.

1. Select the **Parsers** folder, then **Sysmon** folder.

1. Select the Sysmon-v12.0.txt file to view.

1. At the top of the file just after the comments, you will see the following *let* statement querying the *Event* table and storing to a variable named *EventData*, just like the one below:

    >**Note:** The following code snippet is for better understanding the query in step 16, not to be copied and executed.

    ```
    let EventData = Event
    | where Source == "Microsoft-Windows-Sysmon"
    | extend RenderedDescription = tostring(split(RenderedDescription, ":")[0])
    | project TimeGenerated, Source, EventID, Computer, UserName, EventData, RenderedDescription
    | extend EvData = parse_xml(EventData)
    | extend EventDetail = EvData.DataItem.EventData.Data
    | project-away EventData, EvData  ;
    ```

1. Further down in the file, you see another *let* statement looking for *EventID == 13* and using the *EventData* variable as input, just like the one below:

    >**Note:** The following code snippet is for better understanding the query in step 16, not to be copied and executed.

    ```
    let SYSMON_REG_SETVALUE_13=()
    {
        let processEvents = EventData
        | where EventID == 13
        | extend RuleName = EventDetail.[0].["#text"], EventType = EventDetail.[1].["#text"], UtcTime = EventDetail.[2].["#text"], ProcessGuid = EventDetail.[3].["#text"], ProcessId = EventDetail.[4].["#text"], Image = EventDetail.[5].["#text"], TargetObject = EventDetail.[6].["#text"], Details = EventDetail.[7].["#text"]
        | project-away EventDetail  ;
        processEvents;
    };
    ```

1. This looks like a good start. With the two statements above, you create your own KQL statement to display all Registry Key Set Value rows using Sysmon within the Event table. Go back to the Microsoft Sentinel Edge browser tab and **Run** the following KQL query:

    >**Important:** Please paste any KQL queries first in *Notepad* and then copy from there to the *New Query 1* Log window to avoid any errors.

    ```KQL
    Event | where Source == "Microsoft-Windows-Sysmon"
    | where EventID == 13
    | extend RenderedDescription = tostring(split(RenderedDescription, ":")[0])
    | project TimeGenerated, Source, EventID, Computer, UserName, EventData, RenderedDescription
    | extend EvData = parse_xml(EventData)
    | extend EventDetail = EvData.DataItem.EventData.Data
    | project-away EventData, EvData  
    | extend RuleName = EventDetail.[0].["#text"], EventType = EventDetail.[1].["#text"], UtcTime = EventDetail.[2].["#text"], ProcessGuid = EventDetail.[3].["#text"], ProcessId = EventDetail.[4].["#text"], Image = EventDetail.[5].["#text"], TargetObject = EventDetail.[6].["#text"], Details = EventDetail.[7].["#text"]
    | project-away EventDetail 
    ```

   ![Screenshot](../Media/SC200_sysmon_query1.png)

1. You could continue to build your detection rule from here, but this query looks like it could be reused in other detection rule's KQL statements. In the Logs window, select **Save**, then select **Save as function**. In the *Save as function* blade, type the following:

    |Setting|Value|
    |---|---|
    |Function Name|**Event_Reg_SetValue**|
    |Legacy category|**Sysmon**|

1. Select **Save** and open a new Log Query tab by selecting the **+** sign. 

1. **Run** the following KQL statement to test your newly created function:

    ```KQL
    Event_Reg_SetValue
    ```

1. Depending on the current data collection, you could receive many rows. This is expected. Our next task is to filter to our specific scenario. **Run** the following KQL Statement to return our specific record that we can now review to see what we can change to identify rows:

    ```KQL
    Event_Reg_SetValue | search "startup.bat"
    ```

1. From the results, we now know that the Threat Actor is using reg.exe to add keys to the Registry key and the program is located in C:\temp. **Run** the following statement to replace the *search* operator with the *where* operator in our query:

    ```KQL
    Event_Reg_SetValue | where Image contains "reg.exe"
    | where Details startswith "C:\\TEMP"
    ```

1. This is a good start. It is important to help the Security Operations Analysts by providing as much context about the alert as you can. This includes projecting entities for use in the investigation graph. **Run** the following query:

    ```KQL
    Event_Reg_SetValue | where Image contains "reg.exe"
    | where Details startswith "C:\\TEMP"
    | extend timestamp = TimeGenerated, HostCustomEntity = Computer, AccountCustomEntity = UserName
    ```

1. Now that you have a good detection rule, in the Logs window, select the **+ New alert rule** in the command bar and then select **Create Azure Sentinel alert**. This will create a new Scheduled rule, just like the one you created in Module 7 - Exercise 3.

1. This starts the "Analytics rule wizard". For the *General* tab type:

    |Setting|Value|
    |---|---|
    |Name|**Sysmon Startup RegKey**|
    |Description|**Sysmon Startup Regkey in c:\temp**|
    |Tactics|**Persistence**|
    |Severity|**High**|

1. Select **Next: Set rule logic >**. 

1. On the *Set rule logic* tab, the *Rule query* should be populated already with you KQL query, as well as the entities under *Alert enrichment - Entitiy mapping*. Select **-> Test with current data** to review the number of alerts you could receive per day with the current configuration.

1. Scroll down and for *Query scheduling*, set the following:

    |Setting|Value|
    |---|---|
    |Run Query every|5 minutes|
    |Look data from the last|1 Day|

    >**Note:** We are purposely generating many incidents for the same data. This enables the Lab to use these alerts. With this configuration change, the number of received alerts will increase.

1.  Select **-> Test with current data** again to review the number of alerts you could receive per day with the changed configuration.

1. Leave the rest of the options with the defaults. Select **Next: Incident settings>** button.

1. For the *Incident settings* tab, leave the default values and select **Next: Automated response >** button.

1. For the *Automated response* tab select the **PostMessageTeams-OnAlert** under *Alert automation* and then select **Next: Review >** button.

1. On the *Review* tab, select the **Create** button to create the new Scheduled Analytics rule.


### Task 2: Attack 1 Detection with Defender for Endpoint

In this task, you will create a detection for **Attack 1** on the host with the Microsoft Defender for Endpoint configured.

1. In the Microsoft Sentinel portal, select **Logs** from the General section in case you navigated away from this page.

1. **Run** the following KQL Statement again to recall the tables where we have this data:

    ```KQL
    search "temp\\startup.bat"
    ```

1. This detection will focus on data from Defender for Endpoint. **Run** the following KQL Statement:

    ```KQL
    search in (Device*) "temp\\startup.bat"
    ```

1. The table *DeviceRegistryEvents* looks to have the data already normalized and easy for us to query. Expand the row to see all the columns related to the record.

    >**Important:** If you do not see the *DeviceRegistryEvents* table in the results, an alternative for the following queries is to use the *DeviceProcessEvents* table as replacement. Being that said, use one of the two provided examples below.

1. From the results, we now know that the Threat Actor is using reg.exe to add keys to the Registry key and the program is located in C:\temp. **Run** the following statement to replace the *search* operator with the *where* operator in our query:

    ```KQL
    DeviceRegistryEvents | where ActionType == "RegistryValueSet"
    | where InitiatingProcessFileName == "reg.exe"
    | where RegistryValueData startswith "c:\\temp"
    ```

1. Alternatively, you can **Run** the following KQL query using the *DeviceProcessEvents* table:

    ```KQL
    DeviceProcessEvents | where ActionType == "ProcessCreated"
    | where FileName == "reg.exe"
    | where ProcessCommandLine contains "c:\\temp"
    ```

1. It is important to help the Security Operations Center Analyst by providing as much context about the alert as you can. This includes projecting Entities for use in the investigation graph. **Run** the following query:

    ```KQL
    DeviceRegistryEvents
    | where ActionType == "RegistryValueSet"
    | where InitiatingProcessFileName == "reg.exe"
    | where RegistryValueData startswith "c:\\temp"
    | extend timestamp = TimeGenerated, HostCustomEntity = DeviceName, AccountCustomEntity = InitiatingProcessAccountName
    ```

   ![Screenshot](../Media/SC200_sysmon_query2.png)

1. Alternatively, you can **Run** the following KQL query using the *DeviceProcessEvents* table:

    ```KQL
    DeviceProcessEvents | where ActionType == "ProcessCreated"
    | where FileName == "reg.exe"
    | where ProcessCommandLine contains "c:\\temp"
    | extend timestamp = TimeGenerated, HostCustomEntity = DeviceName, AccountCustomEntity = InitiatingProcessAccountName
    ```

1. Now that you have a good detection rule, in the Logs window, select the **+ New alert rule** in the command bar and then select **Create Azure Sentinel alert**. This will create a new Scheduled rule, just like the one you created before.

1. This starts the "Analytics rule wizard". For the *General* tab type:

    |Setting|Value|
    |---|---|
    |Name|**MDE Startup RegKey**|
    |Description|**MDE Startup Regkey in c:\temp**|
    |Tactics|**Persistence**|
    |Severity|**High**|

1. Select **Next: Set rule logic >** button.

1. On the *Set rule logic* tab, the *Rule query* should be populated already with you KQL query, as well as the entities under *Alert enrichment - Entitiy mapping*.

1. For *Query scheduling* set the following:

    |Setting|Value|
    |---|---|
    |Run Query every|5 minutes|
    |Look data from the last|1 Day|

    >**Note:** We are purposely generating many incidents for the same data. This enables the Lab to use these alerts.

1. Leave the rest of the options with the defaults. Select **Next: Incident settings>** button.

1. For the *Incident settings* tab, leave the default values and select **Next: Automated response >** button.

1. For the *Automated response* tab select the **PostMessageTeams-OnAlert** under *Alert automation* and then select **Next: Review** button.

1. On the *Review* tab, select the **Create** button to create the new Scheduled Analytics rule.


### Task 3: Attack 2 Detection with SecurityEvent

In this task, you will create a detection for **Attack 2** on the host with the Security Events connector and Sysmon installed.

1. In the Microsoft Sentinel portal, select **Logs** from the General section in case you navigated away from this page.

1. **Run** the following KQL Statement to identify any entry that refers to administrators:

    ```KQL
    search "administrators" | summarize count() by $table
    ```

1. The result might show events from different tables, but in our case, we want to investigate the SecurityEvent table. The EventID and Event that we are looking is "4732 - A member was added to a security-enabled local group". With this, we will identify adding a member to a privileged group. **Run** the following KQL query to confirm:

    ```KQL
    SecurityEvent | where EventID == 4732
    | where TargetAccount == "Builtin\\Administrators"
    ```

1. Expand the row to see all the columns related to the record. The username of the account added as Administrator does not show. The issue is that instead of storing the username, we have the Security IDentifier (SID). **Run** the following KQL to match the SID to the username that was added to the Administrators group:

    ```KQL
    SecurityEvent | where EventID == 4732
    | where TargetAccount == "Builtin\\Administrators"
    | extend Acct = MemberSid, MachId = SourceComputerId  
    | join kind=leftouter (
        SecurityEvent 
        | summarize count() by TargetSid, SourceComputerId, TargetUserName 
        | project Acct1 = TargetSid, MachId1 = SourceComputerId, UserName1 = TargetUserName) on $left.MachId == $right.MachId1, $left.Acct == $right.Acct1
    ```

   ![Screenshot](../Media/SC200_sysmon_attack3.png)

    >**Note:** This KQL might not return the expected results because of the small dataset used in the lab.

1. Extend the row to show the resulting columns, in the last one, we see the name of the added user under the *UserName1* column we *project* within the KQL query. It is important to help the Security Operations Analyst by providing as much context about the alert as you can. This includes projecting Entities for use in the investigation graph. **Run** the following query:

    ```KQL
    SecurityEvent | where EventID == 4732
    | where TargetAccount == "Builtin\\Administrators"
    | extend Acct = MemberSid, MachId = SourceComputerId  
    | join kind=leftouter (
        SecurityEvent 
        | summarize count() by TargetSid, SourceComputerId, TargetUserName 
        | project Acct1 = TargetSid, MachId1 = SourceComputerId, UserName1 = TargetUserName) on $left.MachId == $right.MachId1, $left.Acct == $right.Acct1
    | extend timestamp = TimeGenerated, HostCustomEntity = Computer, AccountCustomEntity = UserName1
    ```

1. Now that you have a good detection rule, in the Logs window, select **+ New alert rule** in the command bar and then select **Create Azure Sentinel alert**.

1. This starts the "Analytics rule wizard". For the *General* tab type:

    |Setting|Value|
    |---|---|
    |Name|**SecurityEvent Local Administrators User Add**|
    |Description|**User added to Local Administrators group**|
    |Tactics|**Privilege Escalation**|
    |Severity|**High**|

1. Select **Next: Set rule logic >** button. 

1. On the *Set rule logic* tab, the *Rule query* should be populated already with you KQL query, as well the entities under *Alert enrichment - Entitiy mapping*.

1. For *Query scheduling* set the following:

    |Setting|Value|
    |---|---|
    |Run Query every|5 minutes|
    |Look data from the last|1 Day|

    >**Note:** We are purposely generating many incidents for the same data. This enables the Lab to use these alerts.

1. Leave the rest of the options with the defaults. Select **Next: Incident settings>** button.

1. For the *Incident settings* tab, leave the default values and select **Next: Automated response >** button.

1. For the *Automated response* tab select the **PostMessageTeams-OnAlert** under *Alert automation* and then select **Next: Review** button.

1. On the *Review* tab, select the **Create** button to create the new Scheduled Analytics rule.

## Proceed to Exercise 7
