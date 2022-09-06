use empdb;
-- 3. Get details of the employees who were neither the first joinee nor last joinee
select * from employee 
where joining_date <> (select max(joining_date) from employee) 
and joining_date <> (select min(joining_date) from employee);
-- or
select * from employee where employee_id not in (
select employee_id from employee where joining_date in (select max(joining_date) from employee)
union
select employee_id from employee where joining_date in (select min(joining_date) from employee)
);
-- or
select * from employee where joining_date not in (
select max(joining_date) from employee
union 
select min(joining_date) from employee);

-- earliest joinee
select min(joining_date) from employee; -- 15-jan - e2

-- latest or last joinee
select max(joining_date) from employee; -- 20-june e7

select * from employee where (joining_date,joining_date) not in  (select max(joining_date), min(joining_date) from employee)

-- fetch other than last joinee
select employee_id from employee where joining_date not in  (select max(joining_date) from employee);
1
2
3
4
5
6
union
-- fetch employees other than first or earliest joinee
select employee_id from employee where joining_date not in  (select min(joining_date) from employee);
1
3
4
5
6
7
-- result
union = 1 2 3 4 5 6 7
union all = 1 2 3 4 5 6 1 3 4 5 6 7 

-- 9. Create a view vw_facilitated employees who have recieved rewards being a top salary earner of their department

4. Create a table dpt_toppers containing employees from each department earning highest 

select * from reward; e1 e2 e3
select * from employee where employee_id in (1,2,3)
select * from employee 

create table dpt_toppers as 
select * from Employee where salary in ( select max(salary) from Employee group by Departement);

select * from dpt_toppers  where employee_id in (select employee_ref_id from reward);
-- or 
-- employees who have recieved rewards being a top salary earner of their department(dpt_toppers not exists)
select * from employee e , reward r where e.employee_id=r.employee_ref_id
and salary in (select max(salary) from Employee group by Departement);


select max(salary) from Employee group by Departement
 a = b
 a = 16
 a = 'ahmed'
 
 in - used one or multiple values
 = - compares one value only


use salesdb;
select * from outlet;
lt 100 = low
bt 100 and 1000 = medium
gt = high

-- categorize the sales according to their sales as(high/medi/low)
select outlet_id, outlet_type, outlet_sales,
case 
when outlet_sales <100 then 'low sales' -- till
-- when outlet_sales >=100 and outlet_sales <=5000 then 'medium sales' -- 100 to 5000
when outlet_sales between 100 and 5000 then 'medium sales' -- 100 to 5000
else "high sales" -- >=5000
end as "sales_group" from outlet;

select outlet_type from outlet;

select distinct outlet_type from outlet;

select outlet_id, outlet_type, 
case
when outlet_type is null then 'unknown'
else outlet_type 
end as "type_filled" from outlet;
-- or 
select outlet_id, outlet_type, ifnull(outlet_type,'unknown') as "type_filled" from outlet; -- change to a value if null is found


select outlet_id, outlet_sales, ifnull(outlet_sales,0) from outlet; -- change to a value if null is found
-- or 
select outlet_id, outlet_sales, 
case
when outlet_sales is null then 0  -- change to a value if null is found
else outlet_sales				  -- dont change if not null 
end as "sales_filled" from outlet;

-- fetch the outlet that has highest sales
select * from outlet where outlet_sales  = (select max(outlet_sales) from outlet);
-- or
select * from outlet where outlet_sales  in (select max(outlet_sales) from outlet); -- 10000

-- fetch the outlet that has 2nd highest sales
select * from outlet where outlet_sales  in (select outlet_sales from outlet) order by outlet_sales desc limit 1,1;  -- 6000
select * from outlet where outlet_sales  < (select max(outlet_sales) from outlet) order by outlet_sales desc limit 1;

select * from outlet where outlet_sales  in (select outlet_sales from outlet) order by outlet_sales desc limit 2,1;  -- 5000
select * from outlet where outlet_sales  in (select outlet_sales from outlet) order by outlet_sales desc limit 3,1; -- 1000
select * from outlet where outlet_sales  in (select outlet_sales from outlet) order by outlet_sales desc limit 4,1; -- 500
-- or
select * from outlet o1 where 2 = (select count(distinct o2.outlet_sales) from outlet o2
where o1.outlet_sales <= o2.outlet_sales)

select * from outlet order by outlet_sales desc 

-- fetch the outlet that has 3rd/4th highest sales
select * from outlet limit 1; -- first row
select * from outlet limit 2; -- first 2 rows
select * from outlet limit 2,1 -- after 2 rows fetch 1 row











