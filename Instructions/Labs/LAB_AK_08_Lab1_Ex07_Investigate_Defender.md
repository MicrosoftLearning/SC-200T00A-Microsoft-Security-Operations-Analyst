---
lab:
  title: Exercise 7 - Investigate Incidents
  module: Learning Path 8 - Create detections and perform investigations using Microsoft Sentinel
  description: In this task, you will investigate an incident.
  duration: 30 minutes
  level: 200
  islab: true
  primarytopics:
    - Microsoft Sentinel
---

# Learning Path 8 - Lab 1 - Exercise 7 - Investigate Incidents

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod7_L1_Ex8.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules. The Fusion and Anomalies Analytics rules are also enabled in your environment. Now is the time to investigate the Incidents created by them.

An incident can include multiple alerts. It is an aggregation of all the relevant evidence for a specific investigation. The properties related to the alerts, such as severity and status, are set at the incident level. After you let Microsoft Sentinel know what kinds of threats you are looking for and how to find them, you can monitor detected threats by investigating incidents.

>**Important:** The lab exercises for Learning Path 8 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Task 1: Investigate an incident

In this task, you will investigate an incident.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **sentinelworkspace-01**, and the required *Content Hub* solutions have been installed.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser.

1. In the Edge browser, navigate to Defender XDR at `https://security.microsoft.com`.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Investigation & response** section.

1. Expand the **Incidents & alerts** section and select **Incidents**.

1. Review the list of incidents.

    >**Note:** The Analytics rules are generating alerts and incidents on the same specific log entry. Remember that this was done in the *Query scheduling* configuration to generate more alerts and incidents to be utilized in the lab.
  
1. Select one of the **Startup RegKey** incidents.

1. Review the incident details on the page that opened.

1. Select **Manage incident** from the toolbar. It will have a *pencil* icon.

1. On the *Manage incident* page for the incident, very the *Status* is *Active*. If not, change the Status to **Active** and then select **Save**.

1. In the *Incident tags* field, type **RegKey** and select **RegKey (Create new)**.

1. In the *Assign to* field, select the box and then select **Assign to me** from the dropdown.

1. Select the **Save** button and the page closes.

1. Review the **Attack story** tab. Select the **Run playbook** from the toolbar. **Hint**: You might need to select the ellipsis icon **(...)** to see it.

1. You should see the *Defender_XDR_Ransomware_Playbook_SecOps_Tasks* playbook. This option helps you to run playbooks manually.

1. Close the *Run playbook on incident* blade by selecting the **X** icon in the top right.

1. Review the **Assets** window. At least the *Host* entity that we mapped within the KQL query from the previous exercise should appear. **Hint:** If no entities are shown, refresh the page.

1. Select the new **Tasks** button from the command bar.

1. Select **+ Add task**, type **Review who owns the machine** in the Title box and select **Save**.

1. Close the *Incident tasks* page by selecting the **x** icon in the top right.

1. Select the new **Activities** button from the command bar.

1. Review the actions you have taken during this exercise.

1. Close the *Activities* page by selecting the **x** icon in the top right.

1. In the *Attack story* tab, collapse the *Detections & Categories* section by selecting the **<** to have more space for the *Incident graph*.

    >**Hint:** If the icons are too small for your screen, select **(+)** to magnify them.

1. Select the *WINServer* entity icon and in the pop-up window wait for *Go hunt* to load. When loaded, expand the side bar.

1. It looks that *Related Alerts* has more data on it. Select **Related Alerts** to bring them to the Incident graph or select **Events >** to investigate them with a KQL query.

1. Close the query window by selecting the **X** icon at the top right to go back to the *Investigation* page.

1. Now select the **WINServer** entity, a window on the right opens for more detailed information. Review the **Info** page.

1. Select **Timeline** button. Hover the incidents and see which things on the graph occurred at what point in time.

1. Select **Entities** button and review the *Entities* and *Alerts* related to *WINServer*.

1. Close the investigation graph by selecting the **X** icon at the top right of the page.

1. Back in the incident page, in the left pane select **Active Status** and select **Closed**. 

1. In the *Select classification* drop-down review the different options. After that, select **True positive - suspicious activity** and then select **Apply**.

## Proceed to Exercise 8
