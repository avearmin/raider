-- +goose up
CREATE TABLE equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    health INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    damage INTEGER NOT NULL,
    uses INTEGER NOT NULL,
    price INTEGER NOT NULL,
    slot TEXT NOT NULL CHECK (
        slot IN ('head', 'body', 'hands', 'feet', 'mainhand', 'offhand')
    ),
    CHECK (
        (slot IN ('mainhand', 'offhand') AND damage >= 0) OR 
        (slot NOT IN ('mainhand', 'offhand') AND damage <= 0)
    )
);

INSERT INTO equipment (name, health, speed, damage, uses, price, slot)
VALUES
    ("Iron Plate Armor", 10, 1, 0, 5, 40, "body"),
    ("Iron Plate Helmet", 5, 1, 0, 5, 20, "head"),
    ("Iron Plate Gauntlets", 5, 1, 0, 5, 10, "hands"),
    ("Iron Plate Boots", 5, 1, 0, 5, 10, "feet"),
    ("Iron Shield", 10, 1, 0, 5, 40, "offhand"),
    ("Iron Sword", 0, 1, 10, 5, 40, "mainhand");

-- +goose down
DROP TABLE equipment;
