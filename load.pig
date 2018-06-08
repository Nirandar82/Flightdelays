
Task 3:
Step 1.
a = load 'flightdelays_clean';
b = group a all;
c = foreach b generate COUNT(a);
store c into 'cleaned_total';

The result is 30,267 records

Step 2.
a = load 'flightdelays_clean' using PigStorage(',');
b = filter a by (chararray) $8 == 'DEN';
c = group b all;
d = foreach c generate COUNT(b);
store d into '/user/horton/denver_total';

The result is 495 records


Step 3.
a = load 'flightdelays_clean' using PigStorage(',');
b = filter a by (chararray) $8 == 'DEN' and (int) $6 >= 60;
c = group b all;
d = foreach c generate COUNT(b);
store d into '/user/horton/denver_late';

The result is 29 records
