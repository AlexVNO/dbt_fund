select  
id, 
orderid as order_id,
paymentmethod,
STATUS,
amount,
CREATED 
from raw.stripe.payment