# Module 7 - Lab 1 - Exercise 7 - Investigate Incidents

### Task 1: Investigate an incident.

In this task, you will investigate an incident.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the Edge browser, navigate to the Azure portal at https://portal.azure.com.

3. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

4. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

5. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

6. Select your Azure Sentinel Workspace you created earlier.

7. Select the **Incidents** page.

8. Review the list of Incidents

**Note:** The analytical rules are generating alerts and incidents on the same specific log entry.  This is done to generate more alerts and incidents to be utilized in the lab.
  
9. Select a Sysmon Startup RegKey incident.

10. Select **View full details** button.

11. On the left side of the page, change the Status to **Active** and then select **Apply**.

12. In the Tag area, select **+** and add a tag named **RegKey** and select **Ok**.

13. On the middle of the page, select the tab **Comments** tab.

14. Enter in the Comments: *I will research this. *

15. Select the **Comment** button to submit the new comment.

16. Select the **Entities** tab and review.

17. Select the **Alerts** tab.

**Note:** For the alert shown, notice to the far right there is an option for **View playbooks**.  This allows for the manual execution of a playbook.

18. Select the **Investigate** button.

19. Select the **Sysmon Startup RegKey Alert** graphic.

20.	Select **Timeline** button and review.

21. Select **Info** button and review.

22.	Select **Entities** button and review.

23.	Select **Insights** button and review.

24.	Select the *WIN2* Host graphic (your Windows device name may vary depending on how it was deployed by your lab hoster).

25.	Select **Timeline** button and review.

26.	Select **Info** button and review.

27.	Select **Entities** button and review.

28.	Select **Insights** button and review.

29.	Hover *WIN2* Host in the graph. A menu should appear around the icon.  Select **Related alerts**.

30. Explore the Related Alerts graphs.

## Proceed to Exercise 8
