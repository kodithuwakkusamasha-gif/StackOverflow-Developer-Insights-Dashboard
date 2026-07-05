select top 100 *
from [Stack Overflow Developer Survey].[dbo].survey_results_public;

USE [Stack Overflow Developer Survey];
GO

SELECT TOP 10 
    ResponseId, 
    LanguageHaveWorkedWith 
FROM dbo.survey_results_public;

SELECT TOP 100
    ResponseId,
    value AS InDemandLanguage
FROM dbo.survey_results_public
CROSS APPLY STRING_SPLIT(LanguageHaveWorkedWith, ';')
WHERE LanguageHaveWorkedWith IS NOT NULL;

USE [Stack Overflow Developer Survey];
GO

-- This will filter, clean, split, and save the data automatically
SELECT 
    CAST(ResponseId AS INT) AS ResponseId,
    CAST(value AS VARCHAR(100)) AS TechLanguage
INTO dbo.Fact_DeveloperLanguages
FROM dbo.survey_results_public
CROSS APPLY STRING_SPLIT(LanguageHaveWorkedWith, ';')
WHERE LanguageHaveWorkedWith IS NOT NULL;

SELECT TOP 50 * FROM dbo.Fact_DeveloperLanguages;

USE [Stack Overflow Developer Survey];
GO

SELECT TOP 100 * 
FROM dbo.Fact_DeveloperLanguages;

USE [Stack Overflow Developer Survey];
GO

DELETE FROM dbo.Fact_DeveloperLanguages
WHERE TechLanguage = 'NA';

USE [Stack Overflow Developer Survey];
GO

-- Drop the table if you already created it by accident
IF OBJECT_ID('dbo.Fact_DeveloperDatabases', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_DeveloperDatabases;
GO

-- Create the clean split database table
SELECT 
    TRY_CAST(ResponseId AS INT) AS ResponseId,
    CAST(value AS VARCHAR(100)) AS TechDatabase
INTO dbo.Fact_DeveloperDatabases
FROM dbo.survey_results_public
CROSS APPLY STRING_SPLIT(DatabaseHaveWorkedWith, ';')
WHERE DatabaseHaveWorkedWith IS NOT NULL 
  AND TRY_CAST(ResponseId AS INT) IS NOT NULL
  AND value <> 'NA'; -- This automatically excludes "NA" on creation!
GO

-- Verify the new table
SELECT TOP 50 * FROM dbo.Fact_DeveloperDatabases;

USE [Stack Overflow Developer Survey];
GO

-- Drop the table if you already created it by accident
IF OBJECT_ID('dbo.Fact_DeveloperDatabases', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_DeveloperDatabases;
GO

-- Create the clean split database table
SELECT 
    TRY_CAST(ResponseId AS INT) AS ResponseId,
    CAST(value AS VARCHAR(100)) AS TechDatabase
INTO dbo.Fact_DeveloperDatabases
FROM dbo.survey_results_public
CROSS APPLY STRING_SPLIT(DatabaseHaveWorkedWith, ';')
WHERE DatabaseHaveWorkedWith IS NOT NULL 
  AND TRY_CAST(ResponseId AS INT) IS NOT NULL
  AND value <> 'NA'; -- This automatically excludes "NA" on creation!
GO

-- Verify the new table
SELECT TOP 50 * FROM dbo.Fact_DeveloperDatabases;

USE [Stack Overflow Developer Survey];
GO

IF OBJECT_ID('dbo.Fact_DeveloperDemographics', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_DeveloperDemographics;
GO

SELECT 
    TRY_CAST(ResponseId AS INT) AS ResponseId,
    CAST(MainBranch AS VARCHAR(100)) AS MainBranch,
    CAST(Age AS VARCHAR(50)) AS AgeGroup,
    CAST(EdLevel AS VARCHAR(255)) AS EducationLevel,
    CAST(Employment AS VARCHAR(255)) AS EmploymentStatus,
    CAST(RemoteWork AS VARCHAR(100)) AS WorkModel, -- Remote, Hybrid, or On-site
    CAST(Country AS VARCHAR(100)) AS Country,
    TRY_CAST(ConvertedCompYearly AS FLOAT) AS YearlySalaryUSD,
    TRY_CAST(WorkExp AS INT) AS YearsOfExperience
INTO dbo.Fact_DeveloperDemographics
FROM dbo.survey_results_public
WHERE TRY_CAST(ResponseId AS INT) IS NOT NULL;
GO

-- Verify your final master fact table
SELECT TOP 100 * FROM dbo.Fact_DeveloperDemographics;

USE [Stack Overflow Developer Survey];
GO

IF OBJECT_ID('dbo.Fact_DeveloperRoles', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_DeveloperRoles;
GO

-- Create the clean split roles table
SELECT 
    TRY_CAST(ResponseId AS INT) AS ResponseId,
    CAST(value AS VARCHAR(100)) AS JobRole
INTO dbo.Fact_DeveloperRoles
FROM dbo.survey_results_public
CROSS APPLY STRING_SPLIT(DevType, ';')
WHERE DevType IS NOT NULL 
  AND TRY_CAST(ResponseId AS INT) IS NOT NULL
  AND value <> 'NA';
GO

-- Verify the new table
SELECT TOP 50 * FROM dbo.Fact_DeveloperRoles;