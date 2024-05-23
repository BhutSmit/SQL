--=============================================================================================================================================

-- LOC_Country

--=============================================================================================================================================

-- 1. Select All

-- EXEC [dbo].[PR_Country_SelectAll]
-- Select All In LOC_Country Table

Create Procedure [dbo].[PR_Country_SelectAll]
As
Begin
	Select 
		 LOC_Country.CountryID
		,LOC_Country.CountryName
		,LOC_Country.CountryCode
		,LOC_Country.Created
		,LOC_Country.Modified
		
		From 
			LOC_Country
End

-- 2. Select By Primary Key

-- EXEC [dbo].[PR_Country_SelectAllByPK] 1
-- Select All In LOC_Country Table By PK

Create Procedure [dbo].[PR_Country_SelectAllByPK]
@CountryID int
As
Begin
	Select 
		 LOC_Country.CountryID
		,LOC_Country.CountryName
		,LOC_Country.CountryCode
		,LOC_Country.Created
		,LOC_Country.Modified
		
		From 
			LOC_Country
		where
			LOC_Country.CountryID = @CountryID
End


-- 3. Insert

-- Exec [dbo].[PR_LOC_Country_Insert] 'India' , '21'
-- Insert Into LOC_Country Table

Create Procedure [dbo].[PR_LOC_Country_Insert]
@CountryName nvarchar(100),
@countryCode nvarchar(100)
As
Begin
	
	Insert Into 
		LOC_Country 
		(CountryName , CountryCode)
		Values 
			(@CountryName , @countryCode)
End

-- 4. Update

-- Exec [dbo].[Pr_LOC_Country_Update] 2 , 'INDIA' , '1'
-- Update Record Into LOC_Country

Create Procedure [dbo].[Pr_LOC_Country_Update]
@CountryID int,
@CountryName varchar(100),
@CountryCode varchar(50)
As
Begin

	Update Loc_Country
		Set CountryCode = @CountryCode,
			CountryName = @CountryName,
			Modified = GETDATE()
		where
			CountryID = @CountryId
End

-- 5. Delete

-- Exec [dbo].[PR_LOC_Country_Delete] '1'
-- Delete In The LOC_Country

Create Procedure [dbo].[PR_LOC_Country_Delete]
@ContryID varchar(50)
As
Begin

	Delete From Loc_Country
		Where Loc_Country.CountryID = @ContryID

End



--=============================================================================================================================================

--LOC_CITY

--=============================================================================================================================================

--1.SELECTALL
EXEC PR_LOC_CITY_SELECTALL
CREATE PROC PR_LOC_CITY_SELECTALL
AS
	SELECT 
		LOC_City.CityID,
		LOC_City.CityName,
		LOC_City.Citycode,
		LOC_City.StateID,
		LOC_State.StateName,
		LOC_City.CountryID,
		LOC_Country.CountryName,
		LOC_City.Modified,
		LOC_City.Created

	FROM LOC_City

	INNER JOIN LOC_State
	ON LOC_City.StateID = LOC_State.StateID

	INNER JOIN LOC_Country
	ON LOC_City.CountryID = LOC_Country.CountryID

	ORDER BY 
		LOC_Country.CountryName,
		LOC_State.StateName,
		LOC_City.CityName

--2.SELECTBYPK
--EXEC PR_LOC_CITY_SELECTBYPK
CREATE PROC PR_LOC_CITY_SELECTBYPK
@CITYID INT
AS

SELECT  LOC_City.CityID,
		LOC_City.CityName,
		LOC_City.Citycode,
		LOC_City.StateID,
		LOC_State.StateName,
		LOC_City.CountryID,
		LOC_Country.CountryName,
		LOC_City.Modified,
		LOC_City.Created

	FROM LOC_City

	INNER JOIN LOC_State
	ON LOC_City.StateID = LOC_State.StateID

	INNER JOIN LOC_Country
	ON LOC_Country.CountryID = LOC_City.CountryID

	WHERE LOC_City.CityID = @CITYID

	ORDER BY 
		LOC_Country.CountryName,
		LOC_State.StateName,
		LOC_City.CityName

