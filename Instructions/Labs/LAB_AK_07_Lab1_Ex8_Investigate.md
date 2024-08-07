---
lab:
    title: 'Exercise 8 - Investigate Incidents'
    module: 'Learning Path 7 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 7 - Lab 1 - Exercise 8 - Investigate Incidents

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod7_L1_Ex8.png)

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules. The Fusion and Anomalies Analytics rules are also enabled in your environment. Now is the time to investigate the Incidents created by them.

An incident can include multiple alerts. It is an aggregation of all the relevant evidence for a specific investigation. The properties related to the alerts, such as severity and status, are set at the incident level. After you let Microsoft Sentinel know what kinds of threats you are looking for and how to find them, you can monitor detected threats by investigating incidents.

>**Note:** An **[interactive lab simulation](https://mslabs.cloudguides.com/guides/SC-200%20Lab%20Simulation%20-%20Investigate%20incidents)** is available that allows you to click through this lab at your own pace. You may find slight differences between the interactive simulation and the hosted lab, but the core concepts and ideas being demonstrated are the same. 


### Task 1: Investigate an incident

In this task, you will investigate an incident.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

6. Select your Microsoft Sentinel Workspace you created earlier.

7. Select the **Incidents** page.

8. Review the list of incidents.

    >**Note:** The Analytics rules are generating alerts and incidents on the same specific log entry. Remember that this was done in the *Query scheduling* configuration to generate more alerts and incidents to be utilized in the lab.
  
9. Select one of the **Startup RegKey** incidents.

10. Review the incident details on the right blade that opened. Scroll down and select the **View full details** button.

11. If the "New incident experience" pop-up appears, follow the prompts by reading the information by selecting the **Next** button.

12. On the left blade of the incident, change the Status to **Active** and then select **Apply**.

13. Scroll down to the *Tags* area, select **+** and type **RegKey** and select **OK**.

14. Scroll down and in the *Write a comment...* box type: *I will research this* and select the **>** icon to submit the new comment.

15. Hide the left blade by selecting the **<<** icon next to the owner.

16. Review the **Incident timeline** window. Select the **Incident Actions** button at top-right and then **Run playbook**. You will see the *PostMessageTeams-OnIncident* playbook. This option help you to run playbooks manually.

17. Close the *Run playbook on incident* blade by selecting the **x** icon in the top right.

18. Review the **Entities** window. At least the *Host* entity that we mapped within the KQL query from the previous exercise should appear. **Hint:** If no entities are shown, refresh the page.

19. Select the new **Tasks (Preview)** button from the command bar.

20. Select **+ Add task**, type **Review who owns the machine** in the Title box and select **Save**.

21. Close the *Incident tasks (Preview)* blade by selecting the **x** icon in the top right.

22. Select the new **Activity Log** button from the command bar.

23. Review the actions you have taken during this exercise.

24. Close the *Incident activity log* blade by selecting the **x** icon in the top right.

25. From the almost hidden left blade, select the user icon named **Unassigned**. The new incident experience allows quick changes from here.

26. Select **Assign to me** and then scroll down to select **Apply** to save the changes.

27. Expand the left blade by selecting the **>>** icon. and then select the **Investigate** button.

    >**Hint:** If the icons are too small for your screen, select **(+)** to magnify them.

28. **Hover** the WINServer entity icon and wait for new *exploration queries* to be shown. It looks that *Related Alerts* has more data on it. Select the name of the exploration query **Related Alerts** to bring them to the investigation graph or select **Events >** to investigate them with a KQL query.

29. Close the query window by selecting the **X** icon at the top right to go back to the *Investigation* page.

30. Now select the **WINServer** entity, a window on the right opens for more detailed information. Review the **Info** page.

31. Select **Timeline** button. Hover the incidents and see which things on the graph occurred at what point in time.

32. Select **Entities** button and review the *Entities* and *Alerts* related to *WINServer*.

33. Close the investigation graph by selecting the **X** icon at the top right of the page.

34. Back in the incident page, in the right pane select **Active Status** and select **Closed**. 

35. In the *Select classification* drop-down review the different options. After that, select **True positive - suspicious activity** and then select **Apply**.

## Proceed to Exercise 9
