1 . Create a loop for a table to insert a record into a tale for two columns in first coumn you have to inset a data ranging from 1 to 100 and in second column you hvae to inset a square of the first column 

create table my_table(a int,b int)
Delimiter $$
create procedure insert_data3()
begin
declare a int;
declare b int;
set a = 1;
set b = 1;
ins_data : loop
 insert into my_table values(a, b);
 set a = a + 1;
 set b= a * a;
 if a > 100 then
  leave ins_data;
 end if;
end loop ins_data;
end $$
call insert_data3();
drop table my_table;
select * from my_table


2 . create a user defined function to find out a date differences in number of days 
select date();
delimiter $$
create function date_diff_abs(enddate date, startdate date)
returns int
deterministic
begin
declare no_of_days int;
set no_of_days = abs(datediff(enddate, startdate));
 return no_of_days;
 end $$
 select date_diff_abs('2022-08-03','2022-09-03')
 
 3 . create a UDF to find out a log base 10 of any given number 
 delimiter $$
 select log10(1)
 delimiter $$
 create function find_log1(num int)
 returns decimal(10,10)
 deterministic
 begin
 declare log_value decimal(10,10);
 set log_value=log10(num);
 return log_value;
 end $$
 
 select find_log1(2)

5 . create a procedure to find out  5th highest profit in your sales table you dont have to use rank and windowing function 
select distinct profit from sales order by profit desc;
delimiter $$
create procedure 5th_highest_profit()
begin
select distinct profit from sales order by profit desc limit 4,1;
end $$

call 5th_highest_profit()