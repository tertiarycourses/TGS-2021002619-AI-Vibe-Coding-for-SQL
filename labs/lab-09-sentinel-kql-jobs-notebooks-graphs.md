# Lab 9 - Hunt in Sentinel with KQL Queries, Jobs, Summary Rules, Notebooks, MCP, and Entity Graphs

## Objective

Create and monitor Sentinel hunting queries, KQL jobs, summary rule tables, notebooks, Sentinel Graph, and Sentinel MCP Server concepts.

## Scenario

Contoso wants longer-term hunting across Sentinel data lake and summarized data while using notebooks for repeatable investigations.

## Tasks

### Step 1 - Create hunting hypothesis

Use:

```text
If an attacker is moving laterally, then we may see unusual authentication patterns followed by remote execution events.
```

### Step 2 - Write Sentinel KQL query idea

Document query source tables and filters for sign-ins, process events, and network connections.

### Step 3 - Plan KQL job

Define:

- Query purpose
- Data lake scope
- Schedule
- Result table
- Review owner

### Step 4 - Plan summary rule table

Create:

| Summary table | Source query | Use case |
|---------------|--------------|----------|

### Step 5 - Describe notebooks, Graph, and MCP

Write notes on:

- Notebook use case
- Sentinel Graph entity relationship
- MCP server investigation support

## Deliverable

Submit hunting hypothesis, KQL query idea, KQL job plan, summary rule table plan, and notebook/Graph/MCP notes.

## Checkpoint questions

1. Why start with a hunting hypothesis?
2. What is the benefit of summary rules?
3. How can notebooks support repeatable hunting?

