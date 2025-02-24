-- +goose up
CREATE TABLE keyword_interactions (
	keyword1_id INTEGER NOT NULL,
	keyword2_id INTEGER NOT NULL,
	multiplier FLOAT NOT NULL,
	FOREIGN KEY (keyword1_id) REFERENCES keywords(id) ON DELETE CASCADE,
	FOREIGN KEY (keyword2_id) REFERENCES keywords(id) ON DELETE CASCADE,
	PRIMARY KEY (keyword1_id, keyword2_id)
);

-- Electric <-> Metal
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'electric'),
        (SELECT id FROM keywords WHERE name = 'metal'), 2.0),
       ((SELECT id FROM keywords WHERE name = 'metal'),
        (SELECT id FROM keywords WHERE name = 'electric'), 0.5);

-- Fire <-> Wood
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'fire'),
        (SELECT id FROM keywords WHERE name = 'wood'), 2.0),
       ((SELECT id FROM keywords WHERE name = 'wood'),
        (SELECT id FROM keywords WHERE name = 'fire'), 0.5);

-- Water <-> Fire
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'water'),
        (SELECT id FROM keywords WHERE name = 'fire'), 2.0),
       ((SELECT id FROM keywords WHERE name = 'fire'),
        (SELECT id FROM keywords WHERE name = 'water'), 0.5);

-- Poison <-> Cloth
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'poison'),
        (SELECT id FROM keywords WHERE name = 'cloth'), 1.5),
       ((SELECT id FROM keywords WHERE name = 'cloth'),
        (SELECT id FROM keywords WHERE name = 'poison'), 0.66);

-- Holy <-> Unholy
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'holy'),
        (SELECT id FROM keywords WHERE name = 'unholy'), 2.0),
       ((SELECT id FROM keywords WHERE name = 'unholy'),
        (SELECT id FROM keywords WHERE name = 'holy'), 0.5);

-- Arcane <-> Spirit
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'arcane'),
        (SELECT id FROM keywords WHERE name = 'spirit'), 1.5),
       ((SELECT id FROM keywords WHERE name = 'spirit'),
        (SELECT id FROM keywords WHERE name = 'arcane'), 0.66);

-- Undead <-> Holy
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'undead'),
        (SELECT id FROM keywords WHERE name = 'holy'), 2.0),
       ((SELECT id FROM keywords WHERE name = 'holy'),
        (SELECT id FROM keywords WHERE name = 'undead'), 0.5);

-- Beast <-> Poison (example: beasts might be vulnerable to poison)
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'beast'),
        (SELECT id FROM keywords WHERE name = 'poison'), 1.5),
       ((SELECT id FROM keywords WHERE name = 'poison'),
        (SELECT id FROM keywords WHERE name = 'beast'), 0.66);

-- Feral <-> Fire (feral hides easily burned)
INSERT INTO keyword_interactions (keyword1_id, keyword2_id, multiplier)
VALUES ((SELECT id FROM keywords WHERE name = 'feral'),
        (SELECT id FROM keywords WHERE name = 'fire'), 0.5),
       ((SELECT id FROM keywords WHERE name = 'fire'),
        (SELECT id FROM keywords WHERE name = 'feral'), 2.0);

-- +goose down
DROP TABLE keyword_interactions;
