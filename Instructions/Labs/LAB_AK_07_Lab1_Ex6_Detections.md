# Module 7 - Lab 1 - Exercise 6 - Create Detections

### Task 1: Attack 1 Detection with Sysmon

In this task, you will create a detection for Attack 1 on the host with the Security Events connector and Sysmon installed.

The attack creates a registry key that runs on startup.  
```Command
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

1. Login to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account for admin provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** for admin provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace you created earlier.

7. Select **Logs** from the General section.

8. First, you need to see where the data is stored. Since you just performed the attacks.  Set the Log Time Range to **Last 24 hours**.

9. Run the following KQL Statement

```KQL
search "temp\\startup.bat"
```

10. The results show for three different tables:
    DeviceProcessEvents
    DeviceRegistryEvents
    Event

    The Device* tables are from Defender for Endpoint (Data Connector - Microsoft 365 Defender).  Event is from our Data Connector Security Events. 

    Since we are receiving data from two different sources - Sysmon and Defender for Endpoint,  we will need to build two KQL statements that could be unioned later.  In our initial investigation, you will look at each separately.

11. Our first data source is Sysmon from Windows hosts.  Run the following KQL Statement.

```KQL
search in (Event) "temp\\startup.bat"
```
The results now only show for the Event table.  

12. Expand the rows to see all the columns related to the record.  A few of the fields like EventData and ParameterXml have multiple data items stored as structured data.  This makes it difficult to query on specific fields.  

13. Next, we have to build a KQL statement that parses the data from each row, allowing us to have meaningful fields.  In the Azure Sentinel Community on GitHub, there are many examples of Parsers in the Parsers folder.  Open another tab in your browser and navigate to: https://github.com/Azure/Azure-Sentinel

14. Select the **Parsers** folder, then **Sysmon** folder.  You should be viewing: Azure-Sentinel/Parsers/Sysmon/Sysmon-v12.0.txt

15. Select the Sysmon-v12.0.txt file to view.

At the top of the file, you see a Let statement querying the Event table and storing to a variable named EventData.


```KQL
let EventData = Event
| where Source == "Microsoft-Windows-Sysmon"
| extend RenderedDescription = tostring(split(RenderedDescription, ":")[0])
| project TimeGenerated, Source, EventID, Computer, UserName, EventData, RenderedDescription
| extend EvData = parse_xml(EventData)
| extend EventDetail = EvData.DataItem.EventData.Data
| project-away EventData, EvData  ;
```

Further down in the file, you see another let statement  looking at EventID == 13 and using the EventData variable as input.  

```KQL
let SYSMON_REG_SETVALUE_13=()
{
    let processEvents = EventData
    | where EventID == 13
    | extend RuleName = EventDetail.[0].["#text"], EventType = EventDetail.[1].["#text"], UtcTime = EventDetail.[2].["#text"], ProcessGuid = EventDetail.[3].["#text"], 
    ProcessId = EventDetail.[4].["#text"], Image = EventDetail.[5].["#text"], TargetObject = EventDetail.[6].["#text"], Details = EventDetail.[7].["#text"]
    | project-away EventDetail  ;
    processEvents;
    
};
```
This looks like a good start.

16. You use the above statement to create your own KQL statement to display all Registry Key Set Value rows.  Run the following KQL query:

```KQL

Event
| where Source == "Microsoft-Windows-Sysmon"
| where EventID == 13
| extend RenderedDescription = tostring(split(RenderedDescription, ":")[0])
| project TimeGenerated, Source, EventID, Computer, UserName, EventData, RenderedDescription
| extend EvData = parse_xml(EventData)
| extend EventDetail = EvData.DataItem.EventData.Data
| project-away EventData, EvData  
| extend RuleName = EventDetail.[0].["#text"], EventType = EventDetail.[1].["#text"], UtcTime = EventDetail.[2].["#text"], ProcessGuid = EventDetail.[3].["#text"], 
    ProcessId = EventDetail.[4].["#text"], Image = EventDetail.[5].["#text"], TargetObject = EventDetail.[6].["#text"], Details = EventDetail.[7].["#text"]
    | project-away EventDetail 


```

   ![Screenshot](../Media/SC200_sysmon_query1.png)

17.  You could continue to build your detection rule from here, but this KQL statement looks like it could be reused in other detection rule's KQL statements.  In the Log window, select **Save**, then **Save as function**. In the Save flyout, enter the following and save the function:

    Function Name: Event_Reg_SetValue
    Category: Sysmon


18. Open a new Log Query tab. Then run the following KQL Statement:

```KQL

Event_Reg_SetValue

