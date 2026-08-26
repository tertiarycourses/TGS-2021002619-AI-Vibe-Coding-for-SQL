# Lab 8 AI Prompt Contract

Profile this SQLite supplier table for nulls, duplicate emails, invalid status values and orphan product references. Propose deterministic corrections, a reject table and one atomic transaction. Never delete source rows silently.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
