-- +goose Up
CREATE TABLE armor_keywords (
    armor_id INTEGER NOT NULL,
    keyword_id INTEGER NOT NULL,
    FOREIGN KEY (armor_id) REFERENCES armors(id) ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON DELETE CASCADE,
    PRIMARY KEY (armor_id, keyword_id)
);

-- Leather Armor -> cloth, beast
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Leather Armor' AND k.name = 'cloth';

INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Leather Armor' AND k.name = 'beast';

-- Chainmail -> metal
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Chainmail' AND k.name = 'metal';

-- Plate Armor -> metal
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Plate Armor' AND k.name = 'metal';

-- Arcane Robe -> cloth, arcane
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Arcane Robe' AND k.name = 'cloth';

INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Arcane Robe' AND k.name = 'arcane';

-- Beast Hide -> beast, cloth
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Beast Hide' AND k.name = 'beast';

INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Beast Hide' AND k.name = 'cloth';

-- Dragon Scale -> beast, metal
INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Dragon Scale' AND k.name = 'beast';

INSERT INTO armor_keywords (armor_id, keyword_id)
SELECT a.id, k.id
FROM armors a, keywords k
WHERE a.name = 'Dragon Scale' AND k.name = 'metal';

-- +goose Down
DROP TABLE armor_keywords;
