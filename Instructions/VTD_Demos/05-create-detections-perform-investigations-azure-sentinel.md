# Module 5 Create detections and perform investigations with Azure Sentinel

Create Detections

## Task 1: Attack 1 Detection with Sysmon

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

16. Create your own KQL statement to display all Registry Key Set Value rows.  Run the following KQL query:

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

17.  You could continue to build your detection rule from here, but this KQL statement looks like it could be reused in other detection rule's KQL statements.  
    
    In the Log window, select **Save**, then **Save as function**.
    In the Save flyout, enter the following:

    Name: Event_Reg_SetValue
    Save as: Function
    Function Alias: Event_Reg_SetValue
    Category: Sysmon

18. Open a new Log Query Tab. Then run the following KQL Statement:

```KQL

Event_Reg_SetValue

```
Depending on the current data collection, you could receive many rows.  This is expected.  Our next task is to filter to our specific scenario.

19. Run the following KQL Statement:

```KQL

Event_Reg_SetValue | search "startup.bat"

```

22. It is important to help the Security Operations Analyst by providing as much context about the alert as you can. This includes projecting Entities for use in the investigation graph.  Run the following query:

```KQL
Event_Reg_SetValue 
| where Image contains "reg.exe"
| where Details startswith "C:\\TEMP"
| extend timestamp = TimeGenerated, HostCustomEntity = Computer, AccountCustomEntity = UserName

```
