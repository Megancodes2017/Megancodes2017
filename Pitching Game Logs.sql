CREATE TABLE pitching_game_logs (
    pitcher_id INT,
    pitcher_name VARCHAR(50),
    team VARCHAR(10),
    game_date DATE,
    innings_pitched FLOAT,
    earned_runs INT,
    hits_allowed INT,
    walks INT,
    strikeouts INT,
    home_runs INT
);
INSERT INTO pitching_game_logs (pitcher_id, pitcher_name, team, game_date, innings_pitched, earned_runs, hits_allowed, walks, strikeouts, home_runs)
VALUES
(1, 'Zack Wheeler', 'PHI', '2025-06-09', 6.0, 1, 3, 1, 7, 1),
(1, 'Zack Wheeler', 'PHI', '2025-06-15', 6.0, 1, 4, 0, 9, 0),
(1, 'Zack Wheeler', 'PHI', '2025-06-20', 5.0, 0, 4, 3, 8, 0),
(1, 'Zack Wheeler', 'PHI', '2025-06-25', 6.0, 0, 3, 3, 8, 0),
(1, 'Zack Wheeler', 'PHI', '2025-06-30', 8.0, 0, 6, 0, 10, 0),
(2, 'Ranger Suarez', 'PHI', '2025-06-01', 6.0, 1, 7, 0, 2, 0),
(2, 'Ranger Suarez', 'PHI', '2025-06-07', 7.0, 2, 5, 1, 5, 1),
(2, 'Ranger Suarez', 'PHI', '2025-06-13', 7.0, 0, 5, 1, 6, 0),
(2, 'Ranger Suarez', 'PHI', '2025-06-18', 7.0, 1, 4, 2, 8, 1),
(2, 'Ranger Suarez', 'PHI', '2025-06-24', 7.0, 1, 4, 2, 7, 1),
(2, 'Ranger Suarez', 'PHI', '2025-06-29', 7.0, 1, 4, 1, 8, 1),
(3, 'Cristopher Sanchez', 'PHI', '2025-06-03', 6.0, 1, 4, 4, 4, 1),
(3, 'Cristopher Sanchez', 'PHI', '2025-06-08', 7.0, 2, 6, 2, 9, 0),
(3, 'Cristopher Sanchez', 'PHI', '2025-06-14', 7.0, 2, 5, 0, 5, 0),
(3, 'Cristopher Sanchez', 'PHI', '2025-06-19', 8.0, 1, 5, 0, 4, 0),
(3, 'Cristopher Sanchez', 'PHI', '2025-06-26', 6.0, 1, 5, 0, 11, 0),
(4, 'Jesus Luzardo', 'PHI', '2025-06-05', 2.1, 8, 9, 2, 2, 1),
(4, 'Jesus Luzardo', 'PHI', '2025-06-11', 6.0, 1, 5, 0, 10, 0),
(4, 'Jesus Luzardo', 'PHI', '2025-06-17', 5.0, 4, 6, 4, 4, 1),
(4, 'Jesus Luzardo', 'PHI', '2025-06-22', 6.2, 0, 3, 1, 7, 0),
(4, 'Jesus Luzardo', 'PHI', '2025-06-28', 5.0, 2, 7, 3, 7, 0),
(5, 'Mick Abel', 'PHI', '2025-06-04', 5.1, 1, 3, 0, 2, 0),
(5, 'Mick Abel', 'PHI', '2025-06-10', 4.0, 3, 6, 3, 3, 3),
(5, 'Mick Abel', 'PHI', '2025-06-16', 5.0, 1, 3, 1, 3, 0),
(5, 'Mick Abel', 'PHI', '2025-06-21', 3.0, 4, 6, 0, 1, 4);

SELECT
pitcher_name,
ROUND(SUM(earned_runs) * 9 / NULLIF(SUM(innings_pitched), 0), 2) AS ERA,
ROUND(SUM(walks + hits_allowed) / NULLIF(SUM(innings_pitched), 0), 2) AS WHIP,
ROUND(SUM(strikeouts) / NULLIF(SUM(walks), 0), 2) AS K_BB,
ROUND(SUM(strikeouts) * 9 / NULLIF(SUM(innings_pitched), 0), 2) AS K_9,
ROUND(SUM(walks) * 9 / NULLIF(SUM(innings_pitched), 0), 2) AS BB_9,
ROUND(
    ((13 * SUM(home_runs) + 3 * SUM(walks) - 2 * SUM(strikeouts)) / NULLIF(SUM(innings_pitched), 0)) + 3.10, 2
) AS FIP
FROM pitching_game_logs 
WHERE team = 'PHI' AND game_date BETWEEN '2025-06-01' AND '2025-06-30'
GROUP BY pitcher_name
ORDER BY ERA ASC;


SELECT * FROM pitching_game_logs;
