-- PACKAGES --

-- Creating Package
-- Package Body
-- Dropping Package

-- Create Package
create or replace package tramount as 
     PROCEDURE display_transaction(trans_id transactions.trid%type);
end tramount;
/

-- package body
create or replace package body tramount as 
procedure getamt(tid transactions.trid%type)is
amt transactions.amount%type;
begin
select amount into amt from transactions where trid = tid;
dbms_output.put_line('Amount: '||amt);
end getamt;
end tramount;
/

-- calling package
declare
id transactions.trid%type:=&id;
begin
tramount.getamt(id);
end;
Output
