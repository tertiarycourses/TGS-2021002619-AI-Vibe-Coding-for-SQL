# Learner Guide - Microsoft Security Operations Analyst (SC-200)

## Course information

- **Course code:** TGS-2024042604
- **Course title:** Microsoft Security Operations Analyst (SC-200)
- **Registration:** https://www.tertiarycourses.com.sg/wsq-microsoft-security-operations-analyst-sc-200.html
- **Exam reference:** https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/sc-200

## Course goal

This learner guide helps you practise the role of a Microsoft security operations analyst. You will configure security operations tooling, respond to alerts and incidents, investigate Microsoft 365 and cloud activity, write KQL hunting queries, design automation, and prepare for the current SC-200 exam objectives.

## Current Microsoft guide note

Microsoft Learn lists SC-200 skills measured as of **July 28, 2026**. The current objectives emphasize managing a security operations environment, responding to incidents, and performing threat hunting across Microsoft Defender XDR, Microsoft Sentinel, Microsoft Entra ID, Microsoft Purview, Defender for Cloud, and related workloads.

## Learning outcomes

By the end of the labs, you should be able to:

1. Configure Microsoft Defender XDR notifications, alert tuning, advanced features, ASR, automated investigation and response, and attack disruption.
2. Configure Microsoft Sentinel roles, retention, workbooks, platform optimization, and SOC optimization recommendations.
3. Select and configure Sentinel data connectors, AMA data collection rules, WEF, Syslog, CEF, Azure diagnostics, threat indicators, and custom log tables.
4. Configure detections using Defender XDR Advanced Hunting, custom detections, Sentinel analytics rules, MITRE ATT&CK, and anomalies.
5. Investigate Microsoft Defender XDR and Sentinel incidents, manage cases, and use agentic AI or Security Copilot prompts responsibly.
6. Investigate endpoint incidents using device timeline, live response, evidence, entity investigation, and investigation packages.
7. Investigate Microsoft 365 threats using Microsoft Purview Audit, eDiscovery Content search, Microsoft Graph activity logs, Entra ID, Defender for Identity, Defender for Cloud Apps, and Defender for Cloud.
8. Hunt for threats with KQL in Defender XDR and Microsoft Sentinel.
9. Use hunting graphs, Sentinel Graph, KQL jobs, summary rule tables, notebooks, and MCP server concepts.
10. Design playbooks, incident runbooks, SOC metrics, and an SC-200 readiness tracker.

## Suggested schedule

### Day 1 - Security operations environment and detections

| Time | Activity |
|------|----------|
| 09:00 - 09:30 | Course briefing, SC-200 current objectives, SOC scenario setup |
| 09:30 - 10:45 | Lab 1 - Defender XDR automation, notifications, ASR, AIR, attack disruption |
| 10:45 - 11:00 | Break |
| 11:00 - 12:15 | Lab 2 - Sentinel roles, retention, workbooks, SOC optimization |
| 12:15 - 13:15 | Lunch |
| 13:15 - 14:30 | Lab 3 - Sentinel data ingestion and connectors |
| 14:30 - 14:45 | Break |
| 14:45 - 16:00 | Lab 4 - Detections, analytics, MITRE, anomalies |
| 16:00 - 17:00 | Lab 5 - Defender XDR incident investigation and case management |

### Day 2 - Incident response, hunting, automation, and readiness

| Time | Activity |
|------|----------|
| 09:00 - 10:15 | Lab 6 - Endpoint timeline, live response, evidence |
| 10:15 - 10:30 | Break |
| 10:30 - 11:45 | Lab 7 - Microsoft 365, Purview, Entra, Graph investigation |
| 11:45 - 12:45 | Lunch |
| 12:45 - 14:00 | Lab 8 - Defender XDR KQL hunting |
| 14:00 - 15:15 | Lab 9 - Sentinel KQL jobs, notebooks, graphs |
| 15:15 - 15:30 | Break |
| 15:30 - 16:45 | Lab 10 - Automation playbooks, SOC metrics, readiness |
| 16:45 - 17:00 | Exam readiness review and next steps |

## Case study used throughout the labs

You are a security operations analyst for **Contoso Global Services**, a mid-sized organization with Microsoft 365 E5, Azure workloads, Windows endpoints, Linux servers, SaaS applications, and a small hybrid footprint.

Recent concerns:

- A phishing campaign caused suspicious inbox rules and risky sign-ins.
- Several endpoints triggered malware and lateral movement alerts.
- Azure diagnostics and Linux syslog are not fully ingested into Sentinel.
- Analysts need KQL queries, workbooks, analytics rules, and automation playbooks.
- SOC leadership wants measurable incident response and hunting outcomes.

## Lab deliverables

Each lab produces one or more artifacts:

- Security operations configuration checklist
- Sentinel workspace and data ingestion plan
- Detection engineering table
- Incident investigation timeline
- Endpoint response checklist
- Microsoft 365 investigation worksheet
- KQL query pack
- Hunting hypothesis and results table
- Playbook and SOC metrics plan
- SC-200 readiness tracker

## Recommended learner folder

```text
SC-200-Learner-Work/
  screenshots/
  kql/
  notes/
  lab-01-defender-xdr.md
  lab-02-sentinel-platform.md
  lab-03-data-ingestion.md
  lab-04-detections.md
  lab-05-incident-response.md
  lab-06-endpoint-response.md
  lab-07-m365-investigation.md
  lab-08-defender-hunting.md
  lab-09-sentinel-hunting.md
  lab-10-readiness.md
```

## How to complete each lab

1. Read the scenario and objective.
2. Use a Microsoft security tenant if available.
3. If tenant access is unavailable, complete the design worksheet and KQL sections from documentation.
4. Record assumptions, queries, screenshots, and investigation notes.
5. Answer checkpoint questions.
6. Save each deliverable for the final runbook and readiness review.

## Exam preparation guidance

For SC-200, focus on:

- Knowing where each Microsoft security signal lives.
- Understanding Sentinel connector and analytics rule choices.
- Writing and interpreting KQL.
- Following incident response workflow with evidence and remediation.
- Using Defender XDR and Sentinel together.
- Designing automation that supports analyst decisions.

## Final capstone expectation

At the end of Lab 10, you should have:

- SOC platform configuration checklist
- Detection engineering plan
- Incident response runbook
- Endpoint response checklist
- Microsoft 365 investigation workflow
- KQL hunting pack
- Automation playbook plan
- SOC metrics dashboard outline
- SC-200 readiness tracker

