INSERT INTO Sales.Customer (FirstName,LastName, Email, PhoneNumber, Street, City, CustomerState, ZipCode)
	VALUES  (N'Alicia', N'Brown', N'abrown@gmail.com', 4695367410, N'123 Cougar Lane', 'Columbia', N'MO', 65201),
			(N'Brian', N'Camp', N'bcamp@gmail.com', 5732345678, N'1259 Cougar Drive', 'Columbia', N'MO', 65201),
			(N'Casey', N'Hall', N'chall@gmail.com', 5739876543, N'2056 Hallow Lane', 'Columbia', N'MO', 65201),
			(N'Josh', N'Atkins', N'jjatkins@cougars.ccis.edu', 7568523410, N'84 Rogers Avenue', 'Columbia', N'MO', 65201),
			(N'Damian', N'Payne', N'dpayne@cougars.ccis.edu', 6547426532, N'3786 Broadway', 'Columbia', N'MO', 65201),
			(N'Amee', N'Inthaluexay', N'ainthaluexay@cougars.ccis.edu', 3142673760, N'1023 Cougar Village', 'Columbia', N'MO', 65201)

SELECT * FROM Sales.Customer;

INSERT INTO Sales.AccountType (TypeName)
	VALUES	(N'University'),
			(N'Public')

SELECT * FROM Sales.AccountType;

INSERT INTO Sales.Benefit (BenefitName, BenefitDescription)
	VALUES	(N'Tax Deduction', N'Sale price less 10% for Elite Tigers.'),
			(N'Pre-Season Party', N'Tigers, Pink Tigers, and Elite Tigers are invited to pre-season parties with athletes!'),
			(N'Meet and Greet', N'All members can enjoy athlete meet and greets.'),
			(N'Member Points', N'All members earn points with donations of $50 or more. 350 points can earn a free t-shirt or $10 off purchases.'),
			(N'Pink and Elite Tiger Points', N'Pink and Elite Tigers earn 400 points with donations of $50 or more. 300 points can decrease season tickets by $75!')

SELECT * FROM Sales.Benefit;


INSERT INTO Sales.Account (CustomerId, AccountTypeId, BenefitId)
	VALUES	(1, 2, 5),
			(2, 1, 4),
			(3, 1, 3),
			(4, 2, 1),
			(5, 1, 2),
			(6, 2, 5)

SELECT * FROM Sales.Account;


INSERT INTO Sales.Donation (Amount, MemberType, ReceiptDateTime)
	VALUES  (15.00, N'Scratch', '2020-02-14 10:15:20'),
			(9045.00, N'Tiger', '2021-06-10 09:15:30'),
			(750000.00, N'Pink Tiger', '2021-10-31 20:15:20'),
			(120000.00, N'Elite Tiger', '2020-04-14 07:15:00'),
			(150.00, N'Scratch', '2021-02-20 12:45:55'),
			(155000.00, N'Elite Tiger', '2021-03-26 18:15:20')

SELECT * FROM Sales.Donation;

INSERT INTO Sales.Merchandise (Item, ItemDescription, Price, SalePrice)
		VALUES  ('Football Jersey', 'TSU L Jersey #24', 85.99, 94.59),
				('Tennis Skirt', 'TSU M Tennis Skirt Black', 35.75, 39.33),
				('Season Ticket Package', 'Season Tickets: Football', 285.00, 313.5),
				('Season Ticket Package', 'Season Tickets: Baseball', 255.00, 280.5),
				('Season Ticket Package', 'Season Tickets: Womens Soccer', 210.00, 231.00),
				('Baseball Hat', 'TSU Baseball Cap One Size', 28.50, 31.35)

SELECT * FROM Sales.Merchandise;

INSERT INTO Sales.Purchase (AccountId, MerchandiseId, Quantity)
		Values	(5, 1, 2),
				(2, 2, 4),
				(1, 3, 1),
				(4, 4, 1),
				(6, 5, 1),
				(3, 6, 3)

SELECT * FROM Sales.Purchase;

INSERT INTO Sales.Ticket (AccountId,TicketPrice, SportType, SeatType, SaleDateTime, GameDateTime, OpponentName)
	VALUES  (6, 35.00, N'Football', N'Section C Seat 30', '2020-09-10 17:30:04', '2020-09-13 12:00:00', N'Columbia College'),
			(4, 35.00, N'Baseball', N'Section A Seat 22', '2020-03-15 12:00:34', '2021-03-23 19:00:00', N'MIZZOU'),
			(1, 35.00, N'Womens Soccer', N'Section D Seat 05', '2021-01-10 10:36:13', '2021-05-11 15:00:00', N'UMSL'),
			(6, 35.00, N'Womens Softball', N'Section A Seat 33', '2020-12-05 22:54:10', '2021-06-12 15:45:00', N'Stephens College')

