# Lab 6 AI Prompt Contract

Write a SQLite query for all tickets with requester and optional assigned agent. Preserve unassigned tickets, derive age_hours, and order SLA breaches first. Explain why each join is INNER or LEFT.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
