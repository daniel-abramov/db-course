USE master
GO

CREATE DATABASE SportInfrastructure
GO

USE SportInfrastructure
GO

CREATE TABLE Sport
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	name VARCHAR( 50 ) NOT NULL
)
GO

CREATE TABLE Organization
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	name VARCHAR( 50 ) NOT NULL,
	organization_address VARCHAR( 80 ) NOT NULL
)
GO

CREATE TABLE Building
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	organization_id INT REFERENCES Organization ON UPDATE CASCADE ON DELETE SET NULL,
	name VARCHAR( 50 ) NOT NULL,
	building_address VARCHAR( 50 ) NOT NULL,
	building_type VARCHAR( 30 ) NOT NULL,
	places INT NOT NULL,
	area FLOAT NOT NULL
)
GO

CREATE TABLE Competition
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	building_id INT NOT NULL REFERENCES Building ON UPDATE CASCADE,
	sport_id INT NOT NULL REFERENCES Sport ON UPDATE CASCADE,
	name VARCHAR( 50 ) NOT NULL,
	competition_date DATE NOT NULL
)
GO

CREATE TABLE Club
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	organization_id INT REFERENCES Organization,
	name VARCHAR( 50 ) NOT NULL
)
GO

CREATE TABLE Person
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	firstname VARCHAR( 50 ) NOT NULL,
	lastname VARCHAR( 50 ) NOT NULL,
	middlename VARCHAR( 50 ) NOT NULL,
	birthdate DATE NOT NULL
)
GO

CREATE TABLE Experience
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	person_id INT NOT NULL REFERENCES Person ON UPDATE CASCADE ON DELETE CASCADE,
	sport_id INT NOT NULL REFERENCES Sport ON UPDATE CASCADE ON DELETE CASCADE,
	title VARCHAR( 30 ) NOT NULL
)
GO

CREATE TABLE Participant
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	person_id INT NOT NULL REFERENCES Person,
	competition_id INT NOT NULL REFERENCES Competition ON UPDATE CASCADE ON DELETE CASCADE,
	club_id INT NOT NULL REFERENCES Club,
	results INT NOT NULL
)
GO

CREATE TABLE Learner
(
	id INT IDENTITY( 0, 1 ) PRIMARY KEY NOT NULL,
	coach_id INT NOT NULL REFERENCES Person ON UPDATE CASCADE ON DELETE CASCADE,
	apprentice_id INT NOT NULL REFERENCES Person,
	sport_id INT NOT NULL REFERENCES Sport ON UPDATE CASCADE ON DELETE CASCADE,
	club_id INT NOT NULL REFERENCES Club ON UPDATE CASCADE ON DELETE CASCADE,
)
GO
