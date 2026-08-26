# Lab 8 — Data Quality and Transaction Control

**Alignment:** LO3 · K5–K6 · A3–A7

**Scenario:** Clean supplier data and update linked records without partial writes.

**Deliverable:** A profiling report, reject table and atomic correction transaction.

## Start the app

```bash
cd lab-08-data-quality-transactions
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Run the profiling queries and record issue counts.
2. Review AI-suggested corrections; reject any rule that guesses missing facts.
3. Create rejected_rows with source key, reason and captured_at.
4. Execute the correction transaction and deliberately trigger one failure.
5. Verify ROLLBACK restores every source row.
6. Run reconciliation totals and document approved versus quarantined rows.

## Core SQL

```sql
SELECT 'null_email' issue,COUNT(*) n FROM suppliers WHERE email IS NULL UNION ALL SELECT 'duplicate_email',COUNT(*) FROM (SELECT email FROM suppliers WHERE email IS NOT NULL GROUP BY email HAVING COUNT(*)>1);
```

## Acceptance check

The transaction either applies all linked corrections or rolls back; source and reject totals reconcile.

## Troubleshooting

AI overwrites evidence or applies non-deterministic fixes → retain raw values, reason codes and explicit rules.

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
