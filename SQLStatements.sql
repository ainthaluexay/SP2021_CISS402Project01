--6 a. Display all sports for current season (Spring), including both men's and women's sports.
--test for sqlstatement

SELECT * 
FROM Athletics.Sport
WHERE SeasonId = 3;

--6 b. Display all rosters for women's basketball
SELECT Roster
FROM Athletics.Team AS T JOIN Athletics.Player AS P
ON T.TeamId = P.TeamId
WHERE P.TeamId = 2;

--6 c. Display all the statistics for women's basketball played at a specific date in the past.
SELECT *
FROM Athletics.Season
WHERE EndDate = '2021-02-28 00:00:00';


--6 d. Display all new related to women's basketball.
SELECT * 
FROM Athletics.Article
WHERE ArticleId = 2;

--6 e. Update a women's basketball schedule at a specific future date. Modify the play time due to the weather forecast.
--create trigger
--when schedule updates
--article updates
GO
CREATE OR ALTER TRIGGER Athletics.trgScheduleArticleUpdate
ON Athletics.Schedule
AFTER UPDATE
AS
SET NOCOUNT ON;
DECLARE @auditAction NVARCHAR(1000);
SET @auditAction = '';
IF UPDATE (StartTime)
	SET @auditAction += 'There was an update to the Lady Tigers Basketball game start time due to inclement weather.';

INSERT INTO Athletics.Article (Headline, PostDate, Content, NewsListId)
	VALUES  ('Schedule Update', GETDATE(), @auditAction, 2);

GO

UPDATE Athletics.Schedule
	SET StartTime = '12:00:00',
		EndTime = '14:30:00'
	WHERE TeamId = 2;

SELECT * FROM Athletics.Schedule;
SELECT * FROM Athletics.Article;

--f Display all home games for womans basketball
SELECT *
FROM Athletics.Schedule
WHERE City = 'Columbia';


--g Display all women's basketball t-shirts

SELECT *
FROM Sales.Merchandise
WHERE Item LIKE '%Lady Tigers Basketball T-shirt%';

-- h display tickest for women's basketball for specific future date

SELECT *
FROM Sales.Ticket
WHERE SportType = 'Womens Basketball';

-- i Display ticket infor for women's basketball on specific future date for specific account
SELECT * 
FROM Sales.Ticket
WHERE MONTH(GameDateTime) ='10';

-- j display account if for specific account
SELECT * 
FROM Sales.Account AS A JOIN Sales.Customer AS C
ON A.CustomerId = C.CustomerId
WHERE A.AccountId = 4;