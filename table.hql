Task 4:
create external table flightdelays (
year int, 
month int, 
dayofmonth int, 
deptime int, 
uniquecarrier string, 
flightnum int, 
arrdelay int, 
origin string, 
dest string) 
row format delimited 
fields terminated by ',' 
location '/user/horton/flightdelays_clean';




Task 5:
a = load 'flightdelays' using org.apache.hive.hcatalog.pig.HCatLoader();
b = filter a by arrdelay > 0;
c = order b by arrdelay desc parallel 3;
store c into '/user/horton/flightdelays_nonzero' using PigStorage(',');
