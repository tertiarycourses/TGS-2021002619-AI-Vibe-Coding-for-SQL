# Lab 4 - Configure Detections with Advanced Hunting, Custom Rules, Sentinel Analytics, MITRE, and Anomalies

## Objective

Configure or design custom detections in Defender XDR and analytics rules in Sentinel, mapped to MITRE ATT&CK and anomalies.

## Scenario

Contoso wants detections for phishing, impossible travel, suspicious PowerShell, and lateral movement.

## Tasks

### Step 1 - Define detection requirements

Create:

| Threat | Signal | Tool | MITRE tactic |
|--------|--------|------|--------------|

### Step 2 - Write Defender XDR hunting query idea

Example:

```kusto
DeviceProcessEvents
| where ProcessCommandLine has_any ("-enc", "IEX", "DownloadString")
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
```

### Step 3 - Design custom detection rule

Document:

- Query
- Frequency
- Alert title
- Entity mapping
- Severity
- Response action

### Step 4 - Design Sentinel analytics rules

Compare scheduled, near-real-time, threat intelligence, and machine learning rules.

### Step 5 - Plan anomaly review

Define:

- Anomaly source
- Analyst validation
- Suppression condition
- Escalation rule

## Deliverable

Submit detection requirements, hunting query, custom detection design, Sentinel analytics rule comparison, and anomaly review plan.

## Checkpoint questions

1. Why map detections to MITRE ATT&CK?
2. When is NRT useful?
3. What risk exists with noisy detections?

