-- TRIGGERS


-- Trigger
-- Row Level - trigger for each row in transaction
-- Statement level - trigger only once in transaction

CREATE OR REPLACE TRIGGER before_insert_employee
BEFORE INSERT ON employ
FOR EACH ROW
BEGIN
    -- Set the creation date to the current date and time
    :NEW.created_at := SYSTIMESTAMP;
END;
/

insert into employ(emp_id,emp_name,emp_city,emp_salary,emp_dept) values (102,'KP','Thane w',334534.44,303);

-- now check employ table created_at is insert using trigger;

-- row level
CREATE OR REPLACE TRIGGER after_delete_employee
AFTER DELETE ON employ
FOR each row
BEGIN
    -- Log the deletion
    INSERT INTO delete_log (table_name, delete_date)
    VALUES ('employ', SYSTIMESTAMP);
END;
/

delete from employ where emp_id in (101,102);
select * from delete_log;
rollback;
-- after triggered that no of records are inserted




--statement level

-- create table delete_log(
--     table_name VARCHAR2(100),
--     delete_date TIMESTAMP
-- );
CREATE OR REPLACE TRIGGER after_delete_employee
AFTER DELETE ON employ
BEGIN
    -- Log the deletion
    INSERT INTO delete_log (table_name, delete_date)
    VALUES ('employ', SYSTIMESTAMP);
END;
/
-- after triggered only one record is inserted for each transaction