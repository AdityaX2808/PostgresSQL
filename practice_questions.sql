select table_name
from information_schema.tables
where table_schema = 'public';

select * from worldometer_data limit 5;

select round(sum("TotalDeaths") * 100 / sum("TotalCases"), 2) 
as global_death_percent
from worldometer_data;

select "Country/Region",
round(sum("TotalDeaths") * 100 / nullif(sum("TotalCases") , 0) , 2)
as local_death_percent
from worldometer_data
group by "Country/Region"
order by local_death_percent DESC;

select 
round(sum("TotalCases") * 100 / sum("Population") , 2)
as global_infection_percent
from worldometer_data;

select "Country/Region",
round(sum("TotalCases") * 100 / nullif(sum("Population") , 0) , 2)
as local_infection_percent
from worldometer_data
group by "Country/Region"
order by local_infection_percent DESC;

select "Country/Region" ,
max("TotalCases") as most_infected_countries
from worldometer_data
group by "Country/Region"
order by most_infected_countries DESC
limit 10;

select "Country/Region", 
sum(coalesce("TotalDeaths" , 0)) as highest_death_count
from worldometer_data
group by "Country/Region"
order by highest_death_count DESC limit 10;

select "Continent",
sum("TotalDeaths") as continent_death_count
from worldometer_data
group by "Continent"
order by continent_death_count DESC;

select "Country/Region", "Continent",
round(avg(coalesce("NewDeaths" , 0)) , 2) as avg_deaths
from worldometer_data
group by "Country/Region" , "Continent" 
order by avg_deaths DESC
limit 10;

CREATE TABLE covid_vaccine (
    id SERIAL PRIMARY KEY,
    "Country/Region" VARCHAR(100),
	Continent VARCHAR(100),
    Date DATE,
    People_vaccinated BIGINT,          
    People_fully_vaccinated BIGINT,    
    Vaccines TEXT                      
);

INSERT INTO covid_vaccine ("Country/Region", Date, People_vaccinated, People_fully_vaccinated, Vaccines) VALUES
('India', '2021-12-20', 32095958, 31420042, 'Covaxin'),
('USA', '2021-06-07', 51744209, 29696222, 'AstraZeneca, Covaxin, Moderna'),
('Brazil', '2021-05-22', 29940019, 21053080, 'Sinopharm, Sinovac, Moderna'),
('UK', '2021-09-03', 42835856, 19255922, 'Sinopharm, Pfizer/BioNTech, Sputnik V'),
('Russia', '2021-08-01', 71888907, 67254980, 'Moderna, Sinopharm'),
('France', '2021-12-04', 2336961, 2010072, 'AstraZeneca, Sinopharm'),
('Germany', '2021-03-09', 45784782, 17216543, 'Sinopharm'),
('Italy', '2021-04-01', 37861529, 16696305, 'Johnson&Johnson, Sputnik V, Sinovac'),
('Canada', '2021-06-11', 36451668, 6973469, 'Moderna, Sputnik V, Sinopharm'),
('Australia', '2021-02-16', 28271812, 5347802, 'Johnson&Johnson, Covaxin, Moderna'),
('Japan', '2021-10-03', 85256419, 45114282, 'AstraZeneca, Pfizer/BioNTech'),
('China', '2021-12-27', 33950722, 18860949, 'Johnson&Johnson, Sinopharm, Sputnik V'),
('South Africa', '2021-01-28', 60756794, 30802573, 'AstraZeneca, Sinopharm'),
('Mexico', '2021-07-09', 38819399, 17144752, 'Johnson&Johnson, Sputnik V'),
('Spain', '2021-02-06', 90174564, 66170088, 'Moderna, Covaxin, Sinovac'),
('Indonesia', '2021-08-18', 49968904, 19203397, 'Pfizer/BioNTech, Sputnik V'),
('Turkey', '2021-12-23', 53611439, 34632934, 'Johnson&Johnson, Moderna'),
('Argentina', '2021-09-05', 73644938, 71103845, 'Pfizer/BioNTech'),
('Saudi Arabia', '2021-10-27', 33514620, 12301217, 'Sinopharm, Sputnik V, Sinovac'),
('South Korea', '2021-04-26', 32015334, 20578233, 'Moderna, AstraZeneca'),
('Egypt', '2021-01-11', 67109882, 33376442, 'Johnson&Johnson, Covaxin, Pfizer/BioNTech'),
('Nigeria', '2021-06-13', 54725869, 31841587, 'Pfizer/BioNTech, Sinovac'),
('Pakistan', '2021-07-06', 25253849, 16276082, 'AstraZeneca'),
('Bangladesh', '2021-12-12', 20200094, 15342295, 'Moderna, Pfizer/BioNTech'),
('Poland', '2021-03-07', 35984096, 19873393, 'Covaxin, Sinovac');

select * from covid_vaccine limit 5;

SELECT v."Country/Region", w."Population",
MAX(v.People_vaccinated) AS total_people_vaccinated,
ROUND(MAX(v.People_vaccinated) * 100.0 / NULLIF (w."Population", 0), 2) AS percent_vaccinated
FROM covid_vaccine v
JOIN worldometer_data w ON v."Country/Region" = w."Country/Region"
GROUP BY 
v."Country/Region", w."Population"
ORDER BY 
 percent_vaccinated DESC
LIMIT 20;

SELECT
    "Country/Region",
    vaccine_name,
    ROUND(SUM(people_vaccinated) * 1.0 / vaccine_count, 0) AS estimated_users,
    ROUND((SUM(people_vaccinated) * 1.0 / vaccine_count) * 100 / SUM(SUM(people_vaccinated)) OVER (PARTITION BY "Country/Region"), 2) AS percentage_in_country
FROM (
    SELECT
        "Country/Region",
        UNNEST(STRING_TO_ARRAY(vaccines, ',')) AS vaccine_name,
        people_vaccinated,
        ARRAY_LENGTH(STRING_TO_ARRAY(vaccines, ','), 1) AS vaccine_count
    FROM covid_vaccine
) AS expanded
GROUP BY "Country/Region", vaccine_name, vaccine_count
ORDER BY "Country/Region", percentage_in_country DESC;

SELECT 
    "Country/Region",
    MAX(people_vaccinated) AS total_vaccinated,
    MAX(people_fully_vaccinated) AS fully_vaccinated,
    ROUND(MAX(people_fully_vaccinated) * 100.0 / NULLIF(MAX(people_vaccinated), 0), 2) AS fully_vaccinated_percentage
FROM covid_vaccine
GROUP BY "Country/Region"
ORDER BY fully_vaccinated_percentage DESC;


