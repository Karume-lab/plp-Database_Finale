-- 1. Data Dive (10 pts):

    -- Pick your dataset and click to download (Social Media Users, Netflix Shows, or Human Stampedes).
        -- I picked Netflix Shows

    -- Import it into MySQL Workbench (learn how!). 
        -- This line creates a new database named 'NetflixTitles' if it doesn't already exist.
        CREATE DATABASE IF NOT EXISTS NetflixTitles;

        -- This line switches the active database to 'NetflixTitles'.
        USE NetflixTitles;

        -- This block of code creates a new table named 'Shows' with the specified column definitions.
        CREATE TABLE Shows (
            show_id VARCHAR(10),
            type VARCHAR(20),
            title VARCHAR(100),
            director VARCHAR(100),
            cast VARCHAR(500),
            country VARCHAR(100),
            date_added VARCHAR(20),
            release_year INT,
            rating VARCHAR(10),
            duration VARCHAR(20),
            listed_in VARCHAR(100),
            description TEXT
        );

        -- This line loads data from a CSV file named 'netflix_titles.csv' into the 'Shows' table, using specific field and line terminators, and skipping the first row (header).
        LOAD DATA LOCAL INFILE './netflix_titles.csv' INTO TABLE Shows FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

        -- This line selects all the rows and columns from the 'Shows' table.
        SELECT
            *
        FROM
            Shows;

    -- Briefly explain any difficulties and 1 interesting thing you noticed about your chosen dataset.
        -- The dataset contained some missing values, particularly in the 'director' and 'cast' columns, which might affect the analysis or require data imputation techniques if necessary. 
        -- An interesting observation was the diversity in content types, spanning from movies to TV shows, and the wide variety of genres represented in the 'listed_in' column, showcasing the diverse range of content available on the platform.


-- 2. Data Fun (20 pts):

    -- Use simple SQL queries to play with the data.
        -- Retrieve all rows from the Shows table
        SELECT *
        FROM Shows;

        -- Retrieve the titles of all movies
        SELECT title
        FROM Shows
        WHERE type = 'Movie';

        -- Retrieve the countries where TV shows were produced
        SELECT DISTINCT country
        FROM Shows
        WHERE type = 'TV Show';

        -- Retrieve the release years and titles of shows released after 2018
        SELECT release_year, title
        FROM Shows
        WHERE release_year > 2018;

        -- Retrieve the titles of shows directed by Mike Flanagan
        SELECT title
        FROM Shows
        WHERE director = 'Mike Flanagan';


    -- Find 2 cool facts hidden within the data (e.g., most popular interests).
        -- Fact 1: Most common countries for show production
        SELECT country, COUNT(*) AS count
        FROM Shows
        GROUP BY country
        ORDER BY count DESC
        LIMIT 5;

        -- Fact 2: Distribution of show types (Movies vs. TV Shows)
        SELECT type, COUNT(*) AS count
        FROM Shows
        GROUP BY type;

        -- Basic data insights
        -- Average release year of shows
        SELECT AVG(release_year) AS avg_release_year
        FROM Shows;

        -- Total number of shows
        SELECT COUNT(*) AS total_shows
        FROM Shows;

        -- Total duration of all shows (assuming duration is in minutes)
        SELECT SUM(duration) AS total_duration_minutes
        FROM Shows;

        -- Distribution of ratings
        SELECT rating, COUNT(*) AS count
        FROM Shows
        GROUP BY rating;

    -- Use basic SQL queries like (COUNT, AVG, and SUM) to understand more about the data you have.
        -- Total number of shows
        SELECT COUNT(*) AS total_shows
        FROM Shows;

        -- Average release year of shows
        SELECT AVG(release_year) AS avg_release_year
        FROM Shows;

        -- Total duration of all shows (assuming duration is in minutes)
        SELECT SUM(duration) AS total_duration_minutes
        FROM Shows;


-- 3. Ask Away (30 pts):

-- Formulate 2 questions about the data (e.g., what are popular shows in different countries?).
    -- Question: What are the top 5 most recent movies added to Netflix?
    -- SQL Query:
        SELECT title, release_year
        FROM Shows
        WHERE type = 'Movie'
        ORDER BY date_added DESC
        LIMIT 5;
    -- Question: Which countries have the highest number of TV shows available on Netflix?
        SQL Query:

        SELECT country, COUNT(*) AS num_shows
        FROM Shows
        WHERE type = 'TV Show'
        GROUP BY country
        ORDER BY num_shows DESC;

-- Share what you learned from the answers.
    -- The top 5 most recent movies added to Netflix include titles with varying release years, indicating a mix of recent releases and older films that have been newly added to the platform.
    -- The analysis of countries with the highest number of TV shows available on Netflix reveals the distribution of content across different regions. It provides insights into the popularity of TV shows in specific countries and potentially reflects Netflix's content acquisition and licensing strategies to cater to diverse audiences globally.
