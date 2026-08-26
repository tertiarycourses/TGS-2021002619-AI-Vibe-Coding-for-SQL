# Lab 2 — SQLite To-Do List Web App

**Alignment:** LO1 · LO2 · A1–A6

**Scenario:** Build a personal work queue with priorities, due dates and completion state.

**Deliverable:** A responsive HTML/CSS/JavaScript to-do app that persists an exported SQLite database.

## Start the app

```bash
cd lab-02-sqlite-todo-app
python3 -m http.server 8000
```

Open http://localhost:8000. A web server is required because the browser fetches the SQLite WebAssembly file.

## Detailed procedure

1. Serve the folder with python3 -m http.server 8000; do not open index.html directly.
2. Open the app and inspect the seeded task list and status counters.
3. Add three tasks covering all priorities and one blank-title attempt.
4. Toggle one task complete and delete another; verify the counters and sorted list change.
5. Open the SQL console and run the supplied analysis query.
6. Export todo.db, refresh the browser, import the file and verify row-level persistence.

## Core SQL

```sql
SELECT id,title,priority,due_date,completed FROM tasks ORDER BY completed, CASE priority WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END, due_date;
```

## Acceptance check

Add, complete and delete tasks; export the database, reload the page, import it and recover the same rows.

## Troubleshooting

Unsafe string concatenation or missing domain checks → replace with bound parameters and CHECK constraints.

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
