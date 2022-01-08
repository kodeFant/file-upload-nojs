-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE files (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    file_url TEXT NOT NULL
);