```
Depending on the current data collection, you could receive many rows.  This is expected.  Our next task is to filter to our specific scenario.

19. Run the following KQL Statement:

```KQL

Event_Reg_SetValue | search "startup.bat"

```
This returns our specific record that we can now review the data to see what we can change to identify rows.

20. From our Threat Intelligence, we know that the Threat Actor is using reg.exe to add the registry key.  The directory is c:\temp. The startup.bat can be a different name. Run the following script

```KQL
Event_Reg_SetValue 
| where Image contains "reg.exe"

```
This is a good start.  Next, you need to return results only for c:\temp directory.

21. Next, enter the following KQL statement:

```KQL
Event_Reg_SetValue 
| where Image contains "reg.exe"
| where Details startswith "C:\\TEMP"
```

This looks like a good detection rule.  

22. It is important to help the Security Operations Analyst by providing as much context about the alert as you can. This includes projecting entities for use in the investigation graph.  Run the following query:

```KQL
Event_Reg_SetValue 
| where Image contains "reg.exe"
| where Details startswith "C:\\TEMP"
| extend timestamp = TimeGenerated, HostCustomEntity = Computer, AccountCustomEntity = UserName

```

23. Now that you have a good detection rule, in the Log window with the query, select the **+ New alert rule** in the Command Bar, and choose **Create Azure Sentinel alert**.

24. This starts our Analytics rule wizard.  For the General Tab enter:

    Name: Sysmon Startup RegKey

    Description: Sysmon Startup Regkey in c:\temp

    Tactics: Persistence

    Severity: High

Select **Next : Set rule logic >**.

25. On the **Set rule logic** tab, the **Rule query** should already be populated.

26. For Query scheduling set the following:

- Run Query every: 5 minutes
- Look data from the last: 1 Day

**Note** We are purposely generating many incidents for the same data.  This enables the Lab to use these alerts.

27. Leave the rest of the options to the defaults.  Select **Next : Incident settings>** button.

28. For the Incident settings set the following: 

- Incident settings: Enabled
- Alert grouping: Disabled

Select **Next : Automated response>** button.

29. For the Automated response tab set the following:

- Select *PostMessageTeams-OnAlert*.

Select **Next : Review** button.

30. On the Review tab, select the **Create** button.


### Task 2: Attack 1 Detection with Defender for Endpoint

In this task, you will create a detection for Attack 1 on the host with the Microsoft Defender for Endpoint configured.

The attack creates a registry key that runs on startup.  
```Command
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SOC Test" /t REG_SZ /F /D "C:\temp\startup.bat"
```

1. In the Azure Sentinel portal, Select **Logs** from the General section.

2. First, you need to see where the data is stored. Since you just performed the attacks.  

    Set the Log Time Range to Last 24 hours.

3. Run the following KQL Statement:

```KQL
search "temp\\startup.bat"
```

4. The results show for three different tables:
    DeviceProcessEvents
    DeviceRegistryEvents
    Event

    The Device* tables are from Defender for Endpoint (Data Connector - Microsoft 365 Defender).  Event is from our Data Connector Security Events. 

    Since we are receiving data from two different sources - Sysmon and Defender for Endpoint.  We will need to build two KQL statements that could be unioned later.  But our initial investigation, you will look at each separately.

5. This detection will focus on data from Defender for Endpoint.  Run the following KQL Statement:

```KQL
search in (Device*) "temp\\startup.bat"
```

6. The table - DeviceRegistryEvents looks to have the data already normalized and easy for us to query.  Expand the rows to see all the columns related to the record.

7. From our Threat Intelligence, we know that the Threat Actor is using reg.exe to add the registry key.  The directory is c:\temp. The startup.bat can be a different name.  Enter this KQL statement:

```KQL

DeviceRegistryEvents
| where ActionType == "RegistryValueSet"
| where InitiatingProcessFileName == "reg.exe"
| where RegistryValueData startswith "c:\\temp"


```

This looks like a good detection rule.  

8. It is important to help the Security Operations Center Analyst by providing as much context about the alert as you can. This includes projecting Entities for use in the investigation graph. Run the following query:

```KQL
DeviceRegistryEvents
| where ActionType == "RegistryValueSet"
| where InitiatingProcessFileName == "reg.exe"
| where RegistryValueData startswith "c:\\temp"
| extend timestamp = TimeGenerated, HostCustomEntity = DeviceName, AccountCustomEntity = InitiatingProcessAccountName


