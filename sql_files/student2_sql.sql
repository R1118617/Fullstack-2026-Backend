DROP TABLE IF EXISTS fitness.contact_messages;

-- Maak de tabel contact_messages => wordt ingevuld door de user.
CREATE TABLE IF NOT EXISTS fitness.contact_messages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    reason VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,
    terms_accepted BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    );