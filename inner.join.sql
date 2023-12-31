

-- INNER JOIN

select * from 
customer c 
INNER JOIN orders o ON c.cust_code = o.cust_code ;

select * from agents a 
INNER JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE;

