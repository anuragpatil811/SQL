#Write a query to create database with name pizza_sales_analysis.
create database  pizza_sales_analysis;
USE  pizza_sales_analysis;

#Write a query to see list of all databases
 SHOW DATABASES; 
 
 #Write a query to create the table containing id as int and date as date
 CREATE TABLE pizza_order(
 id int, 
 order_date DATE 
 );
 # Write a query to rename the table order to orders.
 RENAME TABLE pizza_order to pizza_orders; 
 
 #Write a query to add column time with datatype time after date column in above order table.
 ALTER TABLE pizza_orders ADD column_time datetime;
 
 #Add primary key constraint to the column id on existing table orders.
 ALTER TABLE pizza_orders ADD CONSTRAINT pk_pizza_orders PRIMARY KEY (id);