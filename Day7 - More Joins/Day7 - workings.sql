use empdb;
select * from employee;
select * from reward;

select first_name,salary,amount, salary+amount as net from employee e
inner join reward r on e.employee_id = r.employee_ref_id where r.amount  < 7500;

-- ignores if emp recieved rewards less than 7500
select first_name,salary,amount, salary+amount as net from employee j
inner join reward k on j.employee_id = k.employee_ref_id where k.amount  < 7500;

-- ignores if emp recieved total of rewards less than 7500
select employee.employee_id,sum(reward.amount) from employee inner join reward on employee.employee_id =reward.Employee_ref_id 
group by employee_id having sum(reward.amount) < 7500;

select * from employee;
select * from reward;

update employee set first_name = 'Bob' where trim(first_name) = 'Johny' ;

update employee set first_name = 'Johny' where trim(first_name) =  'Bob';

e -> employee

-- below not working
select Employee.Employee_id, Employee.First_name, sum(reward.amount) from Employee 
left outer join reward on Employee.Employee_id = reward.Employee_ref_id 
group by First_name having First_name like "%John%";

-- below working
select Employee.Employee_id, Employee.First_name, sum(reward.amount) from Employee 
left outer join reward on Employee.Employee_id = reward.Employee_ref_id 
group by Employee_id, First_name having First_name like "%John%";

use salesdb;
-- union 
select outlet_type from outlet where outlet_type in ( 'supermarket', 'mart');

select distinct outlet_type from outlet where outlet_type = 'supermarket';
select distinct outlet_type from outlet where outlet_type = 'mart';
-- for comparison
select outlet_type from outlet where outlet_type = 'supermarket' union
select outlet_type from outlet where outlet_type = 'mart';


select outlet_type from outlet where outlet_type = 'supermarket';
select outlet_type from outlet where outlet_type = 'mart';
-- for comparison
select outlet_type from outlet where outlet_type = 'supermarket' union all
select outlet_type from outlet where outlet_type = 'mart';

select outlet_id from outlet where outlet_type = 'supermarket' union all
select outlet_id from outlet where outlet_type = 'mart';

select * from outlet;
a = 15 b=3
Ar1 br1
ar1 br2
ar1 br3
ar2 br1
...
ar15 br1
ar15 br2
ar15 br3
101	MART	500	FDA01	can	15.00	59.00	101
101	MART	500	

use salesdb;
select * from outlet;
select * from items;
select count(*) from outlet;
select count(*) from items;

select * from outlet o inner join items i on o.outlet_id  = i.outlet_id;
select * from outlet o left outer join items i on o.outlet_id  = i.outlet_id;
select * from outlet o right outer join items i on o.outlet_id  = i.outlet_id;
select * from outlet o cross join items i on o.outlet_id  = i.outlet_id;
select * from outlet o cross join items i ;
select count(*) from outlet o cross join items i ;


create table a (id int, name char(2));
create table b (id int, name char(2), ida int);
create table c (id int, name char(2), idb int);

desc a;
desc b;
desc c;

insert into a values (1,'a1');
insert into a values (2,'a2');
-- or 
insert into a values (1,'a1'), (2,'a2');
insert into b values (11,'b1',1), (12,'b2',12);
insert into c values (21,'c1',1), (22,'c2',22);

select * from a ;
select * from b ;
select * from c ;
1	a1
2	a2

11	b1	1
12	b2	12

1	a1	11	b1	1

15 * 3

Ar1 br1 pass
ar1 br2 fail
Ar2 br1 fail
Ar2 br2 fail


use salesdb;
select * from a inner join b on a.id = b.ida
inner join c on a.id = c.idb;

select * from a inner join b on a.id = b.ida
inner join c on a.id = c.idb;

select * from a left outer join b on a.id = b.ida
left outer join c on a.id = c.idb;

select * from outlet;

select * from empdb.employee;

first name 	last name
abdul 		rahaman	
sheik		abdul
use empdb;
update employee set last_name = 'Johny' where last_name = 'chreketo';
select * from employee ;
select * from employee where first_name = last_name;
select * from employee where trim(first_name) = trim(last_name);

-- self join
select * from employee e1 inner join employee e2
on trim(e1.last_name) = trim(e2.first_name);

select * from employee as e1 inner join employee as e2
on trim(e1.last_name) = trim(e2.first_name);

select * from employee a inner join employee b
on trim(a.last_name) = trim(b.first_name);

use empdb;
select * from employee a inner join employee b
on trim(a.first_name) = trim(b.last_name);

7*7 = 49
select a.first_name, b.last_name, b.first_name, a.last_name from employee a cross join employee b