# Lab 6 — Service Desk Join Lab

**Alignment:** LO2 · K3–K4 · A3–A6

**Scenario:** Combine tickets, requesters and agents without losing unassigned tickets.

**Deliverable:** A service-desk browser app and join report that preserves unmatched rows.

## Start the app

```bash
cd lab-06-service-desk-joins
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Review the ticket relationship diagram and predict the result cardinality.
2. Create two tickets, leaving one unassigned.
3. Use the AI prompt to generate the report and inspect its join choices.
4. Run the query and reconcile output rows to the ticket count.
5. Assign an agent and close a ticket through the interface.
6. Record before/after queries and explain why the LEFT JOIN is required.

## Core SQL

```sql
SELECT t.id,t.subject,r.name requester,a.name agent,ROUND((julianday('now')-julianday(t.created_at))*24,1) age_hours FROM tickets t JOIN people r ON r.id=t.requester_id LEFT JOIN people a ON a.id=t.agent_id ORDER BY (age_hours>24) DESC,age_hours DESC;
```

## Acceptance check

Every ticket appears exactly once and unassigned tickets show a blank agent rather than disappearing.

## Troubleshooting

INNER JOIN removes optional relationships → change only the optional side to LEFT JOIN and test row counts.

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
