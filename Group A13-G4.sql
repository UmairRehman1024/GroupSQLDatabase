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
    MainRefNo int ,
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
Phone_number varchar(15),
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
TelephoneNumber varchar(15),
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

INSERT INTO Supplier (SupplierID, SupplierName, Address, PostCode, Telephone, Email) VALUES
	(1, "SuperBoat", "Unit 7 Centurion Court, Leyland", "LE10 2DJ", "01772459666", "admin@superboat.co.uk"),
    (2, "Explorer Boats UK", "Meadow Lane, Burscough", "BU56 8GH", "01704807654", "admin@explorerboats.co.uk"),
    (3, "The Northwich Boat Company", "Unit 1 Kings Lock Boatyard Booth Lane, Middlewich", "MW67 7GY", "01270160160", "admin@northwichboats.co.uk"),
    (4, "Collingwood Boat Builders", "29 Townsend Street, Collingwood", "CL27 2DU", "01513742985", "admin@collingwoodboats.co.uk"),
    (5, "Elton Moss Boat Builders", "Unit 4 Kings Lock Boatyard Booth Lane, Middlewich", "MW63 8TY", "01270760160", "admin@eltonmossboats.co.uk"),
    (6, "Aintree Boat Company Ltd", "Brookfield Drive, Liverpool", "L1 6GU", "01515239000", "admin@aintreeboats.co.uk"),
    (7, "Braidbar Boats Ltd", "Lord Vernons Wharf Lyme Road Higher, Poynton", "PY12 9TS", "01625873471", "admin@braidbarboats.co.uk"),
    (8, "Bourne Boat Builders Ltd", "Teddesley Road, Penkridge", "PE8 7SU", "01785714692", "admin@bourneboats.co.uk"),
    (9, "Stoke on Trent Boat Building Co Ltd", "Longport Wharf Station Street, Stoke-on-Trent", "ST6 9GU", "01782813831", "admin@stokeboats.co.uk"),
    (10, "MGM Boats Narrowboat Builders", "27 Mill Lane, Leicester", "LE6 9FY", "01162640009", "admin@mgmboats.co.uk"),
    (11, "Zinter Ltd", "13 Lower Chatham Street, Manchester", "M1 5SX", "01262348009", "admin@zinter.co.uk"),
    (12, "Speed Shack", "27 Hart Lane, London", "N3 9GW", "01162640009", "admin@speedshack.co.uk"),
    (13, "Kayak Verse", "12 Binter Road, Sheffield", "S6 4FV", "02206952396", "admin@kayakverse.co.uk"),
    (14, "Aston Boats Ltd", "4 Ulton Road, Leicester", "LE1 3RG", "01762648579", "admin@astonboats.co.uk"),
    (15, "Rapid Rowing Ltd", "69 Hilton Drive, Bolton", "LE6 4FO", "08164567869", "admin@rapidrowing.co.uk");
    
    
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
    (23, 2, 2, "2015-10-12", 5440, "MasterSail"),
    (24, 3, 11, "2013-12-16", 7000, "TurboSail"),
    (25, 7, 10, "2017-12-16", 3500, "Classic"),
    (26, 4, 4, "2018-09-12", 2860, "PremiumSail"),
    (27, 6, 5, "2012-05-19", 4800, "NightShark"),
    (28, 6, 5, "2013-01-30", 4800, "NightShark");
    
    
insert into Reservation
	(ReservationID, ClassID, CustomerID, ReserveDate, PeriodOfHire)
Values(5359, 3, 10, '2020-10-20', 1),
	(5362, 3, 9, '2020-10-20', 1),
    (5365, 3, 11, '2020-10-20', 1),
    (5363, 3, 9, '2020-10-20', 1),
    (5367, 1, 2, '2021-01-2', 1),
    (5368, 6, 6, '2021-01-5', 1),
    (5369, 4, 2, '2021-01-8', 1),
    (5370, 8, 5, '2021-01-6', 2),
    (5371, 2, 10, '2021-01-12', 1);
    
insert into Maintenance 
	(BoatID, MainRefNo, FaultDetails, FaultDate, ActionDetails, ActionDate)
