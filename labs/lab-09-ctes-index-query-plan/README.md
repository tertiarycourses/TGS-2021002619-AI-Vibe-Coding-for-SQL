# Lab 9 — CTEs, Indexes and Query Plans

**Alignment:** LO3 · K7 · A5–A7

**Scenario:** Improve a slow order-history query using evidence rather than intuition.

**Deliverable:** A readable CTE query, composite index and before/after EXPLAIN QUERY PLAN evidence.

## Start the app

```bash
cd lab-09-ctes-index-query-plan
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Run the target query and save its ordered result set.
2. Capture the baseline EXPLAIN QUERY PLAN output.
3. Ask the AI for one justified composite index, not a list of speculative indexes.
4. Create the index and capture the new plan.
5. Compare results and measure execution across repeated runs.
6. Document the access trade-off: faster reads versus write/storage cost.

## Core SQL

```sql
EXPLAIN QUERY PLAN SELECT customer_id,order_date,total FROM orders WHERE customer_id=7 AND order_date>='2026-01-01' ORDER BY order_date DESC;
```

## Acceptance check

Plan changes from full SCAN to indexed SEARCH and the result set remains byte-for-byte equivalent.

## Troubleshooting

Index adds storage but is unused → compare plan, predicate order and selectivity; remove redundant index.

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
