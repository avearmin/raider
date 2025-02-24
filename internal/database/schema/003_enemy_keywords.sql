-- +goose up
CREATE TABLE enemy_keywords (
	enemy_id INTEGER NOT NULL,
	keyword_id INTEGER NOT NULL,
	FOREIGN KEY (enemy_id) REFERENCES enemies(id) ON DELETE CASCADE,
	FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON DELETE CASCADE,
	PRIMARY KEY (enemy_id, keyword_id)
);


-- Armored Goblin -> metal
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Armored Goblin' AND k.name = 'metal';

-- Goblin Slinger -> wood
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Goblin Slinger' AND k.name = 'wood';

-- Skeleton Knight -> undead, bone, metal
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Skeleton Knight' AND k.name IN ('undead', 'bone');

-- Also wearing scrap metal pieces
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Skeleton Knight' AND k.name = 'metal';

-- Skeleton Archer -> undead, bone
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Skeleton Archer' AND k.name IN ('undead', 'bone');

-- Wolf -> feral, beast
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Wolf' AND k.name IN ('feral', 'beast');

-- Wolf Alpha -> feral, beast
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Wolf Alpha' AND k.name IN ('feral', 'beast');

-- Slime -> poison
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Slime' AND k.name = 'poison';

-- Acidic Slime -> poison
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Acidic Slime' AND k.name = 'poison';

-- Bandit -> cloth
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Bandit' AND k.name = 'cloth';

-- Bandit Leader -> cloth
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Bandit Leader' AND k.name = 'cloth';

-- Spirit Wraith -> spirit, undead, arcane
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Spirit Wraith' AND k.name IN ('spirit', 'undead', 'arcane');

-- Unholy Priest -> unholy, cloth
INSERT INTO enemy_keywords (enemy_id, keyword_id)
SELECT e.id, k.id
FROM enemies e, keywords k
WHERE e.name = 'Unholy Priest' AND k.name IN ('unholy', 'cloth');

-- +goose down
DROP TABLE enemy_keywords;
