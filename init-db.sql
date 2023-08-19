CREATE TABLE IF NOT EXISTS incidents (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO incidents (title, description) 
VALUES 
    ('Incident 1', 'Description 1'),
    ('Incident 2', 'Description 2'),
    ('Incident 3', 'Description 3'),
    ('Incident 4', 'Description 4'),
    ('Incident 5', 'Description 5');

CREATE TABLE IF NOT EXISTS tickets (
  id SERIAL PRIMARY KEY,
  incident_id INTEGER NOT NULL,
  zd_ticket_id INTEGER NOT NULL,
  zd_url VARCHAR(255) NOT NULL,
  zd_summary VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO tickets (incident_id, zd_ticket_id, zd_url, zd_summary) 
VALUES 
    (1, 8016, 'https://organisation.zendesk.com/agent/tickets/8016', 'This is the subject of a Zendesk Ticket'),
    (1, 8066, 'https://organisation.zendesk.com/agent/tickets/8065', 'This is the subject of a Zendesk Ticket'),
    (2, 8066, 'https://organisation.zendesk.com/agent/tickets/8066', 'This is the subject of a Zendesk Ticket');