Task 7:
create table sfo_weather_text (station_name string, year int, month int, dayofmonth int, precipitation int, temperature_max int, temperature_min int) row format delimited fields terminated by ',';
load data local inpath '/home/horton/datasets/flightdelays/sfo_weather.csv' into table sfo_weather_text;
create table sfo_weather stored as Orc as select * from sfo_weather_text;



Task 8:
set hive.execution.engine=tez;
create table flights_weather as select f.*, w.temperature_max, w.temperature_min from flightdelays as f  join sfo_weather as w on w.year = f.year and  w.month = f.month and  w.dayofmonth = f.dayofmonth where f.origin = "SFO" or f.dest = "SFO" ;

The flights_weather table should contain 416 rows



Task 9:
create table weather_partitioned25 (station_name string, dayofmonth int, precipipation int, temperature_max int, temperature_min int) partitioned by (year int, month int) stored as orc;
insert into table weather_partitioned partition(year=2008,month=1) select station_name, dayofmonth, precipitation, temperature_max, temperature_min from sfo_weather where year = 2008 and month = 1;

