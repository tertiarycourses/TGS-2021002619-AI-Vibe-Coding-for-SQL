# Lab 5 — Order Query and Filter Explorer

**Alignment:** LO2 · K4 · A5–A6

**Scenario:** Answer operations questions using SELECT, WHERE, ORDER BY, LIMIT and date filters.

**Deliverable:** A tested library of parameterised operational queries and expected result sets.

## Start the app

```bash
cd lab-05-order-query-explorer
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Inspect the orders data dictionary and the business questions in TASKS.md.
2. Prompt the AI for a parameterised query and challenge its assumptions about nulls and dates.
3. Run the query with the supplied values in the app console.
4. Change one parameter at a time and predict the row-count change before executing.
5. Run the control COUNT query and reconcile filtered rows.
6. Save the corrected query set and a short explanation of each predicate.

## Core SQL

```sql
SELECT order_no,customer_name,status,total,order_date FROM orders WHERE status='Paid' AND order_date>='2026-08-01' ORDER BY total DESC LIMIT 10;
```

## Acceptance check

Results satisfy every predicate, sort descending and match an independent COUNT control query.

## Troubleshooting

NULL rows disappear unexpectedly → state three-valued logic and test IS NULL explicitly.

## Evidence to submit

- Final AI prompt and corrections
- SQL or schema file
- Query output or screenshot
- `lab-evidence.db` export
- A short explanation of the validation result

## Components

- `index.html`, `styles.css`, `app.js` — browser application
- `schema.sql`, `seed.sql`, `tests.sql` — database contract and evidence queries
- `vendor/sql-wasm.js`, `vendor/sql-wasm.wasm` — sql.js v1.14.1 runtime
- `PROMPTS.md` — bounded AI prompt and review gate
