
-- join tables with same attribute
select * from 
customer natural join orders;

-- need to specific attribute name when more than one attr are same
-- try to explicit the join condition will make it less prone to errors
-- better query 
select * from 
customer c , orders o
where c.cust_code = o.cust_code;