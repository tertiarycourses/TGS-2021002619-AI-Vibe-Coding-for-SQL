# Lab 10 — Warehouse Star Schema Dashboard

**Alignment:** LO4 · K3,K7 · A7–A9

**Scenario:** Map retail transactions into a small analytical star schema.

**Deliverable:** Date, customer and product dimensions; a sales fact; mapping document and KPI dashboard.

## Start the app

```bash
cd lab-10-warehouse-star-schema
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Declare the fact grain and identify measures versus dimension attributes.
2. Use the AI prompt to draft mappings, then trace every target field to a source expression.
3. Run schema.sql and load dimensions before fact_sales.
4. Execute row-count, amount and key-reconciliation queries.
5. Open the warehouse dashboard and compare chart totals to SQL output.
6. Save mapping.csv, reconciliation.md and a screenshot of the final dashboard.

## Core SQL

```sql
SELECT d.month_name,p.category,ROUND(SUM(f.sales_amount),2) sales FROM fact_sales f JOIN dim_date d ON d.date_key=f.date_key JOIN dim_product p ON p.product_key=f.product_key GROUP BY d.month_name,p.category ORDER BY d.date_key,p.category;
```

## Acceptance check

Fact row count equals accepted source lines; fact amount reconciles to source amount; no unknown foreign keys remain.

## Troubleshooting

Facts load before dimensions or grain is unclear → resolve dimension keys first and reject unresolved rows.

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
