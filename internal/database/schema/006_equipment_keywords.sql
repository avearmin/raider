-- +goose Up
CREATE TABLE equipment_keywords (
    equipment_id INTEGER NOT NULL,
    keyword_id INTEGER NOT NULL,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON DELETE CASCADE,
    PRIMARY KEY (equipment_id, keyword_id)
);

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Plate Helmet' AND k.name = 'metal';

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Plate Armor' AND k.name = 'metal';

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Plate Gauntlets' AND k.name = 'metal';

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Plate Boots' AND k.name = 'metal';

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Shield' AND k.name = 'metal';

INSERT INTO equipment_keywords (equipment_id, keyword_id)
SELECT e.id, k.id
FROM equipment e, keywords k
WHERE e.name = 'Iron Sword' AND k.name = 'metal';

-- +goose Down
DROP TABLE equipment_keywords;
