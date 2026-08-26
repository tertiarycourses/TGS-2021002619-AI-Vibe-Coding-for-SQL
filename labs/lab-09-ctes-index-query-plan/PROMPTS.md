# Lab 9 AI Prompt Contract

Refactor this SQLite query into named CTEs, then propose the smallest useful index. Explain column order from equality, range and ordering predicates. Require EXPLAIN QUERY PLAN evidence before claiming improvement.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
