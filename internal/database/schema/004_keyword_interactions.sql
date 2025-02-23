-- +goose up
CREATE TABLE keyword_interactions (
	keyword_1_id INTEGER NOT NULL,
	keyword_2_id INTEGER NOT NULL,
	multiplier FLOAT NOT NULL,
	FOREIGN KEY (keyword_1_id) REFERENCES keywords(id) ON DELETE CASCADE,
	FOREIGN KEY (keyword_2_id) REFERENCES keywords(id) ON DELETE CASCADE,
	PRIMARY KEY (keyword_1_id, keyword_2_id)
);

-- +goose down
DROP TABLE keyword_interactions;
