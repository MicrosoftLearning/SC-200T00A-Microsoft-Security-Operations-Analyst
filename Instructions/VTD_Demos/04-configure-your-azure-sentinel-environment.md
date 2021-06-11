# Module 4 Create queries for Azure Sentinel using Kusto Query Language (KQL)

## Explore the Azure Sentinel interface

1. Return to the Azure Sentinel instance that you created earlier while completed the [prerequisites section](00-prerequisites.md#deploy-azure-sentinel-workspace-for-demo-in-module-4).

1. Navigate around the newly created Azure Sentinel workspace to become familiar with the user interface options.

## Create a Watchlist.

In this task, you will create a watchlist.

1. In the search box at the bottom of the screen, enter `Notepad`.  Select **Notepad** from the results.

2. Type `Hostname` then enter for a new line.

3. In Row 2 through 6, add the following hostnames:
    ```
    Host1
    Host2
    Host3
    Host4
    Host5
    ```

4. From the menu select, **File - Save As**, Name the file `HighValue.csv`.  Then change the file type to **All files(*.*)**.  Then select **Save**.

5. Close Notepad.

6. In Azure Sentinel, select the **Watchlist** option in the **Configuration** area.

7. Select **Add New** from the command bar.

8. In the Watchlist wizard, enter the following:
    Name: HighValueHosts
    Description: High Value Hosts
    Watchlist alias: HighValueHosts

9. Select, **Next: Source >**.

10. Browse for the `HighValue.csv` file you just created. 

1. Once the CSV file is loaded, select **Hostname** from the **SearchKey field** dropdown box.

11. Select **Next: Review and Create >**.

12. Select **Create**.

13. The screen returns to the watchlists list.

14. Select your new watchlist.  On the right tab, select **View in Log Analytics**.

15. The following KQL statement is automatically executed with the results displayed.

```KQL
_GetWatchlist('HighValueHosts')
```
**Note** It could take a minute for the import to complete.

You can now use the _GetWatchlist('HighValueHosts') in your own KQL statements to access the list. The column to reference would be *Hostname*.

## Create a Threat Indicator.

In this task, you will create an indicator.

1. In Azure Sentinel, Select the **Threat intelligence** option in the **Threat management** area.

2. Select **Add New** from the command bar.

3. Review the different indicator types available in the Types dropdown.  Then select **domain-name**. Enter your initials in the Domain box. An example would be fmg.com.

4. For the threat type, select **malicious-activity**.

5. For the name, enter the same value used for the Domain. An example would be fmg.com.

6. Set the **Valid from** field to today's date.

7. Select **Apply**.

**Note** It could take a minute for the indicator to appear.

8. Select **Logs** option in the General area.  You may have to disable the "Always show queries" option to get to the query window.

9. Run the following KQL statement.

```KQL
ThreatIntelligenceIndicator 
```
Scroll the results to the right to see the DomainName column. You can also run the following KQL statement to just see the DomainName column.  

```KQL
ThreatIntelligenceIndicator 
| project DomainName
```
## You have completed the lab.