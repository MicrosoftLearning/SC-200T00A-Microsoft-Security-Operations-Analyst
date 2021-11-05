# Module 7 - Lab 1 - Exercise 3 - Create a Scheduled Query

### Task 1: Create a Scheduled Query.

In this task, you will create a scheduled query and connect it to the Teams channel you created in the previous exercise.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

2. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

3. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

4. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

5. Select your Azure Sentinel Workspace.

6. Select **Analytics** from the Configuration area.

7. Select the **+ Create** button and select **Scheduled query rule**.

8. In the Analytics rule wizard, on the General tab, enter the Name *Inactive Account sign in attempts*.

9. For Tactics, select **Initial Access**.

10. For Severity, select **Medium**.

11. Select **Next : Set rule logic >** button:

12. For the rule query, paste in the following KQL statement:

```KQL
SigninLogs
| where ResultType == "50057"
| where ResultDescription =~ "User account is disabled. The account has been disabled by an administrator."
| summarize StartTimeUtc = min(TimeGenerated), EndTimeUtc = max(TimeGenerated), count(), applicationCount = dcount(AppDisplayName), 
applicationSet = makeset(AppDisplayName) by UserPrincipalName, IPAddress
| extend timestamp = StartTimeUtc, AccountCustomEntity = UserPrincipalName, IPCustomEntity = IPAddress
```

**Warning:** When using the Paste function to the virtual machine.  Extra | (pipe) characters could be added.  Make sure what is pasted looks like the preceding KQL statement.

**Note:** If you select the link to "View query results", you should not receive any results.  You should also not receive an error.  

13. Back in the Analytics rule wizard - Create new rule blade in the *Query scheduling* area, enter **5** and select **Minutes** for the *Run query every* option.

14. In the *Query scheduling* area, enter **1** and select **Days** for the *Lookup data from the last* option.

15. For the *Alert threshold* area, leave the options unchanged.

**Note:** Best practices are to manage thresholds in the alert rule KQL query statement.

16. For the *Event grouping* area, leave the **Group all events into a single alert** as the selected option.

17. Select the **Next: Incident settings >** button.  

18. On the *Incident settings (Preview)* tab, review the default options.

19. Select the **Next: Automated response >** button.

20. On the Automated response tab in the *Alert automation* area, select the playbook *PostMessageTeams-OnAlert* you had created in the previous exercise.

22. Select the **Next: Review >** button.
  
23. Select **Create**.

### Task 2: Test our new rule.

In this task, you will test your new scheduled query rule.

1. In the Search bar of the Azure portal, type *Azure Active Directory*. Then select **Azure Active Directory**.

2. Select **Users** in the Manage area.

3. Select User **Christie Cline** in the list so the Christie Cline | Profile page is displayed.

4. Select **Edit** from the command bar.

5. In the Settings area, change **Block sign in** to **Yes**.

6. Now select **Save** from the Command bar.

7. In the Azure portal, select the user avatar at the top right and sign out.

8. Close your browser.

9. Open a new In-Private browsing session in Microsoft Edge and navigate to https://portal.office.com and try to login with user ChristieC@**Tenant Email domain** and password should be the same as your admin's tenant password.  You should receive the warning *Your account has been locked*. This is good, the action should trigger an alert.

10. Close your browser. The alert triggered by the last step may take 10 minutes to process. You may continue with the next exercise and return to this point later.

11. Open a new Edge browser, go to the Azure portal at https://portal.azure.com.

12. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider for Admin user and then select **Next**.

13. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider for Admin user and then select **Sign in**.

14. In the Search bar of the Azure portal, type *Sentinel*, then select **Azure Sentinel**.

15. Select your Azure Sentinel Workspace.

16. Select the **Incidents** menu option.

17. You should see the newly created Incident. Select the Incident and review the information in the right blade. If you do not see the incident you may continue with the next exercise and review it later.

18. Open Microsoft Teams by opening a browser tab and going to https://teams.microsoft.com. Go to the *SOC* Team and see the message post about the incident. If you do not see the message you may continue with the next exercise and review it later.

## Proceed to Exercise 4
