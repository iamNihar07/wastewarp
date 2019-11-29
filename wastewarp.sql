DROP DATABASE IF EXISTS WASTEWARP;
CREATE DATABASE WASTEWARP;
USE WASTEWARP;

CREATE TABLE WUSER(
	Username VARCHAR(50) PRIMARY KEY,
	FName VARCHAR(50) NOT NULL,
	LName VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,	
    UserPassword VARCHAR(50) NOT NULL
);

CREATE TABLE CUSTOMER(
	Username VARCHAR(50) PRIMARY KEY,
	CompanyName VARCHAR(50) NOT NULL,
	FOREIGN KEY(Username) REFERENCES WUSER(Username)	
);

CREATE TABLE COLLECTOR(
	Username VARCHAR(50) PRIMARY KEY,
	Points VARCHAR(50) NOT NULL,
	FOREIGN KEY(Username) REFERENCES WUSER(Username)	
);

CREATE TABLE VOLUNTEER(
	Username VARCHAR(50) NOT NULL,
	Organizaion VARCHAR(50) NOT NULL,
	FOREIGN KEY(Username) REFERENCES COLLECTOR(Username)		
);

CREATE TABLE STUDENT(
	Username VARCHAR(50) NOT NULL,
	Univeristy VARCHAR(100) NOT NULL,
	FOREIGN KEY(Username) REFERENCES COLLECTOR(Username)		
);

CREATE TABLE TRASHLOCATION(
	TrashLocation VARCHAR(50) PRIMARY KEY		
);

CREATE TABLE TRASH(
	TrashLocation VARCHAR(50) NOT NULL,
	Amount VARCHAR(50) NOT NULL,
	TrashType VARCHAR(50),
	TrashId VARCHAR(50) PRIMARY KEY,
	FOREIGN KEY(TrashLocation) REFERENCES TRASHLOCATION(TrashLocation)			
);

CREATE TABLE REPORTEDTRASH(
	Username VARCHAR(50) NOT NULL,
	TrashLocation VARCHAR(50) NOT NULL,
	FOREIGN KEY(Username) REFERENCES WUSER(Username),
	FOREIGN KEY(TrashLocation) REFERENCES TRASHLOCATION(TrashLocation)			
);

CREATE TABLE PURCHASEDTRASH(
	Username VARCHAR(50) NOT NULL,
	TrashId VARCHAR(50) NOT NULL,
	FOREIGN KEY(TrashId) REFERENCES TRASH(TrashId),
	FOREIGN KEY(Username) REFERENCES CUSTOMER(Username)
);

CREATE TABLE COLLECTEDTRASH(
	Username VARCHAR(50) NOT NULL,
	TrashId VARCHAR(50) NOT NULL,
	FOREIGN KEY(TrashId) REFERENCES TRASH(TrashId),
	FOREIGN KEY(Username) REFERENCES COLLECTOR(Username)
);

CREATE TABLE ENERGYPLANT(
	EnergyPlantId VARCHAR(50) PRIMARY KEY,
	PlantName VARCHAR(50) NOT NULL,
	PlantAddress VARCHAR(50) NOT NULL,
	PlantPhone VARCHAR(50) NOT NULL
);

CREATE TABLE ENERGYTRASH(
	EnergyPlantId VARCHAR(50) NOT NULL,
	TrashId VARCHAR(50) NOT NULL,
	FOREIGN KEY(TrashId) REFERENCES TRASH(TrashId),
	FOREIGN KEY(EnergyPlantId) REFERENCES ENERGYPLANT(EnergyPlantId)
);


-- change this to working directory
LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/wuser.txt"
INTO TABLE WUSER
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/collector.txt"
INTO TABLE COLLECTOR
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/customer.txt"
INTO TABLE CUSTOMER
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/student.txt"
INTO TABLE STUDENT
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/volunteer.txt"
INTO TABLE VOLUNTEER
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/trashlocation.txt"
INTO TABLE TRASHLOCATION
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/trash.txt"
INTO TABLE TRASH
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/reportedtrash.txt"
INTO TABLE REPORTEDTRASH
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/purchasedtrash.txt"
INTO TABLE PURCHASEDTRASH
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/collectedtrash.txt"
INTO TABLE COLLECTEDTRASH
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/energyplant.txt"
INTO TABLE ENERGYPLANT
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "/home/imtiazkhaled/Desktop/classes/Databases/wastewarp/data/energytrash.txt"
INTO TABLE ENERGYTRASH
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;