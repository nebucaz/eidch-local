-- Create the database
CREATE DATABASE base-registry-db;
CREATE DATABASE status-registry-db;
CREATE DATABASE trust-registry-db;

-- Create users (renamed `b` to `c` to avoid conflicts)
CREATE USER base-registry WITH PASSWORD 'secret';
CREATE USER status-registry WITH PASSWORD 'secret';
CREATE USER trust-registry WITH PASSWORD 'secret';

-- Create role group with NOLOGIN (explicit)
CREATE ROLE db_writers NOLOGIN;

-- Grant users access to the role
GRANT db_writers TO base-registry;
GRANT db_writers TO status-registry;
GRANT db_writers TO trust-registry;

-- Allow the role to connect to database b
GRANT CONNECT ON DATABASE base-registry-db TO db_writers;

-- Switch to database `base-registry-db`
\c base-registry-db;

-- Ensure schema `public` is accessible before granting privileges
GRANT USAGE ON SCHEMA public TO db_writers;
GRANT CREATE ON SCHEMA public TO db_writers;

-- Grant permissions for existing tables and sequences
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_writers;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO db_writers;

-- Ensure future tables and sequences are also accessible
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO db_writers;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO db_writers;

-- Allow the role to connect to database b
GRANT CONNECT ON DATABASE base-registry-db TO db_writers;
