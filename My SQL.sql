
create table Disposal (
DealerID int primary key auto_increment,
BoatNumber int primary key auto_increment,
SaleDate date,
SalePrice int,

CONSTRAINT primary key (DealerID, BoatNumber),
constraint fk_DealerID foreign key (DealerID) references Dealer_Class (DealerID) ON UPDATE CASCADE
);

create table Dealer (
DealerID int primary key auto_increment,
DealerName varchar(50),
Address varchar(100),
TelephoneNumber int,
Email varchar(100),

CONSTRAINT primary key (DealerID)
);