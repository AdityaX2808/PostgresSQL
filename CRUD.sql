CREATE TABLE covid_stat (
    country_region varchar(100) NOT NULL,
    confirmed INTEGER NOT NULL,
    deaths INTEGER NOT NULL,
    recovered INTEGER NOT NULL,
    active INTEGER NOT NULL,
    new_cases INTEGER NOT NULL,
    new_deaths INTEGER NOT NULL,
    new_recovered INTEGER NOT NULL,
    deaths_per_100_cases float NOT NULL,
    recovered_per_100_cases float NOT NULL,
    deaths_per_100_recovered float NOT NULL,
    confirmed_last_week INTEGER NOT NULL,
    one_week_change INTEGER NOT NULL,
    one_week_percent_increase float NOT NULL,
    who_region varchar(100) NOT NULL
);
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