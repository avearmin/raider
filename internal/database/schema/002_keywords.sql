-- +goose up
CREATE TABLE keywords (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

INSERT INTO keywords (name) VALUES
    ('metal'),
    ('wood'),
    ('cloth'),
    ('bone'),
    ('stone'),
    ('fire'),
    ('water'),
    ('electric'),
    ('poison'),
    ('holy'),
    ('unholy'),
    ('arcane'),
    ('spirit'),
    ('undead'),
    ('beast'),
    ('feral');

-- +goose down
DROP TABLE keywords;
