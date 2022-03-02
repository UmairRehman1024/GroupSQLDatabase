/************************************************************************************************************************/
/* Drop tables (if existing) */

DROP TABLE IF EXISTS Disposal;
DROP TABLE IF EXISTS Dealer;
DROP TABLE IF EXISTS Rental;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Maintenance;

DROP TABLE IF EXISTS Spare_Part;
DROP TABLE IF EXISTS Boat;
DROP TABLE IF EXISTS Boat_Class;
DROP TABLE IF EXISTS Supplier;

/************************************************************************************************************************/
/* Create Tables */

CREATE TABLE Supplier (
	SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Address VARCHAR(30),
    PostCode VARCHAR(8),
    Telephone VARCHAR(15),
    Email VARCHAR(20) UNIQUE
);

create table Boat_Class (
	ClassID int primary key auto_increment,
    Classification varchar(20) CHECK (Classification IN ("Motor boat", "Row boat", "Sail boat")),
    Size varchar(15) CHECK (Size IN ("very large", "large", "standard", "small")),
    HalfDayPrice decimal (5,2),
    FullDayPrice decimal (5,2)
);

CREATE TABLE Boat (
	BoatID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT NOT NULL,
    ClassID INT,
    PurchaseDate DATE,
    PurchaseValue DECIMAL(8, 2),
    Model VARCHAR(20),
    
    CONSTRAINT FK_BOAT_SUPPLIER_ID FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID) ON UPDATE CASCADE,
    CONSTRAINT FK_BOAT_CLASS_ID FOREIGN KEY (ClassID) REFERENCES Boat_Class (ClassID) ON UPDATE CASCADE,
    CONSTRAINT PURCHASE_VALUE_CHK CHECK (PurchaseValue >= 0)
);

CREATE TABLE Spare_Part (
	PartID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT NOT NULL,
    PartName VARCHAR(10),
    Delivered BIT,
    Ordered BIT,
    
    CONSTRAINT FK_SPARE_PART_SUPPLIER_ID FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID) ON UPDATE CASCADE
);

create table Reservation (
	ReservationID int primary key auto_increment,
    ClassID int,
    CustomerID int,
    ReserveDate date,
    PeriodOfHire varchar(10),
    
	constraint fk_ClassID foreign key (ClassID) references Boat_Class (ClassID) ON UPDATE CASCADE
);

create table Maintenance (
	BoatID int,
    MainRefNo int UNIQUE,
    FaultDetails varchar(100),
    FaultDate date,
    ActionDetails varchar(50),
    ActionDate date,
    Priority INT DEFAULT 2,
    
	CONSTRAINT primary key (BoatID, MainRefNo),
    CONSTRAINT FK_BOAT_ID FOREIGN KEY (BoatID) REFERENCES Boat (BoatID) ON UPDATE CASCADE
);

CREATE TABLE Customer (
CustomerID  INT PRIMARY KEY,
First_name  VARCHAR(45),
Last_name  VARCHAR(45),
Address VARCHAR(45),
Email VARCHAR(45),
Phone_number INT,
Postcode VARCHAR(45)
);

CREATE TABLE Rental (
RentalID INT PRIMARY KEY,
RentDate DATE,
Amount_paid INT,
CustomerID INT,
BoatID INT,
PeriodOfHire DECIMAL(3,1),

CONSTRAINT customer_renting FOREIGN KEY (customerID) REFERENCES Customer(customerID),
CONSTRAINT boat_key FOREIGN KEY(BoatID) REFERENCES Boat (BoatID)
);

create table Dealer (
DealerID int primary key auto_increment,
DealerName varchar(50),
Address varchar(100),
TelephoneNumber int,
Email varchar(100)
);

create table Disposal (
DealerID int,
BoatNumber int,
SaleDate date,
SalePrice int,

CONSTRAINT primary key (DealerID, BoatNumber),
constraint fk_DealerID foreign key (DealerID) references Dealer (DealerID) ON UPDATE CASCADE
);

/************************************************************************************************************************/

Insert into Boat_Class
	(ClassID, Classification, Size, HalfDayPrice, FullDayPrice)
Values	(1, 'Sail boat', 'very large', 240, 170),
		(2, 'Sail boat', 'large', 180, 120),
		(3, 'Sail boat', 'standard', 160, 100),
		(4, 'Sail boat', 'small', 140, 90),
		(5, 'Motor boat', 'very large', 280, 175),
		(6, 'Motor boat', 'large', 240, 150),
		(7, 'Motor boat', 'standard', 200, 125 ),
		(8, 'Motor boat', 'small', 170, 110),
		(9, 'Row boat', 'very large', 160, 100),
		(10, 'Row boat', 'large', 140, 90),
		(11, 'Row boat', 'standard', 120, 80 ),
		(12, 'Row boat', 'small', 110, 70);

INSERT INTO Boat (BoatID, SupplierID, ClassID, PurchaseDate, PurchaseValue, Model) VALUES
	(1, 1, 7, "2010-11-22", 3910, "Explorer"),
    (2, 2, 1, "2009-10-12", 3840, "TurboSail"),
    (3, 2, 2, "2015-10-12", 3240, "MasterSail"),
    (4, 3, 4, "2015-11-12", 2040, "SmallSailor"),
    (5, 3, 4, "2015-11-12", 2040, "SmallSailor"),
    (6, 5, 6, "2015-01-14", 5440, "Grande"),
    (7, 5, 6, "2015-01-14", 5440, "Grande"),
    (8, 2, 7, "2015-01-14", 5440, "Turbo Mid"),
    (9, 3, 10, "2015-01-12", 5440, "RowStream"),
    (10, 4, 11, "2015-01-12", 5440, "RowerX"),
    (11, 1, 2, "2016-01-10", 5440, "Explorer"),
    (12, 1, 3, "2016-01-10", 5440, "Navigator"),
    (13, 2, 7, "2018-02-14", 5440, "Turbo Mid"),
    (14, 2, 7, "2018-02-14", 5440, "Turbo Mid"),
    (15, 7, 6, "2018-01-14", 5440, "MasterBlaster"),
    (16, 8, 10, "2018-01-10", 5440, "HappyRower"),
    (17, 8, 11, "2018-01-10", 5440, "HappyRower"),
    (18, 3, 9, "2017-01-09", 5440, "Streamer"),
    (19, 4, 9, "2019-01-19", 5440, "Great Row"),
    (20, 7, 5, "2018-01-14", 5440, "SuperBlaster"),
    (21, 6, 11, "2017-01-09", 5440, "Lizard"),
    (22, 5, 6, "2018-02-14", 5440, "Grande"),
    (23, 2, 2, "2015-10-12", 5440, "MasterSail");

/************************************************************************************************************************/
