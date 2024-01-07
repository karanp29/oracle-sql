--

CREATE [OR REPLACE] PROCEDURE procedure_name
[(parameter_name [IN | OUT | IN OUT] type [,....])]
{IS | AS}
BEGIN
<PROCEDURE_BODY>
END PROCEDURE_NAME;

-- simple procedure
create or replace PROCEDURE test_procedure
as 
begin
    dbms_output.put_line('testing procedure');
end;
/
execute test_procedure;

-- with in, out paramerter

create or replace procedure findMax(x in number, y in number, z out number)
is
begin
if x > y then
    z:=x;
else
    z:=y;
end if;
end;
/
-------------------
declare
    a number;
    b number;
    c number;
begin 
    a := &a;
    b := &b;
    findMax(a,b,c);
    dbms_output.put_line('Maximium from given number is ' || c);
end;
/


-- with return parameter
--error
create or replace procedure empDetails (eno in int, esalary out number ) as
begin
    select emp_salary into  esalary from employ  where emp_id = eno;
end;
/

declare
    eid employ.emp_id%type;
    esalary employ.emp_salary%type;
begin
    eid := &eid;
    empDetails(eid,esalary);
    dbms_output.put_line('salary for empl ' || esalary);
end;
/

---
create or replace procedure empDetails (eno in int) as ename varchar2(50);
begin
    select emp_name into ename from employ where emp_id = eno;
    dbms_output.put_line('employee name: ' || ename);
end;
/

declare
    eid employ.emp_id%type;
begin
    eid := &eid;
    empDetails(eid);
end;
/


-- PROCEDURE WITH CURSOR
declare 
    r1 employ%rowtype;
    Cursor c1 is select * from employ;
    procedure empdet
    as 
    begin 
	for r1 in c1
	loop
		dbms_output.put_line(r1.emp_id || ' ' || r1.emp_name );
	end loop;
    end;

begin
	empdet;
end;
/
