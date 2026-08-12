
CREATE TABLE STADIUM
(
    STADIUM_ID INT PRIMARY KEY,
    STADIUM_NAME VARCHAR(200) NOT NULL UNIQUE,
    STADIUM_CAPACITY INT NOT NULL,
    STADIUM_CITY VARCHAR(200) NOT NULL
);


INSERT INTO STADIUM VALUES
(101, 'Wankhede Stadium', 55000, 'Mumbai'),
(102, 'Chepauk Stadium', 50000, 'Chennai'),
(103, 'Chinnaswamy Stadium', 45000, 'Bangalore'),
(104, 'Eden Gardens', 68000, 'Kolkata'),
(105, 'Sawai Mansingh Stadium', 30000, 'Jaipur'),
(106, 'Arun Jaitley Stadium', 42000, 'Delhi'),
(107, 'Bindra Stadium', 38000, 'Mohali'),
(108, 'Rajiv Gandhi Stadium', 55000, 'Hyderabad');

SELECT * FROM STADIUM



-------------------------------TEAM------------------------

CREATE TABLE TEAM
(
    TEAM_ID INT PRIMARY KEY,
    TEAM_NAME VARCHAR(200) NOT NULL UNIQUE,
    TEAM_COACH VARCHAR(200) NOT NULL,
    TEAM_WINS INT NOT NULL,
    TEAM_TOTAL_MATCHES INT NULL,
    HOME_STADIUM_ID INT NULL,
    FOREIGN KEY (HOME_STADIUM_ID)REFERENCES STADIUM(STADIUM_ID)
);


INSERT INTO TEAM VALUES
(1, 'Mumbai Indians', 'Mark Boucher', 12, 14, 101),
(2, 'Chennai Super Kings', 'Stephen Fleming', 10, 14, 102),
(3, 'Royal Challengers Bangalore', 'Faf du Plessis', 9, 14, 103),
(4, 'Kolkata Knight Riders', 'Gautam Gambhir', 11, 14, 104),
(5, 'Rajasthan Royals', 'Rahul Dravid', 8, 14, 105),
(6, 'Delhi Capitals', 'Ricky Ponting', 7, 14, 106),
(7, 'Punjab Kings', 'Anil Kumble', 6, 14, 107),
(8, 'Sunrisers Hyderabad', 'Brian Lara', 9, 14, 108);

SELECT * FROM TEAM


------------------------------------PLAYER------------------------------------

CREATE TABLE PLAYER
(
    PLAYER_ID INT PRIMARY KEY,
    PLAYER_FIRST_NAME VARCHAR(200) NOT NULL,
    PLAYER_LAST_NAME VARCHAR(200) NOT NULL,
    TEAM_ID INT NULL,
    FOREIGN KEY (TEAM_ID)REFERENCES TEAM(TEAM_ID),
    PLAYER_ROLE VARCHAR(200) NULL,
    PLAYER_JERSEY_NUMBER INT NOT NULL,
    PLAYER_MATCHES_PLAYED INT NULL,

);

INSERT INTO PLAYER VALUES
(201, 'Virat', 'Kohli', 3, 'Batsman', 18, 25),
(202, 'Rohit', 'Sharma', 1, 'Batsman', 45, 28),
(203, 'Jasprit', 'Bumrah', 1, 'Bowler', 93, 26),
(204, 'MS', 'Dhoni', 2, 'Wicketkeeper', 7, 30),
(205, 'Ravindra', 'Jadeja', 2, 'All-rounder', 8, 27),
(206, 'Andre', 'Russell', 4, 'All-rounder', 12, 24),
(207, 'Sanju', 'Samson', 5, 'Batsman', 11, 23),
(208, 'Yuzvendra', 'Chahal', 5, 'Bowler', 3, 22),
(209, 'Glenn', 'Maxwell', 3, 'All-rounder', 32, 21),
(210, 'Sunil', 'Narine', 4, 'Bowler', 74, 29),
(211, 'David', 'Warner', 6, 'Batsman', 31, 26),
(212, 'Rishabh', 'Pant', 6, 'Wicketkeeper', 17, 24),
(213, 'Kagiso', 'Rabada', 6, 'Bowler', 25, 23),
(214, 'Shikhar', 'Dhawan', 7, 'Batsman', 42, 27),
(215, 'Liam', 'Livingstone', 7, 'All-rounder', 23, 22),
(216, 'Arshdeep', 'Singh', 7, 'Bowler', 2, 21),
(217, 'Aiden', 'Markram', 8, 'Batsman', 4, 23),
(218, 'Bhuvneshwar', 'Kumar', 8, 'Bowler', 15, 28),
(219, 'Rahul', 'Tripathi', 8, 'Batsman', 52, 24),
(220, 'Abdul', 'Samad', 8, 'All-rounder', 11, 29)

SELECT * FROM PLAYER


--From the table STADIUM, TEAM and PLAYER perform the following queries:

--Part – A:
SELECT * FROM STADIUM
SELECT * FROM TEAM
SELECT * FROM PLAYER

-- PART - A

-- 1. Display players who belong to teams located in 'Mumbai'.
SELECT P.* 
FROM PLAYER P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S ON T.HOME_STADIUM_ID = S.STADIUM_ID
WHERE S.STADIUM_CITY = 'Mumbai';

