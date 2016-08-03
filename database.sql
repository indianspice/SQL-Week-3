-- Sharon Morris
-- Week 3 Assignment

-- Create table of users, groups and rooms

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS groups2rooms;


-- Users

CREATE TABLE users
(
	User_ID VARCHAR(2) PRIMARY KEY,
    User_Name VARCHAR(20) NOT NULL
);

INSERT INTO users
	(User_ID, User_Name)
    VALUES (1, 'Modesto');
INSERT INTO users
	(User_ID, User_Name)
    VALUES (2, 'Ayine');
INSERT INTO users
	(User_ID, User_Name)
    VALUES (3, 'Christopher');
INSERT INTO users
	(User_ID, User_Name)
    VALUES (4, 'Cheong Woo');
INSERT INTO users
	(User_ID, User_Name)
    VALUES (5, 'Saulat');
INSERT INTO users
	(User_ID, User_Name)
    VALUES (6, 'Heidy');
    
SELECT * 
FROM users;

-- Groups

CREATE TABLE groups
(
	Group_ID VARCHAR(2) PRIMARY KEY,
    Group_Name VARCHAR(30),
    User_ID VARCHAR(2), 
    FOREIGN KEY (User_ID) 
	REFERENCES users(User_ID)
);

INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (1, 'I.T.', 1);
INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (2, 'I.T.', 2);
INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (3, 'Sales', 3);
INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (4, 'Sales', 4);
INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (5, 'Administration', 5);
INSERT INTO groups
	(Group_ID, Group_Name, User_ID)
    VALUES (6, 'Operations', NULL);

SELECT *
FROM groups;


-- Rooms

CREATE TABLE rooms
(
	Room_ID VARCHAR(2) PRIMARY KEY,
    Room_Name VARCHAR(20),
    Group_ID VARCHAR(2),
    FOREIGN KEY (Group_ID) 
	REFERENCES groups(Group_ID)
);

INSERT INTO rooms
	(Room_ID, Room_Name, Group_ID)
    VALUES (1, 101, 1);
INSERT INTO rooms
	(Room_ID, Room_Name, Group_ID)
    VALUES (2, 102, 2);
INSERT INTO rooms
	(Room_ID, Room_Name, Group_ID)
    VALUES (3, 102, 3);
INSERT INTO rooms
	(Room_ID, Room_Name, Group_ID)
    VALUES (4, 'Auditorium A', 4);
INSERT INTO rooms
	(Room_ID, Room_Name, Group_ID)
    VALUES (5, 'Auditorium B', NULL);
    
SELECT *
FROM rooms;


-- 1) All groups and users in each group

SELECT
	g.Group_ID,
	g.Group_Name,
    u.User_ID,
	u.User_Name
From
	users u
RIGHT JOIN 
	groups g
ON u.User_ID = g.User_ID;

    
-- 2) All rooms and the groups assigned to each room

SELECT 
	r.Room_ID,
	r.Room_Name,
	g.Group_ID,
	g.Group_Name
FROM
	groups g
RIGHT JOIN
	rooms r
ON g.Group_ID = r.Group_ID;


-- 3) List of users, the groups they belong to and the records they assigned

SELECT *
FROM
	users u 
LEFT JOIN 
	groups g ON u.User_ID = g.User_ID
LEFT JOIN
    rooms r ON g.Group_ID = r.Group_ID
UNION
SELECT *
FROM users u
RIGHT JOIN
	groups g ON u.User_ID = g.User_ID
LEFT JOIN
    rooms r ON g.Group_ID = r.Group_ID
ORDER BY User_Name, Group_Name, Room_Name ASC

