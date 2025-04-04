select c.Province_State , c.latitude , c.longitude , c.Date, cs.deaths
from covid_stat  cs
inner join covid_19  c
on cs.country_region = c.country_region;

select cs.* , c9.latitude , c9.longitude, c9.who_region
from covid_stat as cs
left join covid_19 as c9
on cs.country_region = c9.country_region;

select cs.* , c9.latitude , c9.longitude, c9.who_region
from covid_stat as cs
right join covid_19 as c9
on cs.country_region = c9.country_region;

select cs.* , c9.latitude , c9.longitude, c9.who_region
from covid_stat as cs
full outer join covid_19 as c9
on cs.country_region = c9.country_region;

select cs.* , c9.latitude , c9.longitude, c9.who_region
from covid_stat as cs
 covid_19 as c9
on cs.country_region = c9.country_region;



