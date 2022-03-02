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
	SupplierName VARCHAR(50),
    Address VARCHAR(50),
    PostCode VARCHAR(8),
    Telephone VARCHAR(15),
    Email VARCHAR(40) UNIQUE
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