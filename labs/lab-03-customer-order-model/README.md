# Lab 3 — Customer and Order Relationship Lab

**Alignment:** LO1 · K2–K3 · A1–A4

**Scenario:** Turn spreadsheet-style customer and order data into a clean relational model.

**Deliverable:** Customer, order and order-item tables with tested one-to-many relationships.

## Start the app

```bash
cd lab-03-customer-order-model
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Profile the flat source rows and mark repeating customer/product values.
2. Use the AI prompt to propose tables, but reject any entity not supported by the source.
3. Create schema.sql with foreign_keys enabled and explicit ON DELETE behaviour.
4. Load seed.sql in the browser app and inspect table row counts.
5. Run the three-table revenue join and compare the total to CONTROL_TOTALS.md.
6. Attempt an orphan order item and capture the foreign-key failure in evidence.md.

## Core SQL

```sql
SELECT c.name, COUNT(DISTINCT o.id) orders, ROUND(SUM(oi.qty*oi.unit_price),2) revenue FROM customers c JOIN orders o ON o.customer_id=c.id JOIN order_items oi ON oi.order_id=o.id GROUP BY c.id,c.name ORDER BY revenue DESC;
```

## Acceptance check

The revenue total matches the seed control total and every order item resolves to one order and one product.

## Troubleshooting

Join duplicates inflate revenue → aggregate at order-item grain and verify keys before summing.

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
