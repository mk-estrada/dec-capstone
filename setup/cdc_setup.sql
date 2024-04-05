-- CDC set up script on PostgreSQL (run the queries against the database where the respective tables are stored).

-- 1: ensure logical replication has been turned on
select name, setting from pg_settings where name in ('wal_level', 'rds.logical_replication');

-- 2: create replication slot for db
select pg_create_logical_replication_slot('airbyte_slot', 'pgoutput');

-- 3: ensure replication slot has been created
select * from pg_replication_slots;

-- 4: check publication tables in db (should be empty)
select * from pg_publication_tables;

-- 5: add the replication identity for each table in db
alter table categories replica identity default;
alter table customer_customer_demo replica identity default;
alter table customer_demographics replica identity default;
alter table customers replica identity default;
alter table employee_territories replica identity default;
alter table employees replica identity default;
alter table order_details replica identity default;
alter table orders replica identity default;
alter table products replica identity default;
alter table region replica identity default;
alter table shippers replica identity default;
alter table suppliers replica identity default;
alter table territories replica identity default;
alter table us_states replica identity default;

-- 6. create the postgres publication for all tables in db
create publication airbyte_publication for table categories, customer_customer_demo, customer_demographics, customers,
employee_territories, employees, order_details, orders, products, region, shippers, suppliers, territories, us_states;

-- 7: check again the publication tables in db (should have 14 rows)
select * from pg_publication_tables;