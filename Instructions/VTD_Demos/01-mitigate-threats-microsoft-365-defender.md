# Module 1 - Mitigate threats using Microsoft 365 Defender

**Note** Successful completion of this demo depends on completing all of the steps in the  [Pre-requisites document](00-prerequisites.md).

## Use the Microsoft Defender portal

In this task, you will familiarize yourself with the Microsoft 365 Defender portal capabilities.

- Home (Dashboard)
- Incidents & Alerts
- Hunting
- Action Center
- Threat analytics
- Secure Score
- Endpoints
- Vulnerability management
- Email & Collaboration
- Cloud apps
- Reports
- Settings
- Permissions

1. If you are not already at the Microsoft Defender Security Center in your browser, go to the Microsoft Defender Security Center at (https://security.microsoft.com) logged in as Admin for your tenant.

1. In the **Home** dashboard you can overall view of your secure status. You can customize the view by **Add cards** or removing cards. To remove a card, select the ellipsis (...) on a card.
1. Next select **Incidents & Alerts**. This will expand the menu choices below. This is where investigations are performed.
1. Do the same with **Hunting** to expose the **Advanced hunting** Query page. 
    1. You can run KQL queries here.
1. Selecting **Actions & Submissions** will expose the **Action Center** and **Submissions**
1. Select **Threat intelligence** and then **Threat analytics**. This page provides insights into the Common Vulnerabilities and Exposures (CVE) you need to track1. Select the **Secure Score** and explore the tabs. Take a look at **Recommended actions** here.
1. Select **Assets** and **Devices** for your `Device Inventory`. You can onboard devices here or work with an existing inventory.
1. Also under `Assets` are **Identities**
1. In the **Endpoints** section is **Vulnerability management**. `Vulnerability management` has a `Dashboard` where you can look review your Exposure score.
1. Another capability within **Endpoints** is **Evaluations & simulations**. The **Evaluation lab** allows you to setup isolated devices for exploring malware.
1. In the **Email & collaboration** section are the `Defender for Office 365` capabilities. **Investigations** is where you see results of Automated investigation and Response (AIR) threat investigations.
1. Also in **Email & collaboration** are **Polices & rules**. You will configure **Threat & Alert** polices here.
1. Scroll down to **Cloud apps**. This the **Microsoft Defender for Cloud Apps** service section. Under **App governance** is where you set app policies.
1. The next section is where you can find **Reports** for the Microsoft 365 Defender services, **AUdit**, is where you can enable recording of user admin activity, and **Permissions** and **Settings**.
1. In **Permissions** you can configure **Azure AD** and **Endpoint** roles.
1. **Settings** is where general configuration such as timezone and email notifications are entered, plus granular settings for Endpoints, Identities and Device discovery.
1. Select **Settings**, then **Endpoints**. You can view and add **Licenses** here. Next select **Advanced features**. Scroll thorough the list of features, but don't make any changes now.
1. Lastly, leave **Settings** and on the main, left menu list select **More resources**. You should see cards or tiles with links for **Microsoft Purview Compliance**, **Azure Active Directory** and other capabilities not directly part of **Microsoft 365 Defender**. Select the **Open** button for **Microsoft Purview Compliance**. This will open the compliance portal.

## Connect Microsoft Sentinel and Microsoft Defender XDR

In this task, you'll connect a Microsoft Sentinel workspace to Microsoft Defender XDR.

**Note:** There are capability differences between the Microsoft Defender XDR portal and the Microsoft Sentinel portal. The user interface experience and steps may differ from the lab instructions.

1. Log in to the **WIN1** virtual machine as *Admin* with the password: **Pa55w.rd**.  

1. Start the Microsoft Edge browser.

1. In the Edge browser, go to the Microsoft Defender XDR portal at <https://security.microsoft.com>.

1. In the **Sign in** dialog box, copy, and paste in the tenant Email account for the admin username provided by your lab hosting provider and then select **Next**.

1. In the **Enter password** dialog box, copy, and paste in the admin's tenant password provided by your lab hosting provider and then select **Sign in**.

    >**Tip:** The admin's tenant email account and password can be found on the Resources tab.

1. On the **Defender XDR** portal **Home** screen, you should see a banner at the top with the message, *Get your SIEM and XDR in one place*. Select the **Connect a workspaces** button.

1. On the *Choose a workspace* page, select the **Microsoft Sentinel** workspace you created earlier.

    >**Hint:** It should have a name like *uniquenameDefender*.

1. Select the **Next** button.

    >**Note:** if the *Next* button is disabled, or greyed out, and you see an error message that the Microsoft Sentinel workspace is *not onboarded* to Defender XDR, try refreshing the Defender XDR portal page as it may take 5 to 10 minutes to sync up.

1. On the *Review changes* page, verify that the *Workspace* selection is correct and review the bulleted items under the *What to expect when the workspace is connected* section. Select the **Connect** button.

1. You should see a *Connecting the workspace* message followed by a *Workspace successfully connected* message.

1. Select the **Close** button.

1. On the **Defender XDR** portal **Home** screen, you should see a banner at the top with the message, *Your unified SIEM and XDR is ready*. Select the **Start Hunting** button.

1. In *Advanced hunting*, you should see a message to "Explore your content from Sentinel". In the left menu pane, note the *Microsoft Sentinel* tables, functions, and queries under the corresponding tabs.

1. Expand the left main menu pane if collapsed and  expand the new **Microsoft Sentinel** menu items. You should see *Threat management*, *Content management* and *Configuration* selections.

 >**Note:** The syncronization between Microsoft Sentinel and Microsoft Defender XDR may take a few minutes to complete, so you may not see all the installed *Data connectors* for example.

## You have completed the lab.