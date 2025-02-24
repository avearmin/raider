-- +goose up
CREATE TABLE enemies (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	base_damage INTEGER NOT NULL,
	health INTEGER NOT NULL,
	speed INTEGER NOT NULl,
	description TEXT NOT NULL
);

INSERT INTO enemies (name, base_damage, health, speed, description)
VALUES
    ("Armored Goblin", 6, 25, 2,
     "A cunning goblin wearing rusty metal armor (metal) and wielding a battered blade."),
    ("Goblin Slinger", 4, 15, 3,
     "A nimble goblin using a wooden sling (wood) for quick ranged attacks."),

    ("Skeleton Knight", 7, 28, 1,
     "An undead warrior (undead) held together by bone (bone), clad in scrap metal pieces."),
    ("Skeleton Archer", 6, 20, 2,
     "An undead bowman (undead) with bone limbs (bone), firing arrows from a makeshift bow."),

    ("Wolf", 6, 15, 3,
     "A feral beast (feral, beast) with sharp fangs, adept at pack hunting."),
    ("Wolf Alpha", 8, 25, 4,
     "A larger, more savage wolf (feral, beast) leading the pack, its hide scarred from battles."),

    ("Slime", 4, 30, 1,
     "A gelatinous creature often laced with mild poison (poison) that dissolves organic matter."),
    ("Acidic Slime", 5, 35, 1,
     "A potent slime with heightened corrosive properties, secreting powerful poison (poison)."),

    ("Bandit", 8, 28, 2,
     "A rogue human draped in tattered cloth (cloth), wielding a short sword for quick strikes."),
    ("Bandit Leader", 10, 30, 3,
     "The cunning head of a bandit gang, cloaked in cloth (cloth), brandishing twin blades."),

    ("Spirit Wraith", 9, 22, 2,
     "A ghostly apparition (spirit, undead) floating through walls, bound by arcane magic (arcane)."),
    ("Unholy Priest", 10, 35, 2,
     "A malevolent cleric (unholy) wielding dark powers, draped in ragged cloth and chanting curses.");

-- +goose down
DROP TABLE enemies;
