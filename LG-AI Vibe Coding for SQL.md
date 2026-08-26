# AI Vibe Coding for SQL — Learner Guide

**TGS-2021002619 · Version v1.0 · 27 August 2026**

## Course Overview

The slide deck teaches mechanisms and evidence. This guide and the lab folders contain the detailed procedures.

## Topic 01 — AI-Assisted SQL Data Modelling and Database Design

Requirements to normalised relational schemas, constraints and safe AI prompt contracts

### Lab 1 — Prompt-to-Schema Design Studio

**Alignment:** LO1 · K1–K3 · A1–A4

Model a Singapore retail ordering workflow from an ambiguous business brief.

**AI prompt**

Act as a senior SQLite data modeller. From the requirements below, return: assumptions; entities and cardinalities; 3NF tables; SQLite DDL with explicit PK, FK, NOT NULL, UNIQUE and CHECK constraints; five adversarial test cases. Do not invent fields. Mark every uncertainty as NEEDS_CONFIRMATION.

**Detailed step-by-step**

1. Read REQUIREMENTS.md and identify entities, events, rules and unknowns.
2. Paste the supplied prompt into an approved AI assistant and review its assumptions before any DDL.
3. Edit schema.sql so every business invariant has a SQLite constraint or an explicit application check.
4. Start the local server, open the app and run the schema-inspection query.
5. Execute the adversarial inserts in tests.sql and record which constraint blocks each invalid row.
6. Save the final prompt, corrected DDL and validation evidence in evidence.md.

```sql
SELECT name, sql FROM sqlite_master WHERE type='table' ORDER BY name;
```

**Acceptance:** Invalid email, negative price and orphan order rows are rejected; valid sample rows insert successfully.

**Troubleshooting:** AI invents fields or omits constraints → restate the data contract and require a requirement-to-column trace.

### Lab 2 — SQLite To-Do List Web App

**Alignment:** LO1 · LO2 · A1–A6

Build a personal work queue with priorities, due dates and completion state.

**AI prompt**

Generate SQLite DDL and parameterised CRUD statements for a tasks table with title, priority, due_date, completed and created_at. Enforce allowed priorities and completed as 0/1. Return SQL only, then list five tests separately.

**Detailed step-by-step**

1. Serve the folder with python3 -m http.server 8000; do not open index.html directly.
2. Open the app and inspect the seeded task list and status counters.
3. Add three tasks covering all priorities and one blank-title attempt.
4. Toggle one task complete and delete another; verify the counters and sorted list change.
5. Open the SQL console and run the supplied analysis query.
6. Export todo.db, refresh the browser, import the file and verify row-level persistence.

```sql
SELECT id,title,priority,due_date,completed FROM tasks ORDER BY completed, CASE priority WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END, due_date;
```

**Acceptance:** Add, complete and delete tasks; export the database, reload the page, import it and recover the same rows.

**Troubleshooting:** Unsafe string concatenation or missing domain checks → replace with bound parameters and CHECK constraints.

### Lab 3 — Customer and Order Relationship Lab

**Alignment:** LO1 · K2–K3 · A1–A4

Turn spreadsheet-style customer and order data into a clean relational model.

**AI prompt**

Review these customer/order columns. Identify repeating groups and dependencies, propose a 3NF SQLite design, state the grain of each table, and provide DDL plus orphan-key tests. Preserve source identifiers for reconciliation.

**Detailed step-by-step**

1. Profile the flat source rows and mark repeating customer/product values.
2. Use the AI prompt to propose tables, but reject any entity not supported by the source.
3. Create schema.sql with foreign_keys enabled and explicit ON DELETE behaviour.
4. Load seed.sql in the browser app and inspect table row counts.
5. Run the three-table revenue join and compare the total to CONTROL_TOTALS.md.
6. Attempt an orphan order item and capture the foreign-key failure in evidence.md.

```sql
SELECT c.name, COUNT(DISTINCT o.id) orders, ROUND(SUM(oi.qty*oi.unit_price),2) revenue FROM customers c JOIN orders o ON o.customer_id=c.id JOIN order_items oi ON oi.order_id=o.id GROUP BY c.id,c.name ORDER BY revenue DESC;
```

**Acceptance:** The revenue total matches the seed control total and every order item resolves to one order and one product.

**Troubleshooting:** Join duplicates inflate revenue → aggregate at order-item grain and verify keys before summing.

## Topic 02 — SQL Data Processing, Querying and Analysis

CRUD, predicates, joins, parameter binding and evidence-led correction of AI-generated queries

### Lab 4 — Inventory CRUD Web App

**Alignment:** LO2 · K4 · A5–A6

Manage stock levels for a small Singapore retailer without allowing negative inventory.

**AI prompt**

Produce parameterised SQLite CRUD statements for products. A stock adjustment must be atomic, reject negative resulting stock, and return the updated row. Include a transaction and rollback path.

**Detailed step-by-step**

