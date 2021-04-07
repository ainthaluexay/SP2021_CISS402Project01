--6 a. Display all sports for current season (Spring), including both men's and women's sports.
--test for sqlstatement

SELECT * 
FROM Athletics.Sport
WHERE SeasonId = 3;

--6 b. Display all rosters for women's basketball
SELECT *
FROM Athletics.Team
WHERE TeamId = 2;

--6 c. Display all the statistics for women's basketball played at a specific date in the past.
--


--6 d. Display all new related to women's basketball.
SELECT * 
FROM Athletics.Article
WHERE ArticleId = 2;

--6 e. Update a women's basketball schedule at a specific future date. Modify the play time due to the weather forecast.
UPDATE Athletics.Schedule
	SET StartTime = '12:00:00',
		EndTime = '14:30:00'

SELECT * FROM Athletics.Schedule;

INSERT INTO Athletics.Article (Headline, PostDate, Content, NewsListId)
	VALUES ('Lady Tigers Basketball Time Change!!!!', '2020-08-27 08:52:00', 'The Lady Tigers Basketball game time has changed to 12:00 pm due to inclement weather', 4)

SELECT * FROM Athletics.Article;

