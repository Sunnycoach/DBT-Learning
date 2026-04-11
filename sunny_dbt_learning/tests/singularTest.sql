select *
from 
{{ref("bFactSales")}}
WHERE net_amount < 0