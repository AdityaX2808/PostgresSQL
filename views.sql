create view view_all_columns as
select * from covid_vaccine;
select * from view_all_columns;

create view country_people_vaccinated as
select "Country/Region" , "people_vaccinated"
from covid_vaccine;
select * from country_people_vaccinated;

create view fully_vs_one_dose as
select "Country/Region" , people_fully_vaccinated,
people_vaccinated - people_fully_vaccinated AS one_dose_only
from covid_vaccine
where people_fully_vaccinated > one_dose_only;

create view country_vaccines as
select "Country/Region" , vaccines
from covid_vaccine;
select * from country_vaccines;

create view percentage_fully_vaccinated as
select "Country/Region",
(people_fully_vaccinated::FLOAT / people_vaccinated) * 100 as fully_vaccinated_percentage
from covid_vaccine
where people_vaccinated > 0;
select * from percentage_fully_vaccinated;

