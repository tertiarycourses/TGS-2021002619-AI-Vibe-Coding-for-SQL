# Lab 8 - Hunt in Defender XDR with KQL, Advanced Hunting Tables, Threat Analytics, and Blast Radius

## Objective

Use Defender XDR Advanced Hunting tables and KQL to hunt threats, interpret threat analytics, and create hunting graphs or blast radius views.

## Scenario

Threat analytics reports active phishing and suspicious script execution campaigns. Analysts need proactive hunts.

## Tasks

### Step 1 - Select hunting tables

Create:

| Question | Table |
|----------|-------|

Include DeviceProcessEvents, DeviceNetworkEvents, EmailEvents, IdentityLogonEvents, CloudAppEvents, and AlertInfo.

### Step 2 - Write KQL hunting queries

Create queries for:

- Suspicious encoded PowerShell
- Emails with malicious URLs
- Impossible travel or risky sign-ins
- Rare process execution

### Step 3 - Interpret threat analytics

Document:

- Threat name
- Recommended queries
- Affected assets
- Mitigation guidance

### Step 4 - Build blast radius view

Create an entity relationship table:

| Entity | Related entity | Evidence |
|--------|----------------|----------|

### Step 5 - Convert hunt to detection

Define when a hunting query should become a custom detection.

## Deliverable

Submit table selection map, KQL query pack, threat analytics notes, blast radius table, and detection conversion criteria.

## Checkpoint questions

1. Why must you choose the right Advanced Hunting table?
2. What makes a hunting query suitable for detection?
3. How does blast radius analysis help response?

