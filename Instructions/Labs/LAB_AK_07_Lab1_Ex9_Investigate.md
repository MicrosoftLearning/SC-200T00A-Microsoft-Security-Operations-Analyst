---
lab:
    title: 'Exercise 9 - Investigate Incidents'
    module: 'Module 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Module 7 - Lab 1 - Exercise 7 - Investigate Incidents

## Lab scenario


You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules. The Fusion and Anomalies Analytics rules are also enabled in your environment. Now is the time to investigate the Incidents created by them.

An incident can include multiple alerts. It is an aggregation of all the relevant evidence for a specific investigation. The properties related to the alerts, such as severity and status, are set at the incident level. After you let Microsoft Sentinel know what kinds of threats you are looking for and how to find them, you can monitor detected threats by investigating incidents.


### Task 1: Investigate an incident

In this task, you will investigate an incident.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

1. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace you created earlier.

1. Select the **Incidents** page.

1. Review the list of incidents.

    >**Note:** The Analytics rules are generating alerts and incidents on the same specific log entry. Remember that this was done in the *Query scheduling* configuration to generate more alerts and incidents to be utilized in the lab.
  
1. Select one of the *MDE Startup RegKey* incidents.

1. Review the incident details on the right blade that opened. Scroll down and select the **View full details** button.

1. On the left blade of the incident, change the Status to **Active** and then select **Apply**.

1. Scroll down to the *Tags* area, select **+** and type **RegKey** and select **OK**.

1. On the middle pane, select the tab **Comments** tab.

1. Type in the comments box: *I will research this* and select the **Comment** button to submit the new comment.

1. Select the **Entities** tab and review the *Account* and *Host* entities that we mapped within the KQL query from the previous exercise. **Hint:** If no entities are shown, refresh the page.

1. Select the **Alerts** tab. For the *MDE Startup RegKey* alert, slide right using the bar and notice the **View playbooks** link. This allows manual execution of a playbook from the alert, rather than triggering it from the *Automated response* tab within an Analytics rule.

1. From the left pane, scroll down and select the **Investigate** button. **Hint:** If the icons are too small for your screen, select **(+)** to magnify them.

1. Hover the **WIN1** entity icon and wait for new *exploration queries* to be shown. It looks that *Related Alerts* has more data on it. Select the name of the exploration query **Related Alerts** to bring them to the investigation graph or select **Events >** to investigate them with a KQL query.

1.	When you select an entity, a window on the right opens for more detailed information. Review the **Info** page.

1. Select **Timeline** button. Hover the first two incidents and see which things on the graph occurred at what point in time.

1. Select **Entities** button and review the *Entities* and *Alerts* related to *WIN1*.

1. Close the investigation graph by selecting the **X** in the top right of the page.

1. Back in the incident page, in the left pane, select **Unassigned Owner**, select **Assign to me** and then select **Apply**. Your account will now appear as the incident owner.

1. Finally, select **Active Status** and select **Closed**. In the *Select classification* review the different options. After that, select **True positive - suspicious activity** and then select **Apply**.

## Proceed to Exercise 10
