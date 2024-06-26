--Table LOC_COUNTRY

--1.SELECT ALL PROCEDURE--
--EXEC PR_LOC_COUTNRY_SELECTALL

CREATE PROC PR_LOC_COUTNRY_SELECTALL
AS
SELECT * FROM LOC_Country

--2.SELECT BY PK--
--EXEC PR_LOC_COUNTRY_SELECTBYPK 4

CREATE PROC PR_LOC_COUNTRY_SELECTBYPK
@COUNTRYID INT
AS
SELECT * FROM LOC_Country WHERE LOC_Country.CountryID = @COUNTRYID

--3.INSERT--
--EXEC PR_LOC_COUNTRY_INSERT 'INDIA','21'

CREATE PROC PR_LOC_COUNTRY_INSERT
@COUNTRYNAME VARCHAR(100),
@COUNTRYCODE VARCHAR(50)
AS
INSERT INTO LOC_Country (CountryName,CountryCode)
VALUES (@COUNTRYNAME,@COUNTRYCODE)

--4.UPDATE
--EXEC PR_LOC_COUNTRY_UPDATE 2,'INDIAAA','22'

ALTER PROC PR_LOC_COUNTRY_UPDATE
@COUNTRYID INT,
@COUNTRYNAME VARCHAR(100),
@COUNTRYCODE VARCHAR(50)
AS
UPDATE LOC_Country
	SET CountryName = @COUNTRYNAME,
		CountryCode = @COUNTRYCODE,
		Modified    = GETDATE()
	WHERE 
		CountryID   = @COUNTRYID 

--5.DELETE
--EXEC PR_LOC_COUNTRY_DELETE 1

CREATE PROC PR_LOC_COUNTRY_DELETE
@COUNTRYID INT
AS
	DELETE FROM LOC_Country
	WHERE CountryID = @COUNTRYID