1. Open the inventory app and filter products by name or SKU.
2. Add a new product using a unique SKU and positive price.
3. Adjust stock upward, then downward within the available balance.
4. Attempt a withdrawal that would make stock negative and verify no row changes.
5. Run the low-stock query and compare badges with query results.
6. Export the database and save an evidence screenshot plus the final SQL prompt.

```sql
SELECT sku,name,stock,reorder_level, CASE WHEN stock<=reorder_level THEN 'REORDER' ELSE 'OK' END status FROM products ORDER BY status DESC, stock;
```

**Acceptance:** Positive and negative adjustments update one row; an adjustment below zero is rolled back.

**Troubleshooting:** Read-modify-write race or negative balance → use one guarded UPDATE inside a transaction and check changes().

### Lab 5 — Order Query and Filter Explorer

**Alignment:** LO2 · K4 · A5–A6

Answer operations questions using SELECT, WHERE, ORDER BY, LIMIT and date filters.

**AI prompt**

Given this schema and business question, generate one SQLite SELECT using named parameters. Explain predicate selectivity and null behaviour. Provide a second query that proves the result is complete.

**Detailed step-by-step**

1. Inspect the orders data dictionary and the business questions in TASKS.md.
2. Prompt the AI for a parameterised query and challenge its assumptions about nulls and dates.
3. Run the query with the supplied values in the app console.
4. Change one parameter at a time and predict the row-count change before executing.
5. Run the control COUNT query and reconcile filtered rows.
6. Save the corrected query set and a short explanation of each predicate.

```sql
SELECT order_no,customer_name,status,total,order_date FROM orders WHERE status='Paid' AND order_date>='2026-08-01' ORDER BY total DESC LIMIT 10;
```

**Acceptance:** Results satisfy every predicate, sort descending and match an independent COUNT control query.

**Troubleshooting:** NULL rows disappear unexpectedly → state three-valued logic and test IS NULL explicitly.

### Lab 6 — Service Desk Join Lab

**Alignment:** LO2 · K3–K4 · A3–A6

Combine tickets, requesters and agents without losing unassigned tickets.

**AI prompt**

Write a SQLite query for all tickets with requester and optional assigned agent. Preserve unassigned tickets, derive age_hours, and order SLA breaches first. Explain why each join is INNER or LEFT.

**Detailed step-by-step**

1. Review the ticket relationship diagram and predict the result cardinality.
2. Create two tickets, leaving one unassigned.
3. Use the AI prompt to generate the report and inspect its join choices.
4. Run the query and reconcile output rows to the ticket count.
5. Assign an agent and close a ticket through the interface.
6. Record before/after queries and explain why the LEFT JOIN is required.

```sql
SELECT t.id,t.subject,r.name requester,a.name agent,ROUND((julianday('now')-julianday(t.created_at))*24,1) age_hours FROM tickets t JOIN people r ON r.id=t.requester_id LEFT JOIN people a ON a.id=t.agent_id ORDER BY (age_hours>24) DESC,age_hours DESC;
```

**Acceptance:** Every ticket appears exactly once and unassigned tickets show a blank agent rather than disappearing.

**Troubleshooting:** INNER JOIN removes optional relationships → change only the optional side to LEFT JOIN and test row counts.

## Topic 03 — SQL Data Aggregation and Transformation

Aggregate measures, CTEs, data-quality rules, transactions, indexes and query plans

### Lab 7 — Sales Aggregation Dashboard

**Alignment:** LO3 · K5–K6 · A5–A7

Create management KPIs from order-line data at a declared grain.

**AI prompt**

At order-line grain, generate SQLite queries for revenue, distinct orders, average order value and monthly category totals. Prevent double counting and define every numerator and denominator.

**Detailed step-by-step**

1. Write the metric definitions before writing SQL.
2. Prompt the AI with the declared grain and required reconciliations.
3. Run the base line-grain query and inspect sample rows.
4. Run the KPI and category queries and compare them with dashboard cards.
5. Introduce a duplicate join deliberately and observe inflated revenue.
6. Fix the join, record both plans and save the reconciled metric table.

```sql
WITH line AS (SELECT oi.order_id,p.category,oi.qty*oi.unit_price amount FROM order_items oi JOIN products p ON p.id=oi.product_id) SELECT category,ROUND(SUM(amount),2) revenue,COUNT(DISTINCT order_id) orders FROM line GROUP BY category ORDER BY revenue DESC;
```

**Acceptance:** Dashboard grand total equals SUM(qty*unit_price) from order_items and AOV equals revenue/distinct orders.

**Troubleshooting:** Averages use line count instead of order count → declare grain and use COUNT(DISTINCT order_id).

### Lab 8 — Data Quality and Transaction Control

**Alignment:** LO3 · K5–K6 · A3–A7

Clean supplier data and update linked records without partial writes.

**AI prompt**

Profile this SQLite supplier table for nulls, duplicate emails, invalid status values and orphan product references. Propose deterministic corrections, a reject table and one atomic transaction. Never delete source rows silently.

**Detailed step-by-step**

