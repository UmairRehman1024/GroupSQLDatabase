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
    (1, 5, 'Cutless bearing worn through', '2016-12-02', 'Fit new bearing', 2017-01-27),
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
    