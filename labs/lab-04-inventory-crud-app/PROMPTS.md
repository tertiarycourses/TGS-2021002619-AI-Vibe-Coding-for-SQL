# Lab 4 AI Prompt Contract

Produce parameterised SQLite CRUD statements for products. A stock adjustment must be atomic, reject negative resulting stock, and return the updated row. Include a transaction and rollback path.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
