# Lab 4 — Inventory CRUD Web App

**Alignment:** LO2 · K4 · A5–A6

**Scenario:** Manage stock levels for a small Singapore retailer without allowing negative inventory.

**Deliverable:** A searchable inventory interface with parameterised stock adjustments and low-stock flags.

## Start the app

```bash
cd lab-04-inventory-crud-app
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Open the inventory app and filter products by name or SKU.
2. Add a new product using a unique SKU and positive price.
3. Adjust stock upward, then downward within the available balance.
4. Attempt a withdrawal that would make stock negative and verify no row changes.
5. Run the low-stock query and compare badges with query results.
6. Export the database and save an evidence screenshot plus the final SQL prompt.

## Core SQL

```sql
SELECT sku,name,stock,reorder_level, CASE WHEN stock<=reorder_level THEN 'REORDER' ELSE 'OK' END status FROM products ORDER BY status DESC, stock;
```

## Acceptance check

Positive and negative adjustments update one row; an adjustment below zero is rolled back.

## Troubleshooting

Read-modify-write race or negative balance → use one guarded UPDATE inside a transaction and check changes().

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
