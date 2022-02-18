CREATE TABLE Supplier (
	SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Address VARCHAR(30),
    PostCode VARCHAR(8),
    Telephone VARCHAR(15),
    Email VARCHAR(20)
);

CREATE TABLE Boat (
	BoatID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT NOT NULL,
    ClassID INT NOT NULL,
    PurchaseDate DATE,
    PurchaseValue DECIMAL(8, 2),
    Model VARCHAR(20),
    
    CONSTRAINT FK_BOAT_SUPPLIER_ID FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID) ON UPDATE CASCADE,
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