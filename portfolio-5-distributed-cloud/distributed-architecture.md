# Portfolio 5: Distributed and Cloud Database Strategy

## 1. High Availability & Replication Architecture
To guarantee 99.99% uptime for emergency health services, the database employs a **Multi-Region Primary-Replica Replication** model on AWS RDS (PostgreSQL):
* **Primary Instance (Read/Write):** Deployed in the primary Availability Zone (AZ) to process active clinical entries and transactions.
* **Read Replicas (Read-Only):** Asynchronous read replicas are distributed across secondary AZs. Patient lookup portals and reporting dashboards query these replicas, offloading heavy read traffic from the primary transactional core.

## 2. Sharding & Partitioning Strategy
As the healthcare network expands across national branches, the database utilizes **Horizontal Sharding** based on `PatientID` (or `RegionID`):
* Data is partitioned across distinct database nodes using hash-based sharding.
* **Benefit:** Limits hardware bottlenecks, isolates regional outages, and maintains fast query speeds regardless of dataset growth.

## 3. CAP Theorem & Consistency Strategy
* **System Choice:** The hospital database operates as a **CP System (Consistency and Partition Tolerance)** under the CAP Theorem during transactional updates (e.g., appointment booking, prescription writing).
* **Rationale:** Data consistency is paramount in healthcare to prevent medical record discrepancies or conflicting patient dosages. When a network partition occurs, the system prioritizes data correctness over instant availability.
