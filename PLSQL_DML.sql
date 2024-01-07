
CREATE table  if not exists employ (
    emp_id int not null PRIMARY key,
    emp_name varchar2(100),
    emp_city varchar2(50),
    emp_salary number(10,2),
    emp_dept int
);

CREATE table  if not exists employ_merge (
    emp_id int not null PRIMARY key,
    emp_name varchar2(100),
    emp_city varchar2(50),
    emp_salary number(10,2),
    emp_dept int
);

-- new_var exist_table_name.column_name%type
-- copy datatype of column from given table


 -- INSERT----------------------------------------------------
DECLARE
    eno employ.emp_id%type;
    ename employ.emp_name%type;
    ecity employ.emp_city%type;
    esalary employ.emp_salary%type;
    edept employ.emp_dept%type;
BEGIN
    -- taking values from user to insert new record
    -- add varchar2 value is single quotes
    eno:=&eno;
    ename:='&emp_name';
    ecity:='&emp_city';
    esalary:=&esalary;
    edept:=&edept;
    --printing all values given by user
    dbms_output.PUT_LINE('eno : ' || eno);
    dbms_output.PUT_LINE('ename : ' || ename);
    dbms_output.PUT_LINE('ecity : ' || ecity);
    dbms_output.PUT_LINE('esalary : ' || esalary);
    dbms_output.PUT_LINE('edept : ' || edept);

    -- now create query to insert data to table
    insert into employ values (eno,ename,ecity,esalary,edept);
END;
/

 -- UPDATE----------------------------------------------------

DECLARE
    eno employ.emp_id%type;
    ename employ.emp_name%type;
    ecity employ.emp_city%type;
    esalary employ.emp_salary%type;
    edept employ.emp_dept%type;
BEGIN
    -- taking values from user to insert new record
    -- add varchar2 value is single quotes
    eno:=&eno;
    ename:='&emp_name';
    ecity:='&emp_city';
    esalary:=&esalary;
    edept:=&edept;
    --printing all values given by user
    dbms_output.PUT_LINE('eno : ' || eno);
    dbms_output.PUT_LINE('ename : ' || ename);
    dbms_output.PUT_LINE('ecity : ' || ecity);
    dbms_output.PUT_LINE('esalary : ' || esalary);
    dbms_output.PUT_LINE('edept : ' || edept);

    --same till taking values from user only update query is added
    update employ set
    emp_name = ename, 
    emp_city = ecity,
    emp_salary = esalary,
    emp_dept = edept
    where
    emp_id = eno;
END;
/
 -- DELETE----------------------------------------------------
-- only reuire id for record to be deleted i.e emp_id

DECLARE
    eno employ.emp_id%type;
BEGIN
    eno := &eno;
    dbms_output.PUT_LINE(eno || ' Deleting record....................');
    delete from employ where emp_id = eno;
    dbms_output.PUT_LINE(eno || ' Deleted record.');
END;
/


--- MERGE two tables

merge into 

create table student2
(
stud_id number primary key,
first_name varchar2(15) not null,
last_name varchar(12) not null,
grade varchar(2)
);

create table student_details as select * from student2;

insert all
into student2 values(1,'Karan','Shah','B')
into student2 values(2,'Lalit','Aphale','A*')
into student2 values(3,'Akshay','Pendbhaje','C')
into student2 values(4,'Swati','K','A')
into student2 values(5,'Pallavi','R','B')
into student2 values(6, 'Shivam','A','B')
select * from dual;


insert all
into student_details values(1,'Karan','Shah','B')
into student_details values(2,'Lalit','Aphale','A*')
into student_details values(3,'Akshay','Pendbhaje','C')
into student_details values(4,'Swati','K','A')
select * from dual;


merge into student_details x
using ( select stud_id,first_name,last_name,grade from student2 ) y
on (x.stud_id = y.stud_id)
when matched then
update set
    x.first_name = y.first_name,
    x.last_name = y.last_name,
    x.grade = y.grade
    where x.first_name <> y.first_name OR 
        x.last_name <> y.last_name OR
        x.grade = y.grade
when not matched then
insert (x.stud_id,x.first_name,x.last_name,x.grade)
values (y.stud_id,y.first_name,y.last_name,y.grade);