-- 2. Display all teams and players.
SELECT T.TEAM_NAME, P.PLAYER_FIRST_NAME, P.PLAYER_LAST_NAME 
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID;

-- 3. Display players along with team wins and stadium city.
SELECT P.PLAYER_FIRST_NAME, P.PLAYER_LAST_NAME, T.TEAM_WINS, S.STADIUM_CITY
FROM PLAYER P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S ON T.HOME_STADIUM_ID = S.STADIUM_ID;

-- 4. Display team name and number of players in each team.
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS TOTAL_PLAYERS
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 5. Display team name, coach, and number of bowlers in each team.
SELECT T.TEAM_NAME, T.TEAM_COACH, COUNT(P.PLAYER_ID) AS BOWLER_COUNT
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID AND P.PLAYER_ROLE = 'Bowler'
GROUP BY T.TEAM_NAME, T.TEAM_COACH;

-- 6. Display team name with count of batsmen, bowlers, and all-rounders.
SELECT T.TEAM_NAME,
       SUM(CASE WHEN P.PLAYER_ROLE = 'Batsman' THEN 1 ELSE 0 END) AS BATSMEN_COUNT,
       SUM(CASE WHEN P.PLAYER_ROLE = 'Bowler' THEN 1 ELSE 0 END) AS BOWLERS_COUNT,
       SUM(CASE WHEN P.PLAYER_ROLE = 'All-rounder' THEN 1 ELSE 0 END) AS ALL_ROUNDERS_COUNT
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 7. Display stadiums where teams have won more than 10 matches.
SELECT S.STADIUM_NAME, S.STADIUM_CITY
FROM STADIUM S
JOIN TEAM T ON S.STADIUM_ID = T.HOME_STADIUM_ID
WHERE T.TEAM_WINS > 10;

-- 8. Display team name and number of players whose matches played is greater than 25.
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS PLAYER_COUNT
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID AND P.PLAYER_MATCHES_PLAYED > 25
GROUP BY T.TEAM_NAME;

-- 9. Display team name and total number of players having jersey number greater than 30.
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS PLAYER_COUNT
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID AND P.PLAYER_JERSEY_NUMBER > 30
GROUP BY T.TEAM_NAME;

-- 10. Display team name and total matches played by its players.
SELECT T.TEAM_NAME, SUM(ISNULL(P.PLAYER_MATCHES_PLAYED, 0)) AS TOTAL_PLAYER_MATCHES
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;


-- PART - B

-- 11. Display stadium city and total number of teams in each city.
SELECT S.STADIUM_CITY, COUNT(T.TEAM_ID) AS TOTAL_TEAMS
FROM STADIUM S
LEFT JOIN TEAM T ON S.STADIUM_ID = T.HOME_STADIUM_ID
GROUP BY S.STADIUM_CITY;

-- 12. Display team name and average matches played by players in each team.
SELECT T.TEAM_NAME, AVG(CAST(P.PLAYER_MATCHES_PLAYED AS DECIMAL(10,2))) AS AVG_MATCHES
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 13. Display team name and maximum matches played by any player in each team.
SELECT T.TEAM_NAME, MAX(P.PLAYER_MATCHES_PLAYED) AS MAX_MATCHES
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 14. Display team name and minimum matches played by any player in each team.
SELECT T.TEAM_NAME, MIN(P.PLAYER_MATCHES_PLAYED) AS MIN_MATCHES
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME;

-- 15. Display stadium name and total number of players playing under teams of that stadium.
SELECT S.STADIUM_NAME, COUNT(P.PLAYER_ID) AS TOTAL_PLAYERS
FROM STADIUM S
LEFT JOIN TEAM T ON S.STADIUM_ID = T.HOME_STADIUM_ID
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY S.STADIUM_NAME;

-- PART - C

-- 16. Display teams having more all-rounders than bowlers.
SELECT T.TEAM_NAME
FROM TEAM T
JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING SUM(CASE WHEN P.PLAYER_ROLE = 'All-rounder' THEN 1 ELSE 0 END) > 
       SUM(CASE WHEN P.PLAYER_ROLE = 'Bowler' THEN 1 ELSE 0 END);

-- 17. Display teams where difference between max and min player matches is greater than 5.
SELECT T.TEAM_NAME
FROM TEAM T
JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING (MAX(P.PLAYER_MATCHES_PLAYED) - MIN(P.PLAYER_MATCHES_PLAYED)) > 5;

-- 18. Display stadium city and total wins of teams in that city.
SELECT S.STADIUM_CITY, SUM(T.TEAM_WINS) AS TOTAL_WINS
FROM STADIUM S
JOIN TEAM T ON S.STADIUM_ID = T.HOME_STADIUM_ID
GROUP BY S.STADIUM_CITY;

-- 19. Display team name and total number of players for each role (grouped by role).
SELECT T.TEAM_NAME, P.PLAYER_ROLE, COUNT(P.PLAYER_ID) AS PLAYER_COUNT
FROM TEAM T
JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME, P.PLAYER_ROLE;

-- 20. Display team name and total number of players whose name starts with 'A'.
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS PLAYER_COUNT
FROM TEAM T
LEFT JOIN PLAYER P ON T.TEAM_ID = P.TEAM_ID AND P.PLAYER_FIRST_NAME LIKE 'A%'
GROUP BY T.TEAM_NAME;