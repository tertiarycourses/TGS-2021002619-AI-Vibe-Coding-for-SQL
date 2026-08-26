# Lab 3 AI Prompt Contract

Review these customer/order columns. Identify repeating groups and dependencies, propose a 3NF SQLite design, state the grain of each table, and provide DDL plus orphan-key tests. Preserve source identifiers for reconciliation.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
