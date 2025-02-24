-- +goose up
CREATE TABLE armors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    health INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    uses INTEGER NOT NULL,
    price INTEGER NOT NULL
);

INSERT INTO armors (name, health, speed, uses, price)
VALUES
    ("Leather Armor", 10, 2, 5, 40),
    ("Chainmail", 15, 1, 5, 60),
    ("Plate Armor", 20, 1, 4, 80),
    ("Arcane Robe", 8, 3, 5, 70),
    ("Beast Hide", 12, 2, 4, 50),
    ("Dragon Scale", 30, 1, 3, 120); 

-- +goose down
DROP TABLE armors;
