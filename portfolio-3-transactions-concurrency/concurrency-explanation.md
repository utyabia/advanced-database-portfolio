# Portfolio 3: Transactions and Concurrency Technical Report

## 1. ACID Properties in the Hospital Database
* **Atomicity:** Medical updates (e.g., creating an appointment alongside an associated lab record) must complete as a single unit of work. If an error occurs midway, the transaction issues a `ROLLBACK` so half-completed records never enter the database.
* **Consistency:** Integrity constraints (such as Foreign Key checks) prevent orphans, like assigning a prescription to a non-existent appointment ID.
* **Isolation:** Ensures simultaneous access by multiple hospital staff members (e.g., two receptionists registering appointments at once) does not cause dirty reads or conflicting updates.
* **Durability:** Once a transaction executes `COMMIT`, clinical records are committed permanently to persistent storage.

## 2. Concurrency Issues & Isolation Controls
* **The Challenge:** Simultaneous bookings for the same doctor at identical timestamps can create a race condition.
* **The Mechanism:** Using `READ COMMITTED` isolation combined with `SELECT ... FOR UPDATE` applies a row-level write lock. This forces concurrent attempts to queue safely, avoiding duplicate scheduling.
