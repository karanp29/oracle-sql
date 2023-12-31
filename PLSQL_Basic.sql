-- PLSQL BASIC
-- set serveroutput on;
DECLARE --variables
    id number(6);
uname varchar2(50);
bol Boolean;
salary number(10, 2);
BEGIN NULL;
END;
/
-- constant

DECLARE 
random constant REAL := 500;
days_in_year CONSTANT Integer := 365;
input CONSTANT Boolean := FALSE;
BEGIN 
DBMS_OUTPUT.PUT_LINE(random);
DBMS_OUTPUT.PUT_LINE(days_in_year);

IF input then
DBMS_OUTPUT.PUT_LINE('input variable is true');
ELSE
DBMS_OUTPUT.PUT_LINE('input variable is false');
END IF;
END;
/


--Example calculate area of circle

DECLARE
    pi constant Integer:= 3.14;
    radius Integer;
BEGIN
    radius:= 25;
    DBMS_OUTPUT.PUT_LINE('Area of circle : ' || pi * radius * radius);
END;
/

-- Take input form user
-- variable_name:=&variable_name;


-- addition of two number given by user
DECLARE
    num1 integer;
    num2 integer;
BEGIN
    num1:=&num1;
    num2:=&num2;
    DBMS_OUTPUT.PUT_LINE('Addition of two number :' || (num1 + num2));
END;
/

-- CONTROL STATEMENTS

IF
END IF;

--BASIC IF
DECLARE
    num Integer := 10;
BEGIN
    IF mod(num,2) = 0 then
        DBMS_OUTPUT.PUT_LINE('number is even');
    END IF;
END;
/

-- IF ELSE
DECLARE
    num Integer := 101;
BEGIN
    IF mod(num,2) = 0 then
        DBMS_OUTPUT.PUT_LINE('number is even');
    ELSE
        DBMS_OUTPUT.PUT_LINE('number is odd');
    END IF;
END;
/

-- IF ELSIF ELSE

DECLARE
    num Integer := 0;
BEGIN
    IF num = 0 then
                DBMS_OUTPUT.PUT_LINE('number is zero');
    ELSIF mod(num,2) = 1 then
        DBMS_OUTPUT.PUT_LINE('number is odd');
    ELSE
        DBMS_OUTPUT.PUT_LINE('number is even');

    END IF;
END;
/


-- LOOPS

--BASIC LOOP
--FOR LOOP
--WHILE