---
lab:
    title: 'Exercise 2 - Mitigate Attacks with Microsoft Defender for Endpoint'
    module: 'Learning Path 2 - Mitigate threats using Microsoft Defender for Endpoint'
---

# Learning Path 2 - Lab 1 - Exercise 2 - Mitigate Attacks with Microsoft Defender for Endpoint

## Lab scenario

![Lab overview.](../Media/SC-200-Lab_Diagrams_Mod2_L1_Ex2_10_19.png)


You are a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.

To explore the Defender for Endpoint attack mitigation capabilities, you will run two simulated attacks.


>**Note:** An **[interactive lab simulation](https://mslabs.cloudguides.com/guides/SC-200%20Lab%20Simulation%20-%20Mitigate%20attacks%20with%20Microsoft%20Defender%20for%20Endpoint)** is available that allows you to click through this lab at your own pace. You may find slight differences between the interactive simulation and the hosted lab, but the core concepts and ideas being demonstrated are the same. 


### Task 1: Verify Device onboarding

In this task, you will confirm that the device is onboarded successfully and create a test alert.

1. If you are not already at the Microsoft 365 Defender portal in your Microsoft Edge browser, go to (https://security.microsoft.com) and login as Admin for your tenant.

1. In the left-hand menu, under the **Assets** area, select **Devices**. Please wait until WIN1 appears in the Devices page before you continue. Otherwise, you might need to repeat this task to see the alerts that will be generated later.

    >**Note:** If you have completed the onboarding process and don't see devices in the Devices list after an hour, it might indicate an onboarding or connectivity problem.

1. Select **Settings** from the left menu bar, then from the Settings page select **Endpoints**.

1. Select **Onboarding** in the Device management section and make sure *"Windows 10 and 11"* is selected as operating system. The *"First device onboarded"* message now shows *Completed*.

1. Scroll down and under the section *"2. Run a detection test"*, copy the detection test script by selecting the **Copy** button.  

1. In the windows search bar of the WIN1 virtual machine, type **CMD** and choose to **Run as Administrator** on the right pane for the Command Prompt app. 

1. When the "User Account Control" window is shown, select **Yes** to allow the app to run. 

1. Paste the script by right-clicking in the **Administrator: Command Prompt** windows and press **Enter** to run it. **Note:** The window closes automatically after running the script.


### Task 2: Simulated Attacks
**Note:** The evaluation lab environment has been set to be removed by end of January 2024.  If the Tutorials are not available, please complete the Interactive lab simulation by clicking the link above.

In this task, you will run two simulated attacks to explore the capabilities of Microsoft Defender for Endpoint.

1. From the left menu, under **Endpoints**, select **Evaluation & tutorials** and then select **Tutorials & simulations** from the left side.

1. Select the **Tutorials** tab.

1. Under *Automated investigation (backdoor)* you will see a message describing the scenario. Below this paragraph, click **Read the walkthrough**. A new browser tab opens which includes instructions to perform the simulation.

1. In the new browser tab, locate the section named **Run the simulation** (page 5, starting at step 2) and follow the steps to run the attack. **Hint:** The simulation file *RS4_WinATP-Intro-Invoice.docm* can be found back in portal, just below the **Read the walkthrough** you selected in the previous step by selecting the **Get simulation file** button. 

<!--- 1. Repeat the last 3 steps to run another tutorial, *Automated investigation (fileless attack)*. This is no longer working due to win1 AV --->


### Task 3: Investigate the Attacks

1. In the Microsoft 365 Defender portal select **Incidents & alerts** from the left menu bar, then select **Incidents**.

1. A new incident called "Multi-stage incident..." is in the right pane. Select the incident name to load its details.

    >**Note:** An incident called "Suspicious..." might appear first. This will later be replaced with the aforementioned incident when Microsoft 365 Defender correlates them a single security issue, including the original test alert created in Task 1.

1. Select the **Manage incident** button and a new window blade appears. 

1. Under **Incident tags** type "Tutorial" and select **Tutorial (Create new)** to create a new tag. 

1. Select the toggle **Assign to**  and add your user account (Me) as owner of the incident. 

1. Under **Classification**, expand the drop-down menu. 

1. Under **Informational, expected activity**, select **Security testing**. 

1. Add any comments if desired and select **Save** to update the incident and finish.

1. Review the contents of the *Attack story, Alerts, Assets, Investigations, Evidence and Response*, and *Summary* tabs. Devices and Users are under the *Assets* tab. The *Attack story* tab displays the *Incident graph*. The **Hint:** Some tabs might be hidden due the size of your display. Select the ellipsis tab (...) to make them appear.

>**Warning:** The simulations and tutorials here are an excellent source of learning through practice.  Simulations and tutorials are being added and edited regularly in the portal.  However, some of these simulations & tutorials may interfere with performance of the labs designed for this training course.  Only perform the simulations and tutorials recommended in the instructions provided for this lab when using the course provided Azure tenant.  You may perform the other simulations and tutorials *after* this training course is complete with this tenant.

## You have completed the lab.
