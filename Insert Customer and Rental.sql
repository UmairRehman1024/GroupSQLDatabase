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
(18, 'Yves', 'Bissouma', '98 Withins Drive, Brighton', '07284629462', 'BN5 7BH'), 
(19, 'Frederico', 'Hernandez', '84 Long Lane, London', '07938365439', 'SW16 6TY');



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