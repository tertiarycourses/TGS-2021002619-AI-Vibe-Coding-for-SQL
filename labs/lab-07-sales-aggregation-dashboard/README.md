# Lab 7 — Sales Aggregation Dashboard

**Alignment:** LO3 · K5–K6 · A5–A7

**Scenario:** Create management KPIs from order-line data at a declared grain.

**Deliverable:** A browser dashboard with revenue, average order value and category performance.

## Start the app

```bash
cd lab-07-sales-aggregation-dashboard
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Write the metric definitions before writing SQL.
2. Prompt the AI with the declared grain and required reconciliations.
3. Run the base line-grain query and inspect sample rows.
4. Run the KPI and category queries and compare them with dashboard cards.
5. Introduce a duplicate join deliberately and observe inflated revenue.
6. Fix the join, record both plans and save the reconciled metric table.

## Core SQL

```sql
WITH line AS (SELECT oi.order_id,p.category,oi.qty*oi.unit_price amount FROM order_items oi JOIN products p ON p.id=oi.product_id) SELECT category,ROUND(SUM(amount),2) revenue,COUNT(DISTINCT order_id) orders FROM line GROUP BY category ORDER BY revenue DESC;
```

## Acceptance check

Dashboard grand total equals SUM(qty*unit_price) from order_items and AOV equals revenue/distinct orders.

## Troubleshooting

Averages use line count instead of order count → declare grain and use COUNT(DISTINCT order_id).

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
