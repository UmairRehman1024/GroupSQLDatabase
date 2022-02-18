create table Boat_Class (
	ClassID int primary key auto_increment,
    Classification varchar(20) CHECK (Classification IN ("very large", "large", "standard", "small")),
    Size varchar(15) CHECK (Classification IN ("very large", "large", "standard", "small")),
    HalfDayPrice decimal (5,2),
    FullDayPrice decimal (5,2)
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
    MainRefNo int AUTO_INCREMENT,
    FaultDetails varchar(100),
    FaultDate date,
    ActionDetails varchar(50),
    ActionDate date,
    Priority INT DEFAULT 2,
    
	constraint primary key (BoatID, MainRefNo),
    CONSTRAINT FK_BOAT_ID FOREIGN KEY (BoatID) REFERENCES Boat (BoatID) ON UPDATE CASCADE
);