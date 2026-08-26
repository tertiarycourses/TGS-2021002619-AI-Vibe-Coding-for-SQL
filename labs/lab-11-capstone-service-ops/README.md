# Lab 11 — Capstone: AI-Built Service Operations App

**Alignment:** LO1–LO4 · K1–K7 · A1–A9

**Scenario:** Deliver a small service-operations product from brief to validated dashboard.

**Deliverable:** A functioning SQLite web app, prompt log, schema, CRUD workflow, report and acceptance evidence.

## Start the app

```bash
cd lab-11-capstone-service-ops
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Read the product brief and write five clarifying questions before using AI.
2. Run the staged prompt; approve or correct each contract before the next stage.
3. Implement the schema and seed data, then run constraint tests.
4. Implement ticket create, assign, close, filter and export/import workflows.
5. Run the SLA report and reconcile every dashboard total.
6. Complete ACCEPTANCE.md with test evidence, known limitations and the final prompt history.

## Core SQL

```sql
SELECT status,priority,COUNT(*) tickets,ROUND(AVG((julianday(COALESCE(closed_at,'now'))-julianday(created_at))*24),1) avg_hours FROM tickets GROUP BY status,priority ORDER BY status,priority;
```

## Acceptance check

All acceptance tests pass: integrity, parameter binding, CRUD, report reconciliation, export/import and responsive UI.

## Troubleshooting

Vibe-coded output drifts across files → freeze interfaces, test after each change and keep a decision/prompt log.

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
