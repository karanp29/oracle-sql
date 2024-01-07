create table customers(
ID int primary key,
cname varchar2(20),
age int,
Address varchar(20),
Salary number(10,3) default 1000.00
);

Create table supplier (
supplier_id numeric(10) not null,
supplier_name varchar2(50) not null,
contact_name varchar2(50),
CONSTRAINT supplier_pk PRIMARY KEY (supplier_id));

alter table customers
add city varchar2(40) default 'seattle';

Alter table customers 
MODIFY city_name varchar2(100) not null;

Alter table supplier
Add constraint supplier_pk PRIMARY KEY (supplier_id);

Alter table supplier
Drop constraint supplier_pk;

Alter table employee
Enable constraint age_check;

Alter table table_name
Rename COLUMN old_name TO new_name;

Alter table table_name
Rename to new_name;

-- if all values insert
INSERT into tab VALUES (?????)

-- specific colum

--multiple

insert all 
into customer values ()
into customer values ()
into customer values ()
select * from dual;


update table_name SET
 col  = new value
 where [condition]