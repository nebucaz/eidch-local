-- Create the database
CREATE DATABASE "base-registry-db";
CREATE DATABASE "status-registry-db";
CREATE DATABASE "trust-registry-db";

-- Create users
CREATE USER base_registry WITH PASSWORD 'secret';
CREATE USER status_registry WITH PASSWORD 'secret';
CREATE USER trust_registry WITH PASSWORD 'secret';

-- Create role group with NOLOGIN (explicit)
CREATE ROLE db_writers NOLOGIN;

-- Grant users access to the role
GRANT db_writers TO base_registry;
GRANT db_writers TO status_registry;
GRANT db_writers TO trust_registry;

-- Allow the role to connect to database base_registry_db
GRANT CONNECT ON DATABASE "base-registry-db" TO db_writers;

-- Switch to database `base_registry_db`
\c "base-registry-db";

-- Ensure schema `public` is accessible before granting privileges
GRANT USAGE ON SCHEMA public TO db_writers;
GRANT CREATE ON SCHEMA public TO db_writers;

-- Grant permissions for existing tables and sequences
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_writers;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO db_writers;

-- Ensure future tables and sequences are also accessible
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO db_writers;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO db_writers;

-- Allow the role to connect to database base_registry_db
GRANT CONNECT ON DATABASE "status-registry-db" TO db_writers;

-- Switch to database `status_registry_db`
\c "status-registry-db";

-- Ensure schema `public` is accessible before granting privileges
GRANT USAGE ON SCHEMA public TO db_writers;
GRANT CREATE ON SCHEMA public TO db_writers;

-- Grant permissions for existing tables and sequences
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_writers;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO db_writers;

-- Ensure future tables and sequences are also accessible
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO db_writers;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO db_writers;

GRANT CREATE ON DATABASE "status-registry-db" TO status_registry;


-- Allow the role to connect to database status_registry_db
GRANT CONNECT ON DATABASE "trust-registry-db" TO db_writers;

-- Switch to database `trust-registry-db`
\c "trust-registry-db";

-- Ensure schema `public` is accessible before granting privileges
GRANT USAGE ON SCHEMA public TO db_writers;
GRANT CREATE ON SCHEMA public TO db_writers;

-- Grant permissions for existing tables and sequences
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_writers;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO db_writers;

-- Ensure future tables and sequences are also accessible
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO db_writers;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO db_writers;
