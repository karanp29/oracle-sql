
--Left Join - natural join + all null value from left

select * from 
customer c 
LEFT JOIN orders o ON c.cust_code = o.cust_code ;

select * from agents a 
LEFT  JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE;