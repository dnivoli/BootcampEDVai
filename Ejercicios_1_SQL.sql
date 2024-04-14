/* 1 
 select distinct category_name
from categories c 
 */


 /* 2 
 select distinct region
from customers c  
*/

/* 3
 select distinct contact_title 
from customers c
*/

/* 4
select *
from customers c 
order by country
*/

/* 5
select *
from orders o 
order by employee_id , order_date 
*/

/* 6
insert into customers values ('DIENI', 'Diego Nivoli', 'Diego Nivoli', 'Owner', 'Rìo Tercero', 'AR', 'Argentina', '3571609830', null)
*/

/* 7
insert into region values (5,'Argentina')
*/

/* 8
select *
from customers c  
where region is null
*/

/* 9
select product_name, coalesce (unit_price,null, 10)
from products p 
*/

/* 10
select c.company_name, c.contact_name, o.order_date 	
from orders o 
inner join customers c on o.customer_id = c.customer_id 
*/

/* 11
select o.order_id, p.product_name, od.discount 
from orders o 
inner join order_details od on od.order_id = o.order_id 
inner join products p on od.product_id = p.product_id 
*/

/* 12
select c.customer_id , c.company_name , o.order_id , o.order_date 
from customers c 
left join orders o on o.customer_id = c.customer_id 
*/

/* 13
select e.employee_id, e.last_name, t.territory_id, t.territory_description 
from employees e  
left join employee_territories et on e.employee_id = et.employee_id 
inner join territories t on et.territory_id = t.territory_id 
*/

/* 14
select o.order_id , c.company_name 
from orders o 
left join customers c on o.customer_id = c.customer_id 
*/

/* 15
select o.order_id , c.company_name 
from orders o 
right join customers c on o.customer_id = c.customer_id 
*/

/* 16
select c.company_name, o.order_date 
from shippers c 
right join orders o on c.shipper_id  = o.ship_via 
where to_char(o.order_date, 'YYYY') = '1996'
order by o.order_date 
*/

/* 17
select e.first_name, e.last_name, et.territory_id 
from employees e 
full outer join employee_territories et on e.employee_id = et.employee_id 
*/

/* 18
select o.order_id, od.unit_price, od.quantity, (od.unit_price * od.quantity) as total
from orders o 
full outer join order_details od on o.order_id = od.order_id 
*/

/* 19
select c.company_name as name
from customers c 
union 
select s.company_name as name
from suppliers s 
*/

/* 20
select e.first_name 
from employees e 
union 
select e2.first_name 
from employees e2 
where e2.reports_to is null
*/

/* 21
select p.product_name, p.product_id 
from products p 
where p.product_id in (	select od.product_id 
						from order_details od )
*/

/* 22
select c.company_name 
from customers c 
where c.customer_id in (select o.customer_id 
						from orders o 
						where o.ship_country = 'Argentina')
*/

/* 23
select distinct p.product_name 
from products p 
inner join order_details od on p.product_id = od.product_id 
where od.order_id not in (select o.order_id
						from orders o 
						where o.ship_country = 'Francia')
*/

/* 24
select od.order_id, sum(od.quantity)
from order_details od 
group by 1
*/

/* 25
select p.product_name, avg(p.units_in_stock)
from products p 
group by 1
*/

/* 26
select p.product_name, avg(p.units_in_stock)
from products p 
group by 1
having avg(p.units_in_stock) > 100
*/

/* 27
select c.company_name, avg(o.order_id)
from customers c 
inner join orders o on c.customer_id = o.customer_id 
group by 1
having avg(o.order_id) > 10 
*/

/* 28
select p.product_name, 
case when p.discontinued = 1 then 'Discontinued'
else c.category_name 
end as product_category
from products p 
inner join categories c on p.category_id = c.category_id 
*/

/* 29
select e.first_name, e.last_name,
case when e.title = 'Sales Manager' then 'Gerente de Ventas'
else e.title
end as job_title
from employees e 
*/
