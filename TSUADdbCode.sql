USE master;
IF DB_ID(N'TSUAD') IS NOT NULL DROP DATABASE TSUAD
CREATE DATABASE TSUAD;
GO
USE TSUAD;
GO
CREATE SCHEMA Sales AUTHORIZATION dbo;
GO
CREATE SCHEMA Athletics AUTHORIZATION dbo;
GO

CREATE TABLE Sales.Customer
(
	CustomerId INT NOT NULL IDENTITY,
	FirstName NVARCHAR(120) NOT NULL,
	LastName NVARCHAR(120) NOT NULL,
	Email NVARCHAR(120) NOT NULL,
	PhoneNumber NVARCHAR(30) NOT NULL,
	Street NVARCHAR(120) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	CustomerState NCHAR(2) NOT NULL,
	ZipCode NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Customer PRIMARY KEY(CustomerId)
);

CREATE TABLE Sales.AccountType
(
	AccountTypeId INT NOT NULL IDENTITY,
	TypeName NVARCHAR(120) NOT NULL
	CONSTRAINT PK_AccountType PRIMARY KEY(AccountTypeId)
);


CREATE TABLE Sales.Benefit
(
	BenefitId INT NOT NULL IDENTITY,
	BenefitName NVARCHAR(120) NOT NULL,
	BenefitDescription NVARCHAR(1000) NOT NULL
	CONSTRAINT PK_Benefit PRIMARY KEY(BenefitId)
);


CREATE TABLE Sales.Account
(
	AccountId INT NOT NULL IDENTITY,
	AccountTypeId INT NOT NULL,
	CustomerId INT NOT NULL,
	BenefitId INT NOT NULL
	CONSTRAINT PK_Account PRIMARY KEY(AccountId),
	CONSTRAINT FK_Account_AccountType FOREIGN KEY(AccountTypeId) REFERENCES Sales.AccountType(AccountTypeId),
	CONSTRAINT FK_Account_Customer FOREIGN KEY(CustomerId) REFERENCES Sales.Customer(CustomerId),
	CONSTRAINT FK_Account_Benefit FOREIGN KEY(BenefitId) REFERENCES Sales.Benefit(BenefitId)
);

CREATE TABLE Sales.Donation
(
	DonationID INT NOT NULL IDENTITY,
	Amount MONEY NOT NULL,
	MemberType NVARCHAR(1000) NOT NULL,
	ReceiptDateTime DATETIME2 NULL
	CONSTRAINT PK_Donation PRIMARY KEY(DonationId)
);

CREATE TABLE Sales.Merchandise
(
	MerchandiseId INT NOT NULL IDENTITY,
	Item NVARCHAR(100) NOT NULL,
	ItemDescription NVARCHAR(1000) NOT NULL,
	Price MONEY NOT NULL, 
	SalePrice MONEY NOT NULL
	CONSTRAINT PK_Merchandise PRIMARY KEY(MerchandiseId)
);

CREATE TABLE Sales.Purchase
(
	AccountId INT NOT NULL,
	MerchandiseId INT NOT NULL,
	Quantity INT NOT NULL
	CONSTRAINT PK_Purchase PRIMARY KEY(AccountId, MerchandiseId),
	CONSTRAINT FK_Purchase_Account FOREIGN KEY(AccountId) REFERENCES Sales.Account(AccountId),
	CONSTRAINT FK_Purchase_Merchandise FOREIGN KEY(MerchandiseId) REFERENCES Sales.Merchandise(MerchandiseId)
);

CREATE TABLE Sales.Ticket
(
	TicketId INT NOT NULL IDENTITY,
	TicketPrice MONEY NOT NULL,
	SportType NVARCHAR(120) NOT NULL,
	SeatType NVARCHAR(120) NOT NULL,
	SaleDateTime DATETIME2 NULL,
	GameDateTime DATETIME2 NULL,
	OpponentName NVARCHAR(1000) NOT NULL,
	AccountId INT NOT NULL
	CONSTRAINT PK_Ticket PRIMARY KEY(TicketId),
	CONSTRAINT FK_Ticket_Account FOREIGN KEY(AccountId) REFERENCES Sales.Account(AccountId)
);

CREATE TABLE Sales.TicketType
(
	TicketTypeId INT NOT NULL IDENTITY,
	TypeName NVARCHAR(120) NOT NULL,
	TicketId INT NOT NULL
	CONSTRAINT PK_TicketType PRIMARY KEY(TicketTypeId),
	CONSTRAINT FK_TicketType_Ticket FOREIGN KEY(TicketId) REFERENCES Sales.Ticket(TicketId)
);


