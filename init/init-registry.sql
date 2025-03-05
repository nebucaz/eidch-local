CREATE USER base-registry WITH PASSWORD 'secret';
CREATE USER status-registry WITH PASSWORD 'secret';
CREATE USER trust-registry WITH PASSWORD 'secret';
CREATE DATABASE base-registry-db;
CREATE DATABASE status-registry-db;
CREATE DATABASE trust-registry-db;
GRANT ALL PRIVILEGES ON DATABASE ibase-registry TO base-registry-db;
GRANT ALL PRIVILEGES ON DATABASE status-registry TO status-registry-db;
GRANT ALL PRIVILEGES ON DATABASE trust-registry TO trust-registry-db;

-- GRANT USAGE, CREATE ON SCHEMA public TO issuer_mgmt_user;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO issuer_mgmt_user;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO issuer_mgmt_user;