# Bookify Room Reservation System

## Introduction

Bookify Room Reservation System is designed to facilitate the efficient management of meeting room reservations for employees. This README provides documentation for the database schema, its design principles, and the steps taken to ensure its reliability and scalability.

## Database Schema

The database schema is designed to meet the current and future needs of Bookify, encompassing entities such as meeting rooms, employees, reservations, equipment, and schedules. The schema incorporates primary keys, foreign keys, and essential information to ensure effective data management.

### UML Diagrams

The following UML diagrams describe the entities, relationships, and constraints within the database:

- [https://bit.ly/UML_Diagram]

## SQL Scripts

To create the database structure defined by the schema, SQL scripts have been developed. These scripts are documented and organized to facilitate the setup process.

### SQL Script File <script.sql> includes :

- Creates the necessary tables as per the schema.
- Defines constraints such as primary keys and foreign keys.
- Indexing.
- Data Manipulation including INSERT, UPDATE, and DELETE.
- Sorting and filtering Data.
- JOINS.

### Execution:

```bash
psql -U <username> -d <database_name> -a -f script.sql