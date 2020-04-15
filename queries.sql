-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.Id, p.productName, c.categoryName
from product as p
inner join category as c on p.CategoryId = c.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id, shipper.companyName 
from [order] as o
join shipper on shipper.id = o.shipVia
where o.orderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select od.orderId, p.productName, od.quantity
from orderDetail as od
join product as p on od.productid = p.Id
where od.orderId ='10251'
order by p.productName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as orderId, c.companyName, e.lastName
from [order] as o
join customer as c on c.id = o.customerId
join employee as e on e.id = o.employeeId;