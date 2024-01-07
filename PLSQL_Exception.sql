--SYNTAX

DECLARE

BEGIN
    Exception
    when 
    exception 
    then
    end;
END;
/


--Named Exception
declare
	eno employ.emp_id%type;
	ename employ.emp_name%type;
	esalary employ.emp_salary%type;
begin
	eno:=&eno;  
    --  emp table column name         into  new column name define above 
    -- [select reference table attr into variable define attr ] from table name id = given_id
	select emp_id,emp_name,emp_salary into eno,ename, esalary from employ where emp_id = eno;
	if SQL%found then
		dbms_output.put_line('Employee No .:' || eno);
		dbms_output.put_line('Employee Name .:' || ename);
		dbms_output.put_line('Employee salary .:' || esalary);
	end if;
    Exception
    when no_data_found then
            dbms_output.put_line('record not found');
end;
/

-- Unnamed Exception - does not provide exception name 
 Declare
	exception_name Exception;
    Pragma
	Exception_init(exception_name, err_code);
Begin
	Execution section
	Exception when exception_name then handle the exception
End;

--example
declare 
    eno employ.emp_id%type;
    raise_cus_except Exception;
    Pragma Exception_init(raise_cus_except,100);
begin
    eno := &eno;
    delete from employ where emp_id = eno;
    if sql%notfound then
        raise raise_cus_except;
    end if;
    Exception when raise_cus_except then
	    dbms_output.put_line('no records found for ' || eno);
end;
/

2292 - constraint error
01403 - no data found

-- user defined exception

declare 
	msg varchar2(50):='age should be more than 18';
	agelimit constant integer:=18;
	age_except exception;
	p_age integer;
begin
	p_age:=&p_age;
	if(p_age >= agelimit) then
		dbms_output.put_line('age greater than 18 : ' || p_age);
	else
	    raise age_except;
	end if;
	exception when age_except then
		dbms_output.put_line('age less than 18 : ' || msg);
end;
/