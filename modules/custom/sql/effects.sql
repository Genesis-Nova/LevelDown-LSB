UPDATE status_effects SET flags = 66344 WHERE id = 204; -- no message when effect removed -- hum for naked run to jeuon event
UPDATE status_effects SET flags = 9437440 WHERE id = 476; -- remove on log out, zone, no cancel -- enshphere
INSERT INTO status_effects VALUES(1000, 'paragon', 4194816,0,0,0,0,0,0,0,0); -- lose on job change & no lose message
INSERT INTO status_effects VALUES(1001, 'buff', 4194304,0,0,0,0,0,0,0,0); -- lose on job change
UPDATE status_effects SET flags = 4194344 WHERE id = 170; -- wear on job change -- regain
