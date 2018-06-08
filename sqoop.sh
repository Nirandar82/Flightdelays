k 10:
sqoop export --connect jdbc:mysql://namenode/flightinfo --table weather  --export-dir /user/horton/weather --input-fields-terminated-by ',' --username root --password hadoop