--3.INSERT
--EXEC PR_LOC_CITY_INSERT
CREATE PROC PR_LOC_CITY_INSERT
@CITYNAME  VARCHAR(100),
@CITYCODE  VARCHAR(50),
@COUNTRYID INT,
@STATEID   INT
AS
	INSERT INTO LOC_City 
	(CityName,Citycode,CountryID,StateID)
	VALUES
	(@CITYNAME,@CITYCODE,@COUNTRYID,@STATEID)

--4.UPDATE
--EXEC PR_LOC_CITY_UPDATE
CREATE PROC PR_LOC_CITY_UPDATE
@CITYID    INT,
@CITYNAME  VARCHAR(100) NULL,
@CITYCODE  VARCHAR(50) NULL,
@COUNTRYID INT NULL,
@STATEID   INT NULL
AS
	UPDATE LOC_City
	SET CityName = @CITYNAME,
		Citycode = @CITYCODE,
		CountryID = @COUNTRYID,
		StateID  = @STATEID
    WHERE CityID = @CITYID


--5.DELETE
--EXEC PR_LOC_CITY_DELETE
CREATE PROC PR_LOC_CITY_DELETE
@CITYID INT
AS
	DELETE FROM LOC_City
	WHERE CityID = @CITYID

--=============================================================================================================================================

-- LOC_State

--=============================================================================================================================================

-- 1. Select All

-- EXEC [dbo].[PR_State_SelectAll]
-- Select All In LOC_State Table

Create Procedure [dbo].[PR_State_SelectAll]
As
Begin
	Select 
		 LOC_State.StateID
		,LOC_State.StateName
		,LOC_State.StateCode
		,LOC_State.Created
		,LOC_State.Modified
		,LOC_Country.CountryName
		,LOC_Country.CountryCode
	
		From 
			LOC_State

		Inner Join LOC_Country
		On 
		LOC_State.CountryID = LOC_Country.CountryID

		Order By LOC_Country.CountryName , LOC_State.StateName
		
End

-- 2. Select By Primary Key

-- EXEC [dbo].[PR_State_SelectAllByPK] 1
-- Select All In LOC_State Table By PK

Alter Procedure [dbo].[PR_State_SelectAllByPK]
@StateID int
As
Begin
	Select 
		 LOC_State.StateID
		,LOC_State.StateName
		,LOC_State.StateCode
		,LOC_State.Created
		,LOC_State.Modified
		,LOC_Country.CountryName
		,LOC_Country.CountryCode
		
		From 
			LOC_State

		Inner Join LOC_Country
		On 
		LOC_State.CountryID = LOC_Country.CountryID

		where
			LOC_State.StateID = @StateID

		Order By LOC_Country.CountryName , LOC_State.StateName
End


-- 3. Insert

-- Exec [dbo].[PR_LOC_State_Insert] 'Gujarat' , '21' , 2
-- Insert Into LOC_State Table

Create Procedure [dbo].[PR_LOC_State_Insert]
@StateName nvarchar(100),
@StateCode nvarchar(100),
@CountryID int
As
Begin
	
	Insert Into 
		LOC_State
		(StateName , StateCode , CountryID)
		Values 
			(@StateName , @StateCode , @CountryID)
End

-- 4. Update

-- Exec [dbo].[Pr_LOC_State_Update] 2 , 'GUJARAT' , '1' , 1
-- Update Record Into LOC_State

Create Procedure [dbo].[Pr_LOC_State_Update]
@CountryID int,
@StateName varchar(100),
@StateCode varchar(50),
@StateID int
As
Begin

	Update LOC_State
		Set StateCode = @StateCode,
			StateName = @StateName,
			CountryID = @CountryID,
			Modified = GETDATE()
		where
			StateID = @StateID
End

-- 5. Delete

-- Exec [dbo].[PR_LOC_State_Delete] 1
-- Delete In The LOC_State

Alter Procedure [dbo].[PR_LOC_State_Delete]
@StateID int
As
Begin

	Delete From LOC_State
		Where Loc_State.StateID = @StateID

End