CREATE TABLE Athletics.Season
(
	SeasonId INT NOT NULL IDENTITY,
	SeasonName NVARCHAR(120) NOT NULL,
	StartDate DATETIME2 NOT NULL,
	EndDate DATETIME2 NOT NULL
	CONSTRAINT PK_Season PRIMARY KEY(SeasonId)
);

CREATE TABLE Athletics.Sport
(
	SportId INT NOT NULL IDENTITY,
	SportName NVARCHAR(120) NOT NULL,
	SeasonId INT NOT NULL
	CONSTRAINT PK_Sport PRIMARY KEY(SportId),
	CONSTRAINT FK_Sport_Season FOREIGN KEY(SeasonId) REFERENCES Athletics.Season(SeasonId)

);

CREATE TABLE Athletics.Game
(
	GameId INT NOT NULL IDENTITY,
	GameType NVARCHAR(120) NOT NULL
	CONSTRAINT PK_Game PRIMARY KEY(GameId)
);

CREATE TABLE Athletics.Athlete
(
	AthleteId INT NOT NULL IDENTITY,
	FirstName NVARCHAR(120) NOT NULL,
	LastName NVARCHAR(120) NOT NULL,
	AthleteHeight NVARCHAR(120) NOT NULL,
	AthleteWeight NVARCHAR(120) NOT NULL,
	Hometown NVARCHAR(120) NOT NULL,
	Class NVARCHAR(120) NOT NULL,
	HighSchool NVARCHAR(120) NOT NULL,
	Bio NVARCHAR(120) NOT NULL
	CONSTRAINT PK_Athlete PRIMARY KEY(AthleteId)
)

CREATE TABLE Athletics.NewsList
(
	NewsListId INT NOT NULL IDENTITY
	CONSTRAINT PK_NewsList PRIMARY KEY(NewsListId)
);

CREATE TABLE Athletics.Team
(
	TeamId INT NOT NULL IDENTITY,
	TeamName NVARCHAR(120) NOT NULL,
	Mascot NVARCHAR(120) NOT NULL,
	SportId INT NOT NULL,
	NewsListId INT NOT NULL
	CONSTRAINT PK_Team PRIMARY KEY(TeamId),
	CONSTRAINT FK_Team_Sport FOREIGN KEY(SportId) REFERENCES Athletics.Sport(SportId),
	CONSTRAINT FK_Team_NewsList FOREIGN KEY(NewsListId) REFERENCES Athletics.NewsList(NewsListId)
);

CREATE TABLE Athletics.Schedule
(
	ScheduleId INT NOT NULL IDENTITY,
	GameDate DATETIME2 NULL,
	StartTime DATETIME2 NULL,
	EndTime DATETIME2 NULL,
	DayOfTheWeek NVARCHAR(120) NOT NULL, 
	City NVARCHAR(120) NOT NULL, 
	GameState NVARCHAR(120) NOT NULL,
	Opponent NVARCHAR(120) NOT NULL, 
	GameType NVARCHAR(120) NOT NULL, 
	TeamId INT NOT NULL
	CONSTRAINT PK_Schedule PRIMARY KEY(ScheduleId),
	CONSTRAINT FK_Schedule_Team FOREIGN KEY(TeamId) REFERENCES Athletics.Team(TeamId)
);

CREATE TABLE Athletics.Article
(
	ArticleId INT NOT NULL IDENTITY, 
	Headline NVARCHAR(120) NOT NULL,
	PostDate DATETIME2 NOT NULL,
	Content NVARCHAR(2000) NOT NULL,
	NewsListId INT NOT NULL
	CONSTRAINT PK_Article PRIMARY KEY(ArticleId),
	CONSTRAINT FK_Article_NewsList FOREIGN KEY(NewsListId) REFERENCES Athletics.NewsList(NewsListId)
);

CREATE TABLE Athletics.Player
(
	AthleteId INT NOT NULL,
	TeamId INT NOT NULL, 
	Position NVARCHAR(120) NOT NULL,
	UniformNumber INT NOT NULL
	CONSTRAINT PK_Player PRIMARY KEY(AthleteId, TeamId),
	CONSTRAINT FK_Player_Athlete FOREIGN KEY(AthleteId) REFERENCES Athletics.Athlete(AthleteId),
	CONSTRAINT FK_Player_Team FOREIGN KEY(TeamId) REFERENCES Athletics.Team(TeamId)
);
