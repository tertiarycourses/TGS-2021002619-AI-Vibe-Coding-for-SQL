# Lab 7 AI Prompt Contract

At order-line grain, generate SQLite queries for revenue, distinct orders, average order value and monthly category totals. Prevent double counting and define every numerator and denominator.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
