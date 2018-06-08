Task 1:
hadoop fs -mkdir flightdelays
hadoop fs -put ~/datasets/flightdelays/*.csv flightdelays/



Task 2:
a = load 'flightdelays' using PigStorage(',');
b = filter a by (chararray) $4 != 'NA' or (chararray) $11 != 'NA';
c = foreach b generate $0 as year:int, $1 as month:int, $2 as dayofmonth:int, $4 as deptime:int, 
$8 as uniquecarrier:chararray, $9 as flightnum:chararray, $14 as arrdelay:int, 
$16 as origin:chararray, $17 as dest:chararray;
store c into '/user/horton/flightdelays_clean' using PigStorage(',')
