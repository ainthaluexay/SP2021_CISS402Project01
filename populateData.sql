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


