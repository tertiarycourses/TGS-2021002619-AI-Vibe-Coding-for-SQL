# Lab 1 AI Prompt Contract

Act as a senior SQLite data modeller. From the requirements below, return: assumptions; entities and cardinalities; 3NF tables; SQLite DDL with explicit PK, FK, NOT NULL, UNIQUE and CHECK constraints; five adversarial test cases. Do not invent fields. Mark every uncertainty as NEEDS_CONFIRMATION.

## Review gate

- Trace every output field to the supplied schema.
- Execute generated SQL in a disposable transaction.
- Run the failure tests before approving the query.
