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