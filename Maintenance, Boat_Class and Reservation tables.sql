create table Boat_Class (
	ClassID int primary key auto_increment,
    Classification varchar(20),
    Size varchar(15),
    HalfDayPrice decimal (5,2),
    FullDayPrice decimal (5,2)
    
);

create table Reservation (
	ReservationID int primary key auto_increment,
    ClassID int,
    CustomerID int,
    ReserveDate date,
    PeriodOfHire varchar(10),
    

	constraint fk_ClassID foreign key (ClassID)
		references Boat_Class (ClassID)
    
    
    
);

create table Maintenance (
	BoatID int,
    MainRefNo int,
    FaultDetails varchar(100),
    FaultDate date,
    ActionDetails varchar(50),
    ActionDate date,
    
	primary key (BoatID, MainRefNo)
    
);