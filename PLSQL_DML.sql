
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