1. Run the profiling queries and record issue counts.
2. Review AI-suggested corrections; reject any rule that guesses missing facts.
3. Create rejected_rows with source key, reason and captured_at.
4. Execute the correction transaction and deliberately trigger one failure.
5. Verify ROLLBACK restores every source row.
6. Run reconciliation totals and document approved versus quarantined rows.

```sql
SELECT 'null_email' issue,COUNT(*) n FROM suppliers WHERE email IS NULL UNION ALL SELECT 'duplicate_email',COUNT(*) FROM (SELECT email FROM suppliers WHERE email IS NOT NULL GROUP BY email HAVING COUNT(*)>1);
```

**Acceptance:** The transaction either applies all linked corrections or rolls back; source and reject totals reconcile.

**Troubleshooting:** AI overwrites evidence or applies non-deterministic fixes → retain raw values, reason codes and explicit rules.

### Lab 9 — CTEs, Indexes and Query Plans

**Alignment:** LO3 · K7 · A5–A7

Improve a slow order-history query using evidence rather than intuition.

**AI prompt**

Refactor this SQLite query into named CTEs, then propose the smallest useful index. Explain column order from equality, range and ordering predicates. Require EXPLAIN QUERY PLAN evidence before claiming improvement.

**Detailed step-by-step**

1. Run the target query and save its ordered result set.
2. Capture the baseline EXPLAIN QUERY PLAN output.
3. Ask the AI for one justified composite index, not a list of speculative indexes.
4. Create the index and capture the new plan.
5. Compare results and measure execution across repeated runs.
6. Document the access trade-off: faster reads versus write/storage cost.

```sql
EXPLAIN QUERY PLAN SELECT customer_id,order_date,total FROM orders WHERE customer_id=7 AND order_date>='2026-01-01' ORDER BY order_date DESC;
```

**Acceptance:** Plan changes from full SCAN to indexed SEARCH and the result set remains byte-for-byte equivalent.

**Troubleshooting:** Index adds storage but is unused → compare plan, predicate order and selectivity; remove redundant index.

## Topic 04 — Data Mapping, Warehousing and Dashboard Development

Source-to-target mapping, star schemas, dimensional loads and browser dashboards backed by SQLite

### Lab 10 — Warehouse Star Schema Dashboard

**Alignment:** LO4 · K3,K7 · A7–A9

Map retail transactions into a small analytical star schema.

**AI prompt**

Design a SQLite star schema for retail sales at order-line grain. Return source-to-target mappings, surrogate-key strategy, dimension-first load SQL, reject handling and three reconciliation queries. Distinguish additive from non-additive measures.

**Detailed step-by-step**

1. Declare the fact grain and identify measures versus dimension attributes.
2. Use the AI prompt to draft mappings, then trace every target field to a source expression.
3. Run schema.sql and load dimensions before fact_sales.
4. Execute row-count, amount and key-reconciliation queries.
5. Open the warehouse dashboard and compare chart totals to SQL output.
6. Save mapping.csv, reconciliation.md and a screenshot of the final dashboard.

```sql
SELECT d.month_name,p.category,ROUND(SUM(f.sales_amount),2) sales FROM fact_sales f JOIN dim_date d ON d.date_key=f.date_key JOIN dim_product p ON p.product_key=f.product_key GROUP BY d.month_name,p.category ORDER BY d.date_key,p.category;
```

**Acceptance:** Fact row count equals accepted source lines; fact amount reconciles to source amount; no unknown foreign keys remain.

**Troubleshooting:** Facts load before dimensions or grain is unclear → resolve dimension keys first and reject unresolved rows.

### Lab 11 — Capstone: AI-Built Service Operations App

**Alignment:** LO1–LO4 · K1–K7 · A1–A9

Deliver a small service-operations product from brief to validated dashboard.

**AI prompt**

You are my SQL pair programmer. Work in stages and wait for approval after each: clarify requirements; propose 3NF model; generate SQLite DDL; generate parameterised CRUD; generate SLA report; generate tests and threat review. For every stage, list assumptions, expected outputs and failure tests. Do not change approved contracts silently.

**Detailed step-by-step**

1. Read the product brief and write five clarifying questions before using AI.
2. Run the staged prompt; approve or correct each contract before the next stage.
3. Implement the schema and seed data, then run constraint tests.
4. Implement ticket create, assign, close, filter and export/import workflows.
5. Run the SLA report and reconcile every dashboard total.
6. Complete ACCEPTANCE.md with test evidence, known limitations and the final prompt history.

```sql
SELECT status,priority,COUNT(*) tickets,ROUND(AVG((julianday(COALESCE(closed_at,'now'))-julianday(created_at))*24),1) avg_hours FROM tickets GROUP BY status,priority ORDER BY status,priority;
```

**Acceptance:** All acceptance tests pass: integrity, parameter binding, CRUD, report reconciliation, export/import and responsive UI.

**Troubleshooting:** Vibe-coded output drifts across files → freeze interfaces, test after each change and keep a decision/prompt log.
