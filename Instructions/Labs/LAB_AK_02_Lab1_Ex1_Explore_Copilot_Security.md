---
lab:
    title: 'Exercise 1 - Explore use cases in Microsoft Copilot for Security'
    module: 'Learning Path 2 - Mitigate threats using Microsoft Copilot for Security'
---

# Learning Path 2 - Lab 1 - Exercise 1 - Explore Microsoft Copilot for Security

## Lab scenario

The organization you work for wants to increase the efficiency and capabilities for its security operations analysts, and to improve security outcomes. In support of that objective, the office of the CISO determined that deploying Microsoft Copilot for Security is a key step towards that objective. As a Security administrator for your organization, you're tasked with setting up Copilot.

In this exercise, you go through the *first run experience* of Microsoft Copilot for Security to provision Copilot with one security compute unit (SCU).

>**Note:**
> The environment for this exercise is a simulation generated from the product. As a limited simulation, links on a page may not be enabled and text-based inputs that fall outside of the specified script may not be supported. A pop-up message will display stating, "This feature is not available within the simulation." When this occurs, select OK and continue the exercise steps.  
>:::image type="content" source="../media/simulation-pop-up-error.png" alt-text="Screenshot of pop-up screen indicating that this feature is not available within the simulation.":::

### Task 1: Provision Microsoft Copilot for Security

For this exercise, you're logged in as Avery Howard and you have the global administrator role in Microsoft Entra. You'll work in both the Azure portal and Microsoft Copilot for Security.

This exercise should take approximately **15** minutes to complete.

>**Note:**
> When a lab instruction calls for opening a link to the simulated environment, it is generally recommended that you open the link in a new browser window so that you can simultaneously view the instructions and the exercise environment. To do so, select the right mouse key and select the option.

Before users can start using Copilot, admins need to provision and allocate capacity. To provision capacity:

- You must have an Azure subscription.
- You need to be an Azure owner or Azure contributor, at a resource group level, as a minimum.

In this task, you walk through the process of ensuring you have the appropriate role permissions. This starts by enabling access management for Azure resources.

Once you're assigned the User Access Administrator role in Azure, you can assign a user the necessary access to provision SCUs for Copilot.  For the purpose of this exercise only, which is to show you the steps involved,  you will be assigning yourself the necessary access.  The steps that follow will guide you through the process.

1. Open the simulated environment by selecting this link: **[Azure portal](https://app.highlights.guide/start/6373500f-1f10-4584-a14e-ca0b4aa7399f?link=1&token=40f793d4-2956-40a4-b11a-6b3d4f92557f&azure-portal=true)**.

1. You'll start by enabling Access management for Azure resources. To access this setting:
    1. From the Azure portal, select **Microsoft Entra ID**.
    1. From the left navigation panel, expand **Manage**.
    1. From the left navigation panel, scroll down and select **Properties**.
    1. Enable the toggle switch for **Access management for Azure resources**, then select **Save**.

1. Now that you can view all resources and assign access in any subscription or management group in the directory, assign yourself the Owner role for the Azure subscription.
    1. From the blue banner on the top of the page, select **Microsoft Azure** to return to the landing page of the Azure portal.
    1. Select **Subscriptions** then select the subscription listed **Woodgrove - GTP Demos (Exernal/Sponsored)**.
    1. Select **Access control (IAM)**.
    1. Select **Add**, then **Add role assignment**.
    1. From the Role tab, select **Privileged administrator roles**.
    1. Select **Owner**, then select **Next**.
    1. Select **+ Select members**.
    1. Avery Howard is the first name on this list, select the **+** to the right of the name.  Avery Howard is now listed under selected members. Select the **Select** button, then select **Next**.
    1. Select **Allow user to assign all roles except privileged administrator roles, Owner, UAA, RBAC (Recommended)**.
    1. Select **Review + assign**, then select **Review + assign** one last time.

As an owner to the Azure subscription, you'll now be able to provision capacity within Copilot.

#### Task: Provision capacity

In this task, you go through the steps of provisioning capacity for your organization. There are two options for provisioning capacity:

- Provision capacity within Copilot for Security (recommended)
- Provision capacity through Azure

For this exercise, you provision capacity through Copilot for Security. When you first open Copilot for Security, a wizard guides you through the steps in setting up capacity for your organization.

1. Open the simulated environment by selecting this link: **[Microsoft Copilot for Security](https://app.highlights.guide/start/6373500f-1f10-4584-a14e-ca0b4aa7399f?link=0&token=40f793d4-2956-40a4-b11a-6b3d4f92557f&azure-portal=true)**.

1. Follow the steps in the Wizard, select **Get started**.
1. On this page, you set up your security capacity. For any of the fields listed below, you can select the information icon for more information.
    1. Azure subscription: From the drop-down, select **Woodgrove - GTP Demos (External/Sponsored)**.
    1. Resource group: From the drop-down, select **RG-1**.
    1. Capacity name: Enter a capacity name.
    1. Prompt evaluation location [Geo]: From the drop-down, select your region.
    1. You can choose whether you want to select the option, "If this location has too much traffic, allow Copilot to evaluate prompts anywhere in the world (recommended for optimal performance).
    1. Capacity region is set based on location selected.
    1. Security compute: This field is automatically populated with the minimum required SCU units, which is 1. Leave  field with the value of **1**.
    1. Select the box, **"I acknowledge that I have read, understood, and agree to the Terms and Conditions**.
    1. Select **Continue** on the bottom right corner of the page.

1. The wizard displays information about where your customer data will be stored. The region displayed is based on the region you selected in the Prompt evaluation field. Select **Continue**.

1. You can select options to help improve Copilot. You can select the toggle based on your preferences.  Select **Continue**.

1. As part of the initial setup, Copilot provides contributor access to everyone by default and includes Global administrators and Security administrators as Copilot owners. In your production environment, you can change who has access to Copilot, once you've completed the initial setup. Select **Continue**.
1. You're all set! Select **Finish**.
1. Close the browser tab, as the next exercise will use a separate link to the lab-like environment.

#### Review

In this exercise, you successfully provisioned Copilot for Security. You're now ready to move to the next exercise where you'll explore the core functionality of Microsoft Copilot for Security.