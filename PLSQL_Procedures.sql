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

-- with paramerter

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
create or replace procedure empDetails (eno in int, esalary out number ) as varchar2(50)
is
ename varchar2(50);
begin
    select emp_name,emp_salary into ename , esalary where emp_id = eno;
    return ename;
end;
/