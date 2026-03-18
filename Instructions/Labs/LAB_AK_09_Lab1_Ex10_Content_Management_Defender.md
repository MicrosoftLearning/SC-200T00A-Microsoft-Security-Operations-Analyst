---
lab:
    title: 'Exercise 10 - Use Repositories in Microsoft Sentinel'
    module: 'Learning Path 9 - Create detections and perform investigations using Microsoft Sentinel'
---

# Learning Path 9 - Lab 1 - Exercise 10 - Use Repositories in Microsoft Sentinel

## Lab scenario

You are a Security Operations Analyst working at a company that implemented Microsoft Sentinel. You already created Scheduled and Microsoft Security Analytics rules.  You need to centralize analytical rules in an Azure DevOps repository.  Then connect Sentinel to the Azure DevOps repository and import the content. 

>**Important:** The lab exercises for Learning Path #9 are in a *standalone* environment. If you exit the lab before completing it, you will be required to re-run the configurations again.

### Estimated time to complete this lab: 30 minutes

### Task 1: Create and export an analytical rule

In this task, you will enable Entity behavior analytics in Microsoft Sentinel.

>**Note:** Microsoft Sentinel has been predeployed in your Azure subscription with the name **sentinelworkspace-01**, and the required *Content Hub* solutions have been installed.

1. Log in to WIN1 virtual machine as Admin with the password: **Pa55w.rd**.  

1. Open the Microsoft Edge browser.

1. In the Edge browser, navigate to Microsoft Defender XDR at <https://security.microsoft.com>.

1. In the **Sign in** dialog box, copy, and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

    >**Note:** You may be prompted to enter the *Temporary Access Pass* (TAP) instead of a password. This is also provided in the resources tab. If prompted, copy and paste the TAP value and select **Sign in**.

1. In the Microsoft Defender navigation menu, scroll down and expand the **Microsoft Sentinel** section.

1. Expand the **Configuration** section and select **Analytics**.

1. Select the **Startup RegKey** rule that you created earlier.

1. Select the **Export** from the toolbar. **Hint:** You might need to select the ellipsis icon **(...)** to see it.

1. The rule is exported to a text file named *Azure_Sentinel_analytic_rule.json*.

1. Select **Open file** below the name of the downloaded file and then select **More apps**.

1. Select **Notepad** and then select **OK**.

1. Review the Azure Resource Manager template and the close it when done.

### Task 2: Create our Azure DevOps environment

In this task, you will create an Azure DevOps repository.

1. Open another tab in the browser and navigate to <https://aexprodcus1.vsaex.visualstudio.com/me?mkt=en-US>.

1. After verifying your account, on the *We need a few more details* page, select **Continue**.

1. You should automatically be redirected to your student profile page, and see the **My Sentinel Content-studentnumber** project listed under the *dev.azure.com/ADOCourseOrg01* organization.

1. Select the **My Sentinel Content-studentnumber** project link to open the project. This should open another tab in the browser for the project.

1. Navigate and select **Repos** on the left pane.

1. At the bottom of the page in the area *Initialize main branch with a README or gitignore*, select **Initialize**.

1. The page should show the Files for the Repo.  the only file is README.md.

1. On the Files (right side of the page) pane, Contents tab, the toolbar include options *Set up build*, *Clone*, and three vertical dots (*More options*). Select the three vertical dots to show *More options*.

1. Select **Upload Files**.

1. Select **Browse** and select the file **Azure_Sentinel_analytic_rule.json** from your *Downloads* directory, and select **Open**.

1. Select **Commit**.

1. Select **Azure DevOps** on the top left corner of the page.  This displays your organization and projects.

1. Select **Organization settings** from the bottom left of the page.

1. Select **Policies** under the *Security* area of the left blade.

1. Verify that the *Third-party application access via OAuth* under the *Application connection policies* area is set to **On**.

### Task 3: Connect Sentinel to Azure DevOps.

In this task, you will connect Microsoft Sentinel to the Azure DevOps repository you created in the previous task and import the content.

1. In Microsoft Sentinel, select **Repositories** in the *Content Management* section.

1. Select **+ Add new** button from the *Continuous deployment* toolbar.

1. For the name enter **My Content**.

    >**Note:** You may want to choose a more descriptive name for your repository to distinguish it from other users' repositories.

1. For Source control, select **Azure DevOps**.

1. Select **Authorize**.

1. Select the Organization created earlier (e.g. ADOCourseOrg01).

1. Select the Project you created earlier, *My Sentinel Content-studentnumber*.

1. Select the Repository you created earlier, *My Sentinel Content-studentnumber*. **Hint:** You might need to scroll down within the drop-down to see the repository.

1. Select the Branch **main**. **Hint:** You might need to scroll down within the drop-down to see the branch.

1. Select all content types.

1. Then select **Create**.

1. On the *Repositories* page, select **Refresh**. Wait until *Last deployment status* is *Succeeded*.  

1. Select the *My Content* repository and in the *fly-out* window, review the *Content types* and *Last deployment status*.

1. Select the **Delete** button from the *Continuous deployment* toolbar.

1. Select **Authorize** when prompted.
 
    >**Note:** We're deleting this repository connection to clean up after the lab.

## You have completed the lab.
