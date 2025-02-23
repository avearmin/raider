-- +goose up
CREATE TABLE enemies (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	base_damage INTEGER NOT NULL,
	health INTEGER NOT NULL
);

-- +goose down
DROP TABLE enemies;
