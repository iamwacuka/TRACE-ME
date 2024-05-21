SELECT *
FROM NETFLIX_DATA

---DATA CLEANING
--REMOVING DUPLICATE RECORDS
DELETE 
FROM NETFLIX_DATA 
WHERE title NOT IN (SELECT MIN(title) FROM NETFLIX_DATA
GROUP BY show_id)

--HANDLING MISSING VALUES
---REPLACE MISSING VALUES IN 'DIRECTOR' WITH UNKNOWN
UPDATE NETFLIX_DATA
SET director = 'UNKNOWN' 
WHERE director is NULL

--REPLACE MISSING VALUES IN CAST WITH UNKNOWN
UPDATE NETFLIX_DATA
SET cast ='UNKNOWN'
WHERE cast IS NULL

--REPLACE MISSING VALUES IN COUNTRY WITH UNKNOWN
UPDATE NETFLIX_DATA
SET country = 'UNKNOWN'
WHERE country IS NULL

--REPLACE MISSING VALUES IN date_added WITH UNKNOWN
UPDATE NETFLIX_DATA
SET date_added= 'UNKNOWN'
WHERE date_added IS NULL

--STANDARDIZING FORMATS
--CONVERT title column to lower case
UPDATE NETFLIX_DATA
SET title= LOWER(title)

--CONVERT LISTED_IN column to Upper Case
UPDATE NETFLIX_DATA
SET listed_in=UPPER(listed_in)

--CORRECTING MISSPELLINGS
--CORRECT MISSPELLINGS IN 'Country' column
UPDATE NETFLIX_DATA
SET country ='United States '
WHERE country ='United States of America'

--TRIMMING WHITESPACE
--Remove leading and trailing whitespace from'title' column
UPDATE NETFLIX_DATA
SET title=TRIM(title)

--Removing leading and trailing whitespace from 'cast' column
UPDATE NETFLIX_DATA
SET cast =TRIM(cast)

--Remove leading and trailing workspace from listed_in column
UPDATE NETFLIX_DATA
SET listed_in =TRIM(listed_in)

--Remove leading and trailing workspace from description column
UPDATE NETFLIX_DATA
SET description =TRIM(description)

--HANDLING INCONSISTENT VALUES
--Standardize 'type' column values to either 'Movie' or 'TV-Show' 
UPDATE NETFLIX_DATA
SET type =CASE WHEN type='Movie' THEN 'MOVIE'
  WHEN type='TV Show' THEN 'TV-SHOW'
  ELSE NULL
  END

  