-- CURSOR --
-- Cursor is a Temporary Memory or Temporary Work Station. 
-- It is Allocated by Database Server at the Time of Performing DML operations on the Table by the User.
-- Cursors are used to store Database Tables. 

-- IMPLICIT CURSOR

-- Implicit cursors are automatically created by Oracle whenever an SQL statement is executed, 
-- when there is no explicit cursor for the statement. 
-- Programmers cannot control the implicit cursors and the information in it.

-- Any SQL cursor attribute will be accessed as sql%attribute_name as shown below in the example.
-- %FOUND - Returns TRUE if an INSERT, UPDATE, or DELETE statement affected one or more rows or 
--         a SELECT INTO statement returned one or more rows. Otherwise, it returns FALSE.


-- %NOTFOUND - The logical opposite of %FOUND. It returns TRUE if an INSERT, UPDATE, or DELETE statement 
--             affected no rows, or a SELECT INTO statement returned no rows. Otherwise, it returns FALSE.


-- %ISOPEN-Always returns FALSE for implicit cursors, because Oracle closes the SQL cursor automatically 
--         after executing its associated SQL statement.

-- %ROWCOUNT-Returns the number of rows affected by an INSERT, UPDATE, or DELETE statement, or returned 
--          by a SELECT INTO statement.

declare
   row_number number(5); 
begin
    update employ set emp_salary = emp_salary + emp_salary*0.1;
    if sql%notfound then
        dbms_output.put_line('no records found');
    elsif sql%found then
        row_number := SQL%ROWCOUNT;
        dbms_output.put_line(row_number||' records found');
    end if;
end;
/


-- EXPLICIT --

-- Explicit cursors are programmer-defined cursors for gaining more control over the context area. 
-- An explicit cursor should be defined in the declaration section of the PL/SQL Block. 
-- It is created on a SELECT Statement which returns more than one row.

-- Working with an explicit cursor includes the following steps −

-- Declaring - cursor for initializing the memory
-- Opening - cursor for allocating the memory
-- Fetching - cursor for retrieving the data
-- Closing -  cursor to release the allocated memory

declare
    emp employ%rowtype;
    --declare
    Cursor empcur is select * from employ;
begin
    open empcur;
    Fetch empcur into emp;
        dbms_output.put_line(emp.emp_id || ' ' ||emp.emp_name);
    close empcur;
end;
/

-- multiple row (another way)
-- for in loop

declare
    emp employ%rowtype;
    cursor empcur is select * from employ where emp_salary >= 10000;
begin
    for emp in empcur loop
        dbms_output.put_line(emp.emp_id || ' ' ||emp.emp_name);
    end loop;
end;
/

-- cursor with parameter
-- Cursor cursor_name(parameter_list) is cursor_query

DECLARE
    emprow employ%ROWTYPE;
    eno_get employ.emp_id%TYPE;
    
    -- Declare a cursor with a parameter
    CURSOR empcursor (eno_param NUMBER) IS
        SELECT * FROM employ WHERE emp_id = eno_param;
BEGIN
    -- Prompt user for employee ID
    eno_get := &eno_get;

    -- Open cursor and fetch data
    OPEN empcursor(eno_get);
    FETCH empcursor INTO emprow;

    -- Process the fetched data
    IF empcursor%FOUND THEN
        dbms_output.put_line(emprow.emp_id || ' ' || emprow.emp_name);
    ELSE
        dbms_output.put_line('Employee not found.');
    END IF;

    -- Close the cursor
    CLOSE empcursor;
END;
/
