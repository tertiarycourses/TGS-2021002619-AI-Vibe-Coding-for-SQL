# Lab 10 AI Prompt Contract

Design a SQLite star schema for retail sales at order-line grain. Return source-to-target mappings, surrogate-key strategy, dimension-first load SQL, reject handling and three reconciliation queries. Distinguish additive from non-additive measures.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
