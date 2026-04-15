---
lab:
  title: Exercise 1 - Create a Playbook
  module: Learning Path 9 - Create detections and perform investigations using Microsoft Sentinel
  description: You have now created a playbook and an automation rule in Microsoft Sentinel.
  duration: 110 minutes
  level: 200
  islab: true
  primarytopics:
    - Microsoft Sentinel
---

# Learning Path 9 - Lab 1 - Exercise 1 - Create a Playbook in Microsoft Sentinel

## Lab scenario

You're a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You must learn how to detect and mitigate threats using Microsoft Sentinel. Now, you want to respond and remediate actions that can be run from Microsoft Sentinel as a routine.

With a playbook, you can help automate and orchestrate your threat response, integrate with other systems both internal and external, and can be set to run automatically in response to specific alerts or incidents, when triggered by an analytics rule or an automation rule.

>**Important:** The lab exercises for Learning Path #9 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Task 1: Create a Playbook in Microsoft Sentinel

In this task, you create a Logic App that is used as a Playbook in Microsoft Sentinel.

>**Note:** Microsoft Sentinel has been predeployed and onboarded to Microsoft Defender XDR with the name **sentinelworkspace-01**, and the required *Content hub* solutions have been installed.

1. Sign in to **WIN1** virtual machine as Admin using the provided credentials.

1. Open **Microsoft Edge** browser and navigate to **Microsoft Defender XDR** at `https://security.microsoft.com`.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Content management** section and select **Content hub**.

1. In the search box, type **Sentinel SOAR Essentials**.

1. From the results, select the **Sentinel SOAR Essentials** solution and then select **Manage**.

1. Find the **Defender_XDR_Ransomware_Playbook_for_SecOps-Tasks** playbook and then select the playbook name.

1. Select the **Incident tasks - Microsoft Defender XDR Ransomware Playbook for SecOps** template.

1. On the details pane, select **Create playbook**.

1. For Resource Group, select **SentinelStatic** and then select **OK**.

1. Edit the playbook name to remove *for* and the extra *underscores* (would exceed limit of 64 characters). It should read **Defender_XDR_Ransomware_Playbook_SecOps_Tasks**.

1. Select **Next: Connections >** and review the default options.

1. Select **Next: Review and create**, review the details, and then select **Create playbook**.

    >**Note:** Wait for the deployment to finish before proceeding to the next task.

1. Select the **Close and go to playbook** button to open the Logic App designer for the playbook.

### Task 2: Update a Playbook in Microsoft Sentinel

In this task, you update the new playbook you created with the proper connection information.

1. When the previous task completes you should be in the *Defender_XDR_Ransomware_Playbook_SecOps-Tasks | Logic app designer* page. If you aren't, complete steps 2-7 below.

1. In the Search bar of the Azure portal, type *Sentinel*, then select **Microsoft Sentinel**.

1. Select your Microsoft Sentinel Workspace.

1. Select **Automation** under the **Configuration** area and then select the **Active Playbooks** tab.

1. Select **Refresh** from the command bar if you do not see any playbooks. The playbook created in the previous step should be displayed.

1. Select the **Defender_XDR_Ransomware_Playbook_SecOps_Tasks** playbook name link.

1. On the **Logic app designer** page for **Defender_XDR_Ransomware_Playbook_SecOps_Tasks**, in the command menu, select **Edit**.

    >**Note:** You may need to refresh the page.

1. Select the first block labeled **Microsoft Sentinel incident**.

1. Select the **Change connection** link.

1. Select **Add new** and select **Sign in**. In the new window, select your Azure subscription admin credentials when prompted. The last line of the block should now read “Connected to your-Student-username”.

    <!--- 1. Below within the logic split (+ sign), select Add an action to incident.--->

1. Select **Save** on the command bar.

1. Select the **X** on the window to close it. The Logic App will be used in a future lab.

### Task 3: Create an Automation Rule

1. After closing the window in the previous task you should be in the Microsoft Sentinel *Automation* section.

1. Select **+ Create** and choose **Automation Rule**.

1. Give the rule a name

1. Leave the *Trigger* as **When an incident is created**.

1. Select **+ Add** and choose **Condition (And)**.

1. From the drop-down, select **Tactics**.

1. Select the **Contains** operator from the dropdown.

1. Select the following tactics *Values*:
    - Reconnaissance
    - Execution
    - Persistence
    - Command and Control
    - Exfiltration
    - PreAttack

1. Under Actions, select **Run Playbook**.

    <!--- 1. Select the link to **Manage playbook permissions**. -->

    <!---1. On the *Manage Permissions* page, select the **SentinelStatic** resource group, and select **Apply**. --->

1. From the drop-down list, select the **Defender_XDR_Ransomware_Playbook_SecOps_Tasks** playbook.

1. Select **Apply** at the bottom.

   > **Note:** The **Create new automation rule** window closes automatically after the rule is created. If the window does not close, select the **X** to close it.

You have now created a playbook and an automation rule in Microsoft Sentinel.

## Proceed to Exercise 2
