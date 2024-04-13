USE History_of_Baseball;
-- order players and their names by the amount of homeruns they have
SELECT name_first, name_last, hr
FROM player
JOIN playerbatting
	ON player.player_id = playerbatting.player_id
ORDER BY hr DESC
;

-- organize players in desc order by walks to see if height effects amount of walks
SELECT name_first, name_last, bb, height
FROM player
JOIN playerbatting
	ON player.player_id = playerbatting.player_id
ORDER BY bb DESC
;
-- give player's a raise based off number of homeruns
SELECT name_first, name_last, hr, salary,
CASE
	WHEN hr > 40 THEN salary * 1.05
    WHEN hr > 30 THEN salary * 1.03
    WHEN hr > 10 THEN salary * 1.01
END AS New_Salary
FROM player 
JOIN playerbatting
	ON player.player_id = playerbatting.player_id
JOIN salary
	ON playerbatting.player_id = salary.player_id
WHERE salary.year = 2015
ORDER BY hr DESC
;

-- Organize player's by position
SELECT name_first, name_last, pos
FROM player
JOIN fieldingplayer
ON player.player_id = fieldingplayer.player_id
;

-- List baseball by amount of errors from most errors to least amount of errrors for Philapdephia Phillies in 2015
SELECT name_first, name_last, e, pos
FROM player 
JOIN fieldingplayer field
ON field.player_id = player.player_id
WHERE field.pos LIKE "%B" AND field.team_id = "PHI" AND field.year = 2015
ORDER BY e DESC
;

-- Finding out which player's in the National League have a batting average of .3 or over
SELECT name_first, name_last, team_id, h / ab AS Bat_Avg
FROM player
JOIN playerbatting bat
ON player.player_id = bat.player_id
WHERE h / ab >= 0.3 AND bat.league_id = "NL" AND ab > 10
ORDER BY h / ab DESC
;

SELECT name_first, name_last, salary
FROM player 
JOIN salary
	ON player.player_id = salary.player_id
WHERE salary.year = 2015
ORDER BY salary DESC
;

