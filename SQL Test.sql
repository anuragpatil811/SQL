#SELECT *  from Customers LEFT JOIN Orders on Customers.customer_id = Orders.customer_id

#select first_name, last_name, item from Customers JOIN ORDERS on Customers.customer_id = Orders.customer_id 

#SELECT Orders.order_id, orders.order_id, Orders.item, Orders.amount, Orders.customer_id, Customers.country FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id 

#SELECT  c.first_name, c.last_name, c.age, c.country, o.order_id, o.item, o.amount FROM Customers c LEFT JOIN Orders o on c.customer_id = o.customer_id where c.country="USA"

#SELECT Customers.first_name, Customers.last_name FROM Customers JOIN Shippings on Customers.customer_id = Shippings.shipping_id where status="Pending"

#select o.item, s.status from Orders o LEFT JOIN Shippings s on o.customer_id = s.customer

#SELECT c.first_name, c.last_name,  s.status from Customers c LEFT JOIN Shippings s ON c.customer_id = s.customer

#8).SELECT first_name, last_name, COUNT(order_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
# GROUP BY Customers.customer_id, first_name, last_name, Customers.customer_id

#9). select count(o.order_id) as total_orders, c.first_name, c.last_name from Orders o  JOIN Customers c on 
#o.customer_id = c.customer_id GROUP BY c.customer_id, c.first_name, c.last_name

#10).SELECT SUM(o.amount) as total_amount, c.first_name, c.last_name FROM Orders o JOIN Customers c on o.customer_id = c.customer_id 
#GROUP BY c.customer_id, c.first_name, c.last_name

#11).SELECT AVG(o.amount) as average_amount, c.first_name, c.last_name FROM Orders o 
#JOIN Customers c on o.customer_id = c.customer_id GROUP BY c.customer_id, c.first_name, c.last_name

#12). SELECT COUNT(customer_id), country FROM Customers GROUP BY country

#13).SELECT max(o.amount) as maximum_amount, c.first_name, c.last_name FROM Orders o JOIN Customers c on o.customer_id = c.customer_id
# GROUP BY c.customer_id, c.first_name, c.last_name

#14). SELECT item, sum(amount) as total_sales from Orders GROUP BY item

#15). SELECT c.country, min(o.amount) as minimum_amount From Customers c LEFT JOIN Orders o on c.customer_id = o.customer_id GROUP BY c.country

#16). select c.first_name, c.last_name, sum(o.amount) as total_amount FROM Customers c LEFT JOIN Orders o on c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name, c.last_name 
#HAVING SUM(o.amount) > 500

#17). SELECT c.first_name, c.last_name, count(o.order_id) as total_orders FROM Customers c LEFT JOIN  Orders o ON c.customer_id=o.customer_id 
#GROUP BY c.customer_id, c.first_name, c.last_name HAVING COUNT(o.order_id) > 1

#18). SELECT country, COUNT(customer_id) as total_customers from Customers GROUP BY country having COUNT(customer_id)>1

#19). SELECT item, SUM(amount) as total_sales FROM Orders GROUP BY item HAVING SUM(amount) > 500

#20).SELECT c.first_name, c.last_name, AVG(o.amount) as Average_Amount FROM Customers c LEFT JOIN ORDERS o ON c.customer_id = o.customer_id 
#GROUP BY c.first_name, c.last_name HAVING AVG(o.amount) > 100; 

#21). SELECT order_id, amount from Orders Order BY amount desc LIMIT 3

#22). SELECT order_id, amount FROM Orders ORDER BY amount DESC LIMIT 1 OFFSET 1; 

#23). SELECT amount from Orders ORDER BY amount DESC LIMIT 1 OFFSET 1

#24). select first_name, last_name from Customers LIMIT 2 OFFSET 2

#25). SELECT c.first_name, c.last_name, SUM(o.amount) as total_spending FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id 
#GROUP BY c.customer_id, c.first_name, c.last_name  ORDER BY total_spending DESC LIMIT 1 OFFSET 2

#26). SELECT c.first_name, c.last_name, o.order_id, o.amount FROM Customers c LEFT JOIN Orders o 
#ON c.customer_id = o.customer_id where o.amount > (SELECT AVG(amount) FROM Orders)

#Q.28). select first_name, last_name from customers where customer_id not in (select customer_id from Orders)

#Q.29). SELECT order_id, item, amount from Orders where amount > (select SUM(amount) FROM ORDERS where order_id=2)

#Q.30). SELECT c.first_name, c.last_name, SUM(o.amount) as total_orders from Customers c  JOIN Orders o ON c.customer_id = o.customer_id 
#GROUP BY c.customer_id, c.first_name, c.last_name HAVING SUM(o.amount) > (SELECT AVG(customer_total) FROM (select SUM(amount) as customer_total FROM Orders GROUP BY customer_id))