# Lab 5 AI Prompt Contract

Given this schema and business question, generate one SQLite SELECT using named parameters. Explain predicate selectivity and null behaviour. Provide a second query that proves the result is complete.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
