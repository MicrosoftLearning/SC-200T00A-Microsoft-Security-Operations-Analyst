# Module 10 - Manage Incidents in Microsoft Defender XDR

## Manage Incidents in Microsoft Defender XDR

In this task, you will explore incident management capabilities in Microsoft Defender XDR, including incident investigation, response actions, and collaboration features.

>**Important:** This lab is designed to be run in the *Zava/Alpine Ski House* demo environment. Appropriate credentials are required for access.

### Key Areas Covered

- Incident Dashboard
- Incident Investigation
- Evidence and Response Actions
- Incident Management Workflows
- Collaboration and Documentation

1. If you are not already at the Microsoft Defender portal in your browser, go to the Microsoft Defender portal at (<https://security.microsoft.com>) and sign in using your assigned credentials.

1. In the left navigation pane, expand the **Investigation & response** section and select **Incidents & alerts** > **Incidents**. This will display the incident queue showing all active incidents across your environment.

1. Review the incident queue interface:
   - Filter options (Status, Assigned to, Tags, etc.)
   - Incident priority and severity indicators
   - Service sources (Defender for Endpoint, Office 365, etc.)
   - Last activity timestamps

1. Select an incident from the list to open the incident details page. Note the incident overview showing:
   - Incident timeline
   - Affected assets (users, devices, mailboxes)
   - Alert details and correlation
   - MITRE ATT&CK tactics and techniques

## Incident Investigation Process

1. In the incident details, explore the **Alerts** tab to see all related alerts that comprise this incident.
   - Review alert correlation and automatic grouping
   - Examine alert evidence and artifacts
   - Note the confidence levels and detection sources

1. Select the **Devices** tab to view all affected endpoints:
   - Device risk levels
   - Investigation priority scores
   - Device timeline of activities
   - Available response actions

1. Navigate to the **Users** tab to review affected user accounts:
   - User risk assessments
   - Sign-in activities and anomalies
   - Account compromise indicators

1. Examine the **Mailboxes** tab (if applicable) for email-related incidents:
   - Email flow and delivery details
   - Attachment and URL analysis
   - Recipient impact assessment

## Evidence Analysis and Response Actions

1. In the **Evidence** tab, review all collected evidence:
   - Files and file hashes
   - IP addresses and domains
   - Registry keys and processes
   - Email messages and URLs

1. For each evidence item, explore available actions:
   - **Submit for analysis** - Send suspicious files to Microsoft for deep analysis
   - **Add to indicators** - Create custom threat indicators
   - **Block/Allow** - Take immediate protective actions

1. Demonstrate response actions by selecting a device and choosing from available actions:
   - **Isolate device** - Disconnect device from network while maintaining connectivity to Defender
   - **Run antivirus scan** - Initiate full or quick scan
   - **Collect investigation package** - Gather forensic data
   - **Restrict app execution** - Limit application execution on the device

## Incident Management and Workflow

1. Practice incident assignment and management:
   - **Assign incident** - Assign to specific analyst or security team
   - **Change status** - Update from Active to Resolved or other statuses
   - **Add tags** - Apply custom tags for categorization and tracking
   - **Set classification** - Mark as True positive, False positive, or Informational

1. Explore the incident management workflow:
   - Review **Comments** tab for analyst collaboration
   - Check **History** tab for all actions taken
   - Use **Summary** tab for executive reporting

1. Demonstrate the incident grading process:
   - **True Positive** - Confirmed malicious activity requiring response
   - **Informational** - Expected activity that triggered detection
   - **False Positive** - Benign activity incorrectly flagged

## Advanced Incident Features

1. Explore **Automated Investigation** results (if available):
   - Review AI-driven investigation findings
   - Examine recommended actions
   - Approve or reject automated remediation

1. Navigate to **Threat Analytics** integration:
   - Link incidents to known threat campaigns
   - Review threat intelligence context
   - Access analyst reports and IOCs

1. Demonstrate **Custom Detection Rules** impact:
   - Show how custom rules contribute to incident creation
   - Review rule effectiveness and tuning opportunities
   - Access rule modification and testing options

## Incident Reporting and Metrics

1. Access incident reporting capabilities:
   - Navigate to **Reports** > **Security Report**
   - Review incident trends and statistics
   - Generate executive summary reports

1. Explore incident metrics and KPIs:
   - Mean Time to Detection (MTTD)
   - Mean Time to Response (MTTR)
   - Incident volume trends
   - False positive rates

1. Set up incident notifications:
   - Configure email alerts for high-priority incidents
   - Set up teams integration for collaborative response
   - Create custom notification rules based on incident criteria

## Best Practices for Incident Management

1. **Prioritization Strategy**:
   - Focus on high-severity incidents first
   - Consider business impact and asset criticality
   - Use risk scoring to guide investigation efforts

1. **Documentation Standards**:
   - Maintain detailed investigation notes
   - Document all response actions taken
   - Record lessons learned and improvement opportunities

1. **Team Collaboration**:
   - Use consistent tagging and classification schemes
   - Establish clear escalation procedures
   - Implement regular incident review processes

1. **Continuous Improvement**:
   - Regularly review false positive rates
   - Tune detection rules based on incident outcomes
   - Update incident response playbooks based on findings

## Integration with Microsoft Sentinel

1. If Microsoft Sentinel is connected, demonstrate unified incident management:
   - Cross-platform incident correlation
   - Unified investigation experience
   - Shared threat intelligence and indicators

1. Show Sentinel-specific incident features:
   - Investigation graph visualization
   - Custom playbook automation
   - Advanced hunting across environments

## You have completed the demo

---

**Additional Resources:**

- [Microsoft Defender XDR Incident Management](https://docs.microsoft.com/microsoft-365/security/defender/manage-incidents)
- [Incident Response Playbooks](https://docs.microsoft.com/security/compass/incident-response-playbooks)
- [MITRE ATT&CK Framework](https://attack.mitre.org/)
