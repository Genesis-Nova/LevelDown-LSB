UPDATE status_effects SET flags = 66344 WHERE id = 204; -- no message when effect removed
UPDATE status_effects SET flags = 9437440 WHERE id = 476; -- remove on log out, zone, no cancel
INSERT INTO status_effects VALUES(495, 'paragon', 4194816,0,0,0,0,0,0,0,0);
UPDATE status_effects SET flags = 4194344 WHERE id = 170; -- regain wear on job change
