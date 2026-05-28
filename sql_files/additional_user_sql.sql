-- Create a new user
CREATE ROLE backend_usr PASSWORD '6D=L0Ah1#b1=&UB;-5v';

-- Grant connection access for this user
GRANT CONNECT ON DATABASE neondb TO backend_usr;

-- This user may use the schema fitness
GRANT USAGE ON SCHEMA fitness TO backend_usr;

-- Perform only these actions on the tables for this user
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA fitness TO backend_usr;

-- grant SELECT on all tables added in the future
ALTER DEFAULT PRIVILEGES IN SCHEMA fitness GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_usr;

-- Grant USAGE on all sequences in the schema
GRANT USAGE ON ALL SEQUENCES IN SCHEMA fitness TO backend_usr;

-- Grant USAGE on all sequences added in the future
ALTER DEFAULT PRIVILEGES IN SCHEMA fitness GRANT USAGE ON SEQUENCES TO backend_usr;
