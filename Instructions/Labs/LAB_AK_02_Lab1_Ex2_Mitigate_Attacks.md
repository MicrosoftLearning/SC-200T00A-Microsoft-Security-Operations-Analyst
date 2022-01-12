---
lab:
    title: 'Exercise 2 - Mitigate Attacks with Microsoft Defender for Endpoint'
    module: 'Module 2 - Mitigate threats using Microsoft Defender for Endpoint'
---

# Module 2 - Lab 1 - Exercise 2 - Mitigate Attacks with Microsoft Defender for Endpoint

## Lab scenario

You are a Security Operations Analyst working at a company that is implementing Microsoft Defender for Endpoint. Your manager plans to onboard a few devices to provide insight into required changes to the Security Operations (SecOps) team response procedures.

To explore the Defender for Endpoint attack mitigation capabilities, you will run two simulated attacks.


### Task 1: Simulated Attacks

In this task, you will run two simulated attacks to explore the capabilities of Microsoft Defender for Endpoint.

1. If you are not already at the Microsoft 365 Defender portal in your Microsoft Edge browser, go to (https://security.microsoft.com) and login as Admin for your tenant.

2. From the menu, under **Endpoints**, select **Evaluation & tutorials** and then select **Tutorials & simulations** from the left side.

3. Select the **Tutorials** tab and under *Automated investigation (backdoor)*, click **Read the walkthrough**. A new browser tab opens which includes instructions to perform the simulation.

4. In the new browser tab, locate the section named **Run the simulation** and follow the steps to run the attack. The steps should include: from the **Tutorials** tab, under *Automated investigation (backdoor)*, select **Get simulation file** to download the **RS4_WinATP-Intro-Invoice.docm** file. Continue to follow the steps from the browser tab to run the attack.

5. Within the **Tutorials** tab also run the *Automated investigation (fileless attack)* by clicking **Read the walkthrough** and follow the **Copy simulation script** section of the document.

6. In the Microsoft 365 Defender portal select **Incidents & alerts** from the left menu bar, then select **Incidents**.

7. A new incident called "Multi-stage incident..." will appear in the right pane. Allow at least 5 minutes for the incident to appear. Click the incident name to load its details.

8. Click **Manage incident** and a new window blade appears. In here, under *Incident tags* type "Tutorial" and click **Tutorial (Create new)** to create a new tag. Click the **Assign to me** switch and see your account name appears under it. Under *Classification*, click the drop-down menu and select **True alert**. Under *Determination*, click the drop-down menu and select **Security test**. Add any comments if desired and click **Save** to finish.

9. Review the contents of the Alerts, Devices, Users, Investigations, Evidence and Response, Graph tabs.

>**Warning:** The simulations and tutorials here are an excellent source of learning through practice.  Simulations and tutorials are being added and edited regularly in the portal.  However, some of these simulations & tutorials may interfere with performance of the labs designed for this training course.  Only perform the simulations and tutorials recommended in the instructions provided for this lab when using the course provided Azure tenant.  You may perform the other simulations and tutorials *after* this training course is complete with this tenant.

## You have completed the lab.
