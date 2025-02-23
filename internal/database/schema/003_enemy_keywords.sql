-- +goose up
CREATE TABLE enemy_keywords (
	enemy_id INTEGER NOT NULL,
	keyword_id INTEGER NOT NULL,
	FOREIGN KEY (enemy_id) REFERENCES enemies(id) ON DELETE CASCADE,
	FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON DELETE CASCADE,
	PRIMARY KEY (enemy_id, keyword_id)
);

-- +goose down
DROP TABLE enemy_keywords;
