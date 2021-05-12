-- We can use spool or UTL_FILE utility to expot the data from tables. I am going to use spool comannd here to pull the data from SQL query to an csv file, comma seperated
-- to save time, I am doing this only for one table as an exmaple

SET VERIFY OFF
SET FEEDBACK OFF

SPOOL C:\regions_export.csv

SELECT 'region_id' ||','||'region_name' from regions -- This is to have the headers in output file.
UNION ALL
SELECT region_id ||','||region_name from regions; -- This to get the table data.

SPOOL OFF;

please check the file C:\regions_export.csv