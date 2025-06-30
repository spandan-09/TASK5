CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL );

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL );

INSERT INTO Customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com');

INSERT INTO Orders (customer_id, order_date, amount) VALUES
(1, '2025-06-01',100.00),
(1, '2025-06-10',150.00),
(2, '2025-06-11',200.00),
(4, '2025-06-12',250.00) ;

select * from customers;

select * from orders;

SELECT c.name, o.order_id, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id, o.amount
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id;