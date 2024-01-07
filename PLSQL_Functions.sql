Create [OR REPLACE] function Function_name parameter1 [IN | OUT | IN OUT] data_type
Return return_datatype;
Is
Declaration_section
Begin
	Execution_section
	Return return_var;
Exception
	Execution section
	Return return_var
END;

Drop function function_name;


-- FUNCTIONS

create or REPLACE function sqr(num in number) return number
Is
s number;
begin 
s:= num * num;
return s;
END;
/

--PLSQL block to call this function - take input from user

Declare
	input number;
	outp number;
begin
	input :=&input;
	outp := sqr(input);
	dbms_output.put_line('Square of number : ' || outp);
END;
/

-- with multiple paramerter
-- 
create or replace function empDetails(eno in number) return varchar2
Is
ename varchar2(50);
begin
	select emp_name into ename from employ where emp_id = eno;
	return ename;
end;
/

Declare 
	eno employ.emp_id%type;
	ename employ.emp_name%type;
begin
	eno := &eno;
	ename := empDetails(eno);
	dbms_output.put_line('Name of employee : ' || ename);
end;
/

-- with OUT parameter
-- error code
create or replace user_score(
score1 in int,
score2 in int,
score3 in int, 
status out varchar2) 
return int
is
avg int;
begin
	avg := (score1+score2+score3)/3;
	IF avg>50 then
		status := 'student pass';
	ELSE
		status := 'student fail';
	end if;
	return avg;
end;
/ 