Values(1, 1, 'Chipped propeller', '2015-02-15', 'Replace Propeller', '2015-02-27'),
	(1, 2, 'Bilge pumps gone', '2015-07-10', 'New bilge pumps', '2015-08-27'),
    (1, 3, Null, Null, 'New head pumps', '2015-08-15'),
    (1, 4, Null, Null, 'Normal Service', '2016-03-20'),
    (1, 5, 'Cutless bearing worn through', '2016-12-02', 'Fit new bearing', '2017-01-27'),
    (3, 1, 'Damaged mast', '2016-04-17', 'Repair Mast', '2016-04-27'),
    (3, 2, 'Bent Forestay', '2017-07-10', 'Replace Forestay', '2017-08-22'),
    (3, 3, 'Shot Boom', '2018-05-07', 'Replace Boom', '2018-06-06'),
    (3, 4, 'Rudderstock Chipped', '2019-07-07', 'Repair Rudderstock', '2019-07-08'),
    (3, 5, Null, Null, 'Normal Service', '2020-01-27'),
    (3, 6, 'Rudderblade busted', '2020-10-19', Null, Null),
    (4, 1, 'Dead battery', '2020-11-26', 'Replaced Battery', '2020-12-15'),
    (4, 2, Null, Null, 'Normal service', '2020-12-15'),
    (6, 1, 'Boat Engine is overheating', '2020-11-1', 'Cleaned raw water intake', '2020-12-20'),
    (6, 2, Null, Null, 'Normal service', '2021-01-10'),
    (7, 1, Null, Null, 'New impeller', '2021-01-13');
    
    
INSERT INTO Customer(CustomerID, First_name, Last_name, Address, Email, Phone_number, Postcode)
VALUES (1, 'Dion', 'Brodnecke', '9 Oak Street Liverpool', 'dbroes1@who.int', '07174826351', 'L34 8DY'),
(2, 'Scarlett', 'Galley', '886 Northport Parkway, Liverpool', 'scargr1c@imgur.com', '03260476982', 'L3 6DF'),
(3, 'Sissy', 'Gadson', '95 Putney Road, Liverpool', 'sgadson1b@ucoz.com', '04924556740', 'L2 7YG'),
(4, 'Tabby', 'Minichi', '6 Amoth Court, Warrington', 'minitabc@imgur.com', '07795213673', 'WT6 8UY'),
(5, 'Nellie', 'Greenmon', '40 Graceland Crossing, Liverpool', 'nelliegreen12@patch.com', '03816078215', 'L23 8FY'),
(6, 'Hanny', 'Marsters', '2 Almo Trail, Liverpool', 'hmarsters@netlog.com', '07075576685', 'L21 9FY'),
(7, 'Oswell', 'Aspinell', '64 Jackson Road, Liverpool', 'OsAspinell@digg.com', '09931348133', 'L5 6FH'),
(8, 'Florance', 'Baston', '40 Magdeline Lane, Warrington', 'FloBar@dirtg.com', '07315082134', 'WT5 8WK'),
(9, 'Candice', 'Tumilson', '1 Farragut Parkway, Liverpool', 'canditum15@bloomberg.com', '01639824657', 'L75 8GJ'),
(10, 'Clair', 'Bavin', '87 Toban Drive, Liverpool', 'clairBav@sprog.it', '06245985897', 'L26 8GH'),
(11, 'John', 'Terry', null, 'Terry2D@ok.com', '0201772227', 'SE10 1NH'),
(12, 'Justin', 'Beiber', null, 'Beiber@pop.com', '0167756413', 'LABC564' ),
(13, 'David', 'Hockney', null, 'hockers@gall.com', '0154326412', 'N1 1XY'),
(14, 'David', 'Blaine', null, 'blaine@magic.org', '0154326412', 'N1 1XY'),
(15, 'Yves', 'Niyo', null, 'yniyo54@gmail.com', '07893647292','BL4 6YH'),
(16, 'Michael', 'Jackson', null, 'michaelj@hotmail.com', '01612836493', 'M25 7DK'),
(17, 'Harry', 'Maguire', null, 'harry5@yahoo.com', '074629213764', 'S7 7DG'),
(18, 'Yves', 'Bissouma','98 Withins Drive, Brighton', 'yvesb@yahoo.com' ,'07284629462', 'BN5 7BH'), 
(19, 'Frederico', 'Hernandez', '84 Long Lane, London', 'fredagain@yahoo.com','07938365439', 'SW16 6TY');



INSERT INTO Rental (RentalID, RentDate, Amount_paid, CustomerID, BoatID, PeriodOfHire)
VALUES (4734, '2019-05-02', 125, 11, 00001,0.5),
(4745, '2019-05-03', 125, 12, 00001,0.5),
(4812, '2019-05-04', 400, 13, 00001,2),
(4875, '2019-05-06', 200, 14, 00001,1),
(5344, '2020-10-20', 280, 1, 9, 1),
(5345, '2020-10-20', 220, 2, 16, 1),
(5347, '2020-10-20', 240, 9, 7, 1),
(5346, '2020-10-20', 240, 4, 6, 1),
(5349, '2020-10-20', 140, 7, 9, 1),
(5348, '2020-10-20', 240, 2, 15,1),
(5350, '2020-10-20', 180, 2, 9, 1),
(5352, '2020-10-20', 110, 5, 16, 1),
(5353, '2020-10-20', 110, 5, 17, 1),
(5354, '2020-10-20', 400, 9, 14, 2),
(5351, '2020-10-20', 180, 2, 11, 1),
(5364, '2020-10-20', 110, 8, 4, 1),
(5355, '2020-10-20', 400, 9, 13, 2),
(5356, '2020-10-20', 200, 1, 8, 1),
(5357, '2020-10-20', 200, 6, 1, 1),
(5358, '2020-10-20', 120, 7, 10, 1),
(5366, '2020-10-20', 80, 10, 21, 0.5),
(5360, '2020-10-20', 280, 4, 20, 1),
(5361, '2020-10-20', 240, 8, 2, 1),
(5342, '2020-04-27', 180, 1, 16, 1),
(5341, '2019-10-20', 0, 4, 6, 1),
(5343, '2019-12-09', 240, 2, 6, 1),
(5676, '2019-12-09', 230, 19,26, 1),
(5677, '2019-12-09', 180, 12,3, 1),
(5678, '2019-12-09', 280, 9,7, 1),
(5679, '2019-12-09', 500, 13,12, 2),
(5680, '2019-12-09', 340, 8,1, 1);
    
INSERT INTO Dealer (DealerID, DealerName, TelephoneNumber, Address, Email)  
VALUES (1, 'Dalis Vannoort', 07574137463, '77 A828, Appin, AP7 6GU', 'dvannoort0@salon.com'),
(2, "Joe's Junk", 07365534221, '15 Back Lane, Buxton, BX7 5FY', 'JoesJunk@zdnet.com'),
(3, 'Hoebart Kubera', 07874051869, '4 Finedon House, Marine Parade, Littlestone, LS4 6GU', 'hkubera2@who.int'),
(4, 'Eva Iacomettii', 07880072148, '9 Hartlands, Onslow Road, Newent, NW5 8TU', 'eiacomettii3@admin.ch'),
(5, 'Alley Pate', 07822040557, '07610 Arizona Alley, A67 8GU', 'apate4@gnu.org'),
(6, 'Korrie Legge', 07380018233, '1076 Evesham Road, Astwood Bank, DT5 8JO', 'klegge5@reference.com'),
(7, 'Minne Hinkens', 07978390430, '53 Balby Road, Balby, B7 8HK', 'mhinkens6@smh.com.au'),
(8, 'Inigo MacAllaster', 07893419552, '1910 Farwell Plaza, G56 9FT', 'imacallaster7@blogspot.com'),
(9, 'Linell Skeeles', 07532931207, '57 Great Russell Street, London, NW1 8TU', 'lskeeles8@goo.gl'),
(10, 'Sioux Drogan', 07417098738, '75 Thomas Parsons Square, Ely, EL6 9GU', 'sdrogan9@dropbox.com'),
(11, 'Yves Neyo', 07694201011, '21 notverysmart road, m12 42k', 'yvesneyo@gmail.com' ),
(12, 'Ben smalls', 07767902849, '47 rubicon lane, sk4 8gl', 'bensmalls@gmail.com'),
(13, 'Umair johnson', 08001807664, '360 cygnet road, m30 12j', 'Drumairjohnson@.com'),
(14, 'Elod sipos', 09020394069, '250 grand drive, m40 62p', 'Elod@gmail.com'),
(15, 'Sherry oba', 07980102939, '187 oakland grove, sk8 l87', 'sherryoba@gmail.ocm')
;

INSERT INTO Disposal (DealerID, BoatNumber, SaleDate, SalePrice)
VALUES (2, 1, '2020-11-30', 1500.00 ),
(11, 2, '2022-03-03', 400.00 ),
(9, 3, '2019-06-19', 1000.00 ),
(15, 4, '2022-08-20', 3075.00),
(3, 5, '2022-10-24', 1750.00),
(1, 6, '2018-05-15', 2200.00)
;