SELECT * FROM Sales.Ticket;

INSERT INTO Sales.TicketType (TypeName, TicketId)
	VALUES	(N'Public', 2),
			(N'University', 1),
			(N'University', 3),
			(N'Public', 4)

SELECT * FROM Sales.TicketType;








INSERT INTO Athletics.Season (SeasonName, StartDate, EndDate)
	VALUES (N'Fall', '2021-9-01 00:00:00', '2021-11-30 00:00:00'),
		   (N'Winter', '2021-12-01 00:00:00', '2021-02-28 00:00:00'),
		   (N'Spring', '2021-03-01 00:00:00', '2021-05-31 00:00:00'),
	       (N'Summer', '2021-06-01 00:00:00', '2021-08-31 00:00:00')

INSERT INTO Athletics.Sport (SportName)
	VALUES (N'Basketball'),
		   (N'Golf'),
		   (N'Tennis'),
		   (N'Baseball'),
		   (N'Hockey'),
		   (N'Football')

INSERT INTO Athletics.Game (GameType)
	VALUES (N'Regular Season'),
		   (N'Regional Playoffs'),
		   (N'NCAA Tournament'),
		   (N'Special Event')

INSERT INTO Athletics.Athlete (FirstName, LastName, AthleteHeight, AthleteWeight, Hometown, Class, HighSchool, Bio)
	VALUES (N'James', N'Cutler', N'6ft 2in', N'220 lbs', N'Columbia, MO', N'Sophomore', N'George Washington High', N'James has 3 sisters and a 3.5 GPA.'),
		   (N'Jane', N'Moss', N'5ft 7in', N'140 lbs', N'Columbia, MO', N'Senior', N'St. Peter High', N'Jane has two brothers who graduated from TSU and is currently an All-American.'),
	       (N'Adam', N'Graves', N'5ft 11in', N'176 lbs', N'Austin, TX', N'Sophomore', N'Alamo High', N'Adam transferred from the University of Texas and loves his 2 dogs.'),
		   (N'Rita', N'Martinez', N'6ft 0in', N'185 lbs', N'San Diego, CA', N'Freshman', N'Coastal High', N'Rita was a National Honors Society member and loves to listen to music.')






INSERT INTO Athletics.Season (SeasonName, StartDate, EndDate)
	VALUES (N'Fall', '2021-9-01 00:00:00', '2021-11-30 00:00:00'),
		   (N'Winter', '2021-12-01 00:00:00', '2021-02-28 00:00:00'),
		   (N'Spring', '2021-03-01 00:00:00', '2021-05-31 00:00:00'),
	       (N'Summer', '2021-06-01 00:00:00', '2021-08-31 00:00:00')

INSERT INTO Athletics.Sport (SportName)
	VALUES (N'Basketball'),
		   (N'Golf'),
		   (N'Tennis'),
		   (N'Baseball'),
		   (N'Hockey'),
		   (N'Football')

INSERT INTO Athletics.Game (GameType)
	VALUES (N'Regular Season'),
		   (N'Regional Playoffs'),
		   (N'NCAA Tournament'),
		   (N'Special Event')

INSERT INTO Athletics.Athlete (FirstName, LastName, AthleteHeight, AthleteWeight, Hometown, Class, HighSchool, Bio)
	VALUES (N'James', N'Cutler', N'6ft 2in', N'220 lbs', N'Columbia, MO', N'Sophomore', N'George Washington High', N'James has 3 sisters and a 3.5 GPA.'),
		   (N'Jane', N'Moss', N'5ft 7in', N'140 lbs', N'Columbia, MO', N'Senior', N'St. Peter High', N'Jane has two brothers who graduated from TSU and is currently an All-American.'),
	       (N'Adam', N'Graves', N'5ft 11in', N'176 lbs', N'Austin, TX', N'Sophomore', N'Alamo High', N'Adam transferred from the University of Texas and loves his 2 dogs.'),
		   (N'Rita', N'Martinez', N'6ft 0in', N'185 lbs', N'San Diego, CA', N'Freshman', N'Coastal High', N'Rita was a National Honors Society member and loves to listen to music.')

