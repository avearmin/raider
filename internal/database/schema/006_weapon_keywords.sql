-- +goose Up
CREATE TABLE weapon_keywords (
    weapon_id INTEGER NOT NULL,
    keyword_id INTEGER NOT NULL,
    FOREIGN KEY (weapon_id) REFERENCES weapons(id) ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON DELETE CASCADE,
    PRIMARY KEY (weapon_id, keyword_id)
);

-- Bronze Sword -> metal
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Bronze Sword' AND k.name = 'metal';

-- Iron Sword -> metal
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Iron Sword' AND k.name = 'metal';

-- Steel Claymore -> metal
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Steel Claymore' AND k.name = 'metal';

-- Arcane Staff -> arcane
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Arcane Staff' AND k.name = 'arcane';

-- Poison Dagger -> poison
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Poison Dagger' AND k.name = 'poison';

-- Heavy Maul -> metal
INSERT INTO weapon_keywords (weapon_id, keyword_id)
SELECT w.id, k.id
FROM weapons w, keywords k
WHERE w.name = 'Heavy Maul' AND k.name = 'metal';

-- +goose Down
DROP TABLE weapon_keywords;
