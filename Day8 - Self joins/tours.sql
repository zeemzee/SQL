create table places (
id int, 
place_name varchar(10));

create table tours (
id int, 
stloc int, 
endloc int);

insert into places values 
(1,'chennai'),
(2,'bengaluru'),
(3,'cochin'),
(4,'hyderabad'),
(5,'mysuru');

insert into tours values  
(1,	4,	1), 
(2,	4,	3), 
(3,	4,	2), 
(4,	1,	4), 
(5,	2,	3), 
(6,	2,	5), 
(7,	5,	3);

select * from places;
select * from tours;