# Module 5 Configure your Microsoft Sentinel Environment

**Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md).

**Important:** This demo is not required for VTD-5002-FY25.

## Explore the Microsoft Sentinel interface

1. Return to the Microsoft Sentinel instance that you created earlier while completed the [prerequisites section](00-prerequisites.md#deploy-azure-sentinel-workspace-for-demo-in-module-4).

1. Navigate around the newly created Microsoft Sentinel workspace to become familiar with the user interface options.

## Create a Watchlist

In this task, you will create a Watchlist.

1. In the search box at the bottom of the screen, enter `Notepad`.  Select **Notepad** from the results.

1. Type `Hostname` then enter for a new line.

1. In Row 2 through 6, add the following hostnames:
    ```
    Host1
    Host2
    Host3
    Host4
    Host5
    ```

1. From the menu select, **File - Save As**, Name the file `HighValue.csv`.  Then change the file type to **All files(*.*)**.  Then select **Save**.

1. Close Notepad.

1. In Microsoft Sentinel, select the **Watchlist** option in the **My Watchlists** area.

1. Select **Add New** from the command bar.

1. In the Watchlist wizard, enter the following:
    Name: HighValueHosts
    Description: High Value Hosts
    Watchlist alias: HighValueHosts

1. Select, **Next: Source >**.

1. Browse for the `HighValue.csv` file you just created. 

1. Once the CSV file is loaded, select **Hostname** from the **SearchKey field** dropdown box.

1. Select **Next: Review and Create >**.

1. Select **Create**.

1. The screen returns to the watchlists list.

1. Select your new watchlist.  On the right tab, select **View in Log Analytics**.

1. The following KQL statement is automatically executed with the results displayed.

```KQL
_GetWatchlist('HighValueHosts')
```
**Note** It could take a minute for the import to complete.

You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

## Create a Threat Indicator.

In this task, you will create an indicator.

1. In Microsoft Sentinel, Select the **Threat intelligence** option in the **Threat management** area.

1. Select **Add New** from the command bar.

1. Review the different indicator types available in the Types dropdown.  Then select **domain-name**. Enter your initials in the Domain box. An example would be fmg.com.

1. For the threat type, select  **+ Add** and copy and paste **malicious-activity** into the field.

1. For the name, enter the same value used for the Domain. An example would be fmg.com.

1. Set the **Valid from** field to today's date.

1. Select **Apply**.

**Note** It could take a minute for the indicator to appear.

1. Select **Logs** option in the General area.  You may have to disable the "Always show queries" option to get to the query window.

1. Run the following KQL statement.

```KQL
ThreatIntelligenceIndicator 
```
Scroll the results to the right to see the DomainName column. You can also run the following KQL statement to just see the DomainName column.  

```KQL
ThreatIntelligenceIndicator 
| project DomainName
```
## You have completed the demo.