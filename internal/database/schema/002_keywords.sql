-- +goose up
CREATE TABLE keywords (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);

-- + goose down
DROP TABLE keywords;