```

   ![Screenshot](../Media/SC200_sysmon_query2.png)

9.  Now that you have a good detection rule, in the Log window with the query, select the **+ New alert rule** in the Command Bar.  Then select **Create Azure Sentinel alert**.

10. This starts our Analytics rule wizard.  For the General Tab, enter:


    Name: D4E Startup RegKey

    Description: D4E Startup Regkey in c:\temp

    Tactics: Persistence

    Severity: High

11. Select **Next : Set rule logic >** button.

12. On the Set rule logic tab, the **Rule query** should already be populated.

13. For Query scheduling set the following:

- Run Query every: 5 minutes
- Look data from the last: 1 Days

**Note** We are purposely generating many incidents for the same data.  This enables the Lab to use these alerts.

14. Leave the rest of the options to the defaults.  Select **Next : Incident settings >**:

15. For the Incident settings set the following: 

- Incident settings: Enabled
- Alert grouping: Disabled

Select **Next : Automated response >**:

16. For the Automated response tab set the following:

- Select PostMessageTeams-OnAlert.
- Select **Next: Review**.

17. On the Review and create tab, select **Create**.

### Task 3: Attack 2 Detection with SecurityEvent

In this task, you will create a detection for Attack 2 on the host with the Security Events connector and Sysmon installed.

The attack creates a new user and adds the user to the local administrators.
```Command
net user theusernametoadd /add
net user theusernametoadd ThePassword1!
net localgroup administrators theusernametoadd /add
```

1. Select **Logs** from the General section of the Azure Sentinel portal.

2. First, you need to see where the data is stored. Since you just performed the attacks.  

    Set the Log Time Range to Last 24 hours.

3. Run the following KQL Statement:

```KQL
search "administrators"
```

4. The results show the following tables:
    Event
    SecurityEvent

5. Our first data source is SecurityEvent. Time to research what event ID Windows uses to identify adding a member to a privileged group.  The following EventID and Event are what we are looking for:

4732 - A member was added to a security-enabled local group.

Running the following script:

```KQL
SecurityEvent
| where EventID == "4732"
| where TargetAccount == "Builtin\\Administrators"

```

6. Expand the rows to see all the columns related to the record.  The user name we are looking for doesn't show.  The issue is that instead of storing the user name, the security identifier (SID) is stored.  The following KQL will try to match the SID to populate the TargetUserName that was added to the Administrators group.


```KQL
SecurityEvent
| where EventID == "4732"
| where TargetAccount == "Builtin\\Administrators"
| extend Acct = MemberSid, MachId = SourceComputerId 
| join kind=leftouter (
     SecurityEvent 
     | summarize count() by TargetSid, SourceComputerId, TargetUserName
     | project Acct1 = TargetSid, MachId1 = SourceComputerId, UserName1 = TargetUserName
) on $left.MachId == $right.MachId1, $left.Acct == $right.Acct1 

```
This looks like a good detection rule.  

   ![Screenshot](../Media/SC200_sysmon_attack3.png)

**Note:** This KQL might not return the expected results because of the small dataset used in the lab.

7. It is important to help the Security Operations Analyst by providing as much context about the alert as you can. This includes projecting Entities for use in the investigation graph.  Run the following query:


```KQL
SecurityEvent
| where EventID == "4732"
| where TargetAccount == "Builtin\\Administrators"
| extend Acct = MemberSid, MachId = SourceComputerId 
| join kind=leftouter (
     SecurityEvent 
     | summarize count() by TargetSid, SourceComputerId, TargetUserName
     | project Acct1 = TargetSid, MachId1 = SourceComputerId, UserName1 = TargetUserName
) on $left.MachId == $right.MachId1, $left.Acct == $right.Acct1 
| extend timestamp = TimeGenerated, HostCustomEntity = Computer, AccountCustomEntity = UserName1

```

8. Now that you have a good detection rule, in the Log window with the query, select **+ New alert rule** in the Command Bar, then select **Create Azure Sentinel alert**.

9. This starts our Analytics rule wizard.  For the General Tab, enter:

- Name: SecurityEvents Local Administrators User Add 
- Description: SecurityEvents Local Administrators User Add 
- Tactics: Privilege Escalation
- Severity: High

Select **Next : Set rule logic >** button.

10. On the Set rule logic tab, the Rule query and Map entities should already be populated.

11. For Query scheduling set the following:

- Run Query every: 5 minutes
- Look data from the last: 1 Day

**Note** We are purposely generating many incidents for the same data.  This enables the Lab to use these alerts.

12. Leave the rest of the options to the defaults.  Select **Next : Incident settings >**:

13. For the Incident settings set the following:

- Incident settings: Enabled
- Alert grouping: Disabled
- Select **Next: Automated response >**

14. For the Automated response tab set the following:

- Select **PostMessageTeams-OnAlert**.
- Select **Next : Review >** button.

15. On the Review tab, select **Create**.

## Proceed to Exercise 7
