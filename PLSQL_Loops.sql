-- LOOPS

--BASIC LOOP-----------------------------------------------------------------------------------------

DECLARE
    --variables
BEGIN
LOOP  -- loop start
    -- code statements 
    EXIT [condition];
END LOOP; -- end loop
END;
/

--Example
DECLARE 
   x number := 10; 
BEGIN 
   LOOP 
      dbms_output.put_line('Number x is :' || x); 
      x := x + 10; 
      IF x > 50 THEN 
         exit; -- just like [break] keyword
      END IF; 
   END LOOP; 
   -- after exit, control resumes here  
   dbms_output.put_line('After Exit New x is: ' || x); 
END; 
/

--EXAMPLE

declare
	n number;
	c number:=1;
begin
	n:=&n;  -- take input from user
	loop
	 	dbms_output.put_line(c || '');
		c:=c+1;  -- increment the counter
		exit when c > n;  -- run till condition is false - once true exit loop
	end loop;
end;
/

--FOR LOOP-----------------------------------------------------------------------------------------
----SYNTAX-----

DECLARE
    -- variables
BEGIN
For counter_variable IN start_value .. end_value
Loop
	--Program statements
END Loop;
END;
/

DECLARE
    n number;
    c number:=1; -- start counter with 1 and run till number given by user
BEGIN
    n:=&n; -- input from user
    FOR any_num in c..n LOOP
    	dbms_output.put_line(any_num || ' ');
    end loop;
END;
/
--WHILE-----------------------------------------------------------------------------------------

DECLARE
    --variables
BEGIN
WHILE condition loop
	--statements
END LOOP;
END;
/

declare
	n number;
	x number:=1;
begin
	n:=&n;
WHILE n>=x loop -- loop till condition fails
	dbms_output.put_line(x || '');
		x:=x+1; -- counter increment
END LOOP;
end;
/
