-- +goose up
CREATE TABLE weapons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    damage INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    uses INTEGER NOT NULL,
    price INTEGER NOT NULL
);

INSERT INTO weapons (name, damage, speed, uses, price)
VALUES
    ("Bronze Sword", 10, 2, 5, 30),
    ("Iron Sword", 12, 2, 5, 50),
    ("Steel Claymore", 15, 1, 4, 80),
    ("Arcane Staff", 8, 2, 6, 70),
    ("Poison Dagger", 9, 3, 4, 40),
    ("Heavy Maul", 18, 1, 3, 90);

-- +goose down
DROP TABLE weapons;
