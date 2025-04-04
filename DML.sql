select * from covid_stat limit 10;

select distinct * from covid_stat;

insert into covid_stat
values('Jharkhand' , 846 , 69 , 96 , 88 , 14, 25 , 0 , 6.69 , 69.69 , 14.67 , 1069 , 345 , 16.09 , 'Asia');

update covid_stat
set country_region = 'ABCDEF'
where country_region = 'Ranchi';

select * from covid_stat where country_region = 'ABCDEF';

alter table covid_stat
rename confirmed to confirmed_cases; 

delete from covid_stat where country_region = 'Malaysia';

alter table covid_stat
drop column confirmed_cases;

select * from covid_stat
order by deaths;

select min(active)
from covid_stat;

select max(active)
from covid_stat;

select count(distinct country_region)
from covid_stat;

select sum(new_deaths)
from covid_stat;

select avg(deaths)
from covid_stat;

select * from covid_stat
where country_region like 'A%';

select * from covid_stat
where country_region in ('Azerbaijan' , 'Japan' , 'Australia');

select * from covid_stat
where deaths between 167 and 423;

select * from covid_stat
where deaths < 100;

select * from covid_stat
where deaths > 100;

select * from covid_stat
where deaths <= 100;

select * from covid_stat
where deaths >= 100;

select * from covid_stat
where deaths <> 423;

select * from covid_stat
where country_region != 'Ecuador';

select * from covid_stat
where deaths = 596 and new_cases = 13;

select * from covid_stat
where deaths = 423 or new_cases = 616;

select deaths + new_deaths as DEATHS
from covid_stat;


