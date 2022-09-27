/* Create table about the people and what they do here */
CREATE TABLE movie_stars (id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Oscars INTEGER, Oscars_Nominations INTEGER, BAFTA INTEGER, Greatest_Performances TEXT);
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Al Pacino", 1, 8, 5, "Serpico");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Alan Arkin", 1, 4, 1, "Little Miss Sunshine");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Brad Pitt", 1, 6, 1, "Fight Club, The Curious Case of Benjamin Button, Moneyball, Twelve Monkeys");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Christoph Waltz", 2, 2, 2, "Carnage, Django Unchained, Inglorious Basterds");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Don Cheadle", 0, 1, 0, "The Rat Pack, House of Lies, Hotel Rwanda");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Daniel Day Lewis", 3, 5, 4, "There Will Be Blood, Lincoln, My Left Food");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Gene Kelly", 0, 1, 0, "Hello, Dolly!, Anchors Anweigh, An American in Paris");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Dustin Hoffman", 2, 4, 7, "Toosie, Rain Man, Midnight Cowboy");
INSERT INTO movie_stars (Name, Oscars, Oscars_Nominations, BAFTA, Greatest_Performances) VALUES ("Dustin Hoffman", 2, 4, 7, "Toosie, Rain Man, Midnight Cowboy");

CREATE TABLE golden_globes(id INTEGER, Golden_Globes INTEGER, Golden_Globes_Nominations INTEGER);

INSERT INTO golden_globes VALUES (1, 4, 15);
INSERT INTO golden_globes VALUES (2, 1, 6);
INSERT INTO golden_globes VALUES (2, 1, 1);
INSERT INTO golden_globes VALUES (3, 2, 9);
INSERT INTO golden_globes VALUES (4, 1, 3);
INSERT INTO golden_globes VALUES (5, 0, 6);
INSERT INTO golden_globes VALUES (6, 2, 8);
INSERT INTO golden_globes VALUES (7, 4, 15);
INSERT INTO golden_globes VALUES (8, 1, 1);
INSERT INTO golden_globes VALUES (9, 1, 4);

CREATE TABLE spouses (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER);
INSERT INTO spouses (name, age) VALUES (NULL, NULL);
INSERT INTO spouses (name, age) VALUES ("Suzanne Newlander, Barbara Dana", 28);
INSERT INTO spouses (name, age) VALUES ("Angelina Jolie, Jennifer Anniston", 40);
INSERT INTO spouses (name, age) VALUES ("Judith Holste", 47);
INSERT INTO spouses (name, age) VALUES ("Bridgid Coulter", 50);
INSERT INTO spouses (name, age) VALUES ("Rebecca Miller", 44);
INSERT INTO spouses (name, age) VALUES ("Patricia Ward", 52);
INSERT INTO spouses (name, age) VALUES ("Rebecca Miller", 44);

SELECT movie_stars.Name, movie_stars.Oscars, movie_stars.BAFTA, movie_stars.Oscars_Nominations, movie_stars.Greatest_Performances, golden_globes.Golden_Globes, golden_globes.Golden_Globes_Nominations, spouses.name AS spouses_name, spouses.age AS spouses_age
FROM movie_stars
JOIN golden_globes
ON movie_stars.id = golden_globes.id 
JOIN spouses
ON movie_stars.id = spouses.id
GROUP BY movie_stars.name;

CREATE TABLE best_friends (id INTEGER PRIMARY KEY AUTOINCREMENT, star1_id INTEGER, star2_id INTEGER);

INSERT INTO best_friends (star1_id, star2_id) VALUES (1, 4);
INSERT INTO best_friends (star1_id, star2_id) VALUES (2, 6);
INSERT INTO best_friends (star1_id, star2_id) VALUES (3, 7);
INSERT INTO best_friends (star1_id, star2_id) VALUES (5, 8);
INSERT INTO best_friends (star1_id, star2_id) VALUES (6, 9);

SELECT a.name AS "Friend 1", b.name AS "Friend 2" FROM best_friends
JOIN movie_stars a
ON best_friends.star1_id = a.id
JOIN movie_stars b
ON best_friends.star2_id = b.id;

SELECT Name, Oscars,
CASE
WHEN Oscars > 2 then "megastar"
WHEN Oscars > 1 then "superstar"
WHEN Oscars > 0 then "great talent"
ELSE "star"
END AS "Reputation"
FROM movie_stars
GROUP BY Name
ORDER BY Oscars DESC;
/*data is collected from Kaggle*/

CREATE table documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    author TEXT);
    
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

SELECT * FROM documents;

UPDATE documents SET author = "Jackie Draper" WHERE author = "Jackie Paper";

DELETE FROM documents WHERE title = "Things I'm Afraid Of"

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

ALTER TABLE clothes ADD price INTEGER;
SELECT * FROM clothes;

UPDATE clothes SET price = 10 WHERE id = 1
UPDATE clothes SET price = 20 WHERE id = 2
UPDATE clothes SET price = 30 WHERE id = 3

INSERT INTO clothes (type, design, price) VALUES (scarf, red wool, 40)

