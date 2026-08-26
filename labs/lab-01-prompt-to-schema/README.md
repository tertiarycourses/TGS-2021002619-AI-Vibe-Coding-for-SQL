# Lab 1 — Prompt-to-Schema Design Studio

**Alignment:** LO1 · K1–K3 · A1–A4

**Scenario:** Model a Singapore retail ordering workflow from an ambiguous business brief.

**Deliverable:** A normalised SQLite schema, relationship map and constraint test evidence.

## Start the app

```bash
cd lab-01-prompt-to-schema
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Read REQUIREMENTS.md and identify entities, events, rules and unknowns.
2. Paste the supplied prompt into an approved AI assistant and review its assumptions before any DDL.
3. Edit schema.sql so every business invariant has a SQLite constraint or an explicit application check.
4. Start the local server, open the app and run the schema-inspection query.
5. Execute the adversarial inserts in tests.sql and record which constraint blocks each invalid row.
6. Save the final prompt, corrected DDL and validation evidence in evidence.md.

## Core SQL

```sql
SELECT name, sql FROM sqlite_master WHERE type='table' ORDER BY name;
```

## Acceptance check

Invalid email, negative price and orphan order rows are rejected; valid sample rows insert successfully.

## Troubleshooting

AI invents fields or omits constraints → restate the data contract and require a requirement-to-column trace.

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
