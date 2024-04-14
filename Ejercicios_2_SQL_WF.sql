/* 1
select c.category_name, p.product_name, p.unit_price,
avg(p.unit_price) over(partition by c.category_id) as avgpricebycategory
from products p 
inner join categories c on p.category_id = c.category_id 
*/

/* 2
select avg(od.unit_price*od.quantity) over(partition by c.customer_id) as avgorderaumont,
o.order_id, o.customer_id , o.employee_id , o.order_date , o.required_date , o.shipped_date 
from orders o 
inner join customers c on o.customer_id = c.customer_id 
inner join order_details od on o.order_id = od.order_id 
*/

/* 3
select p.product_name , c.category_name , p.quantity_per_unit , p.unit_price , od.quantity,
avg(od.quantity) over(partition by c.category_id) as avgquantity
from products p 
inner join categories c on p.category_id = c.category_id 
inner join order_details od on p.product_id = od.product_id 
order by c.category_name , p.product_name 
*/

/* 4
select o.customer_id , o.order_date , 
min(o.order_date) over(partition by o.customer_id) as earliestoreddate
from orders o 
*/

/* 5
select p.product_id , p.product_name , p.unit_price , p.category_id ,
max(p.unit_price) over(partition by p.category_id) as maxunitprice
from products p 
*/

/* 6    No esta bien
select row_number () over(partition by od.quantity),
p.product_name, sum(od.quantity) over(order by p.product_id)
from products p 
inner join order_details od on p.product_id = od.product_id 
*/

/* 7
select row_number () over(order by c.customer_id) as rownumber,
c.customer_id , c.contact_name , c.contact_name , c.contact_title , c.address 
from customers c 
*/

/* 8
select rank() over(order by birth_date desc) as ranking,
e.first_name ||' '|| e.last_name as empleyeename, e.birth_date 
from employees e 
*/

/* 9
select sum(od.unit_price*od.quantity) over(partition by o.customer_id) as sumorderaumont, *
from orders o 
inner join order_details od on o.order_id = od.order_id 
*/

/* 10
select c.category_name , p.product_name , od.unit_price , od.quantity ,
sum(od.unit_price*od.quantity) over(partition by c.category_id) as totalsales
from order_details od 
inner join products p on od.product_id = p.product_id 
inner join categories c on p.category_id = c.category_id 
*/

/* 11
select o.ship_country , o.order_id , o.shipped_date , o.freight ,
sum(o.freight) over(partition by o.ship_country) as totalshippingcosts
from orders o 
order by o.ship_country , o.order_id
*/

/* 12
select c.customer_id , c.company_name , 
sum(o.order_id) over (partition by o.order_id) as totalSales,
rank() over(partition by o.customer_id) as Rank
from customers c 
inner join orders o on c.customer_id = o.customer_id  
inner join order_details od on o.order_id = od.order_id 
*/

/* 13
select e.employee_id , e.first_name , e.last_name , e.hire_date ,
rank () over(order by e.hire_date) as Rank
from employees e 
*/

/* 14
select p.product_id , p.product_name , p.unit_price ,
rank () over(order by p.unit_price desc) as Rank
from products p 
*/

/* 15
select o.order_id , p.product_id , od.quantity ,
lag(od.quantity,1) over(order by o.order_id, p.product_id)
from orders o 
inner join order_details od on o.order_id = od.order_id 
inner join products p on od.product_id = p.product_id 
*/

/* 16   con dudas
select o.order_id , o.order_date , o.customer_id , 
lag(o.order_date ,1) over(order by o.order_date desc) as lastorderdate
from orders o 
*/

/* 17
select p.product_id , p.product_name , p.unit_price , 
lag(p.unit_price,1) over (order by p.product_id) as lastunitprice,
p.unit_price - lag(p.unit_price,1) over (order by p.product_id) as pricediference
from products p 
*/

/* 18
select p.product_name , p.unit_price , 
lead(p.unit_price) over(order by p.product_id)
from products p 
*/

/* 19  con dudas
select c.category_name ,
sum(od.unit_price * od.quantity) over(partition by c.category_name)
from order_details od 
inner join products p on od.product_id = p.product_id 
inner join categories c on p.category_id = c.category_id 
*/
