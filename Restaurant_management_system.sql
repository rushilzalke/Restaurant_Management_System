CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  zip_code VARCHAR(10),
  loyalty_points INT DEFAULT 0
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  zip_code VARCHAR(10),
  position VARCHAR(255),
  hourly_wage DECIMAL(10, 2)
);

CREATE TABLE reservations (
  reservation_id INT PRIMARY KEY,
  customer_id INT,
  date DATE,
  time TIME,
  party_size INT,
  table_number INT,
  notes TEXT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE menu_items (
  menu_item_id INT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  category VARCHAR(255),
  price DECIMAL(10, 2),
  in_stock BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  employee_id INT,
  order_date DATE,
  order_time TIME,
  total_price DECIMAL(10, 2),
  notes TEXT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

CREATE TABLE order_items (
  order_id INT,
  menu_item_id INT,
  quantity INT,
  PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY (menu_item_id)
    REFERENCES menu_items(menu_item_id)
);

CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY,
  customer_id INT,
  date DATE,
  time TIME,
  feedback_text TEXT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY,
  menu_item_id INT,
  quantity INT,
    FOREIGN KEY (menu_item_id)
    REFERENCES menu_items(menu_item_id)
);

CREATE TABLE order_history (
  order_id INT,
  customer_id INT,
  employee_id INT,
  order_date DATE,
  order_time TIME,
  total_price DECIMAL(10, 2),
  notes TEXT,
  PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

CREATE TABLE employee_schedule (
  schedule_id INT PRIMARY KEY,
  employee_id INT,
  shift_start DATETIME,
  shift_end DATETIME,
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

CREATE TABLE salaries (
  salary_id INT PRIMARY KEY,
  employee_id INT,
  pay_date DATE,
  amount DECIMAL(10, 2),
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);

CREATE TABLE offers (
  offer_id INT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  start_date DATE,
  end_date DATE,
  discount DECIMAL(10, 2),
  min_total DECIMAL(10, 2)
  );
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address, city, state, zip_code, loyalty_points)
VALUES
  (1, 'John', 'Doe', 'johndoe@email.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345', 150),
  (2, 'Jane', 'Smith', 'janesmith@email.com', '555-5678', '456 Oak Ave', 'Otherville', 'NY', '67890', 100),
  (3, 'Mike', 'Johnson', 'mikejohnson@email.com', '555-9876', '789 Elm St', 'Anycity', 'TX', '54321', 75),
  (4, 'Samantha', 'Lee', 'samanthalee@email.com', '555-5555', '321 Maple Dr', 'Smalltown', 'IL', '67891', 200),
  (5, 'Robert', 'Davis', 'robertdavis@email.com', '555-1111', '654 Pine St', 'Bigcity', 'FL', '12346', 50),
  (6, 'Emily', 'Wilson', 'emilywilson@email.com', '555-2222', '987 Cedar Ln', 'Anyville', 'AZ', '54322', 25),
  (7, 'David', 'Brown', 'davidbrown@email.com', '555-3333', '246 Oak St', 'Othertown', 'GA', '67892', 100),
  (8, 'Maria', 'Garcia', 'mariagarcia@email.com', '555-4444', '369 Maple Ave', 'Somecity', 'IL', '12347', 150),
  (9, 'Brian', 'Jackson', 'brianjackson@email.com', '555-5556', '753 Elm Dr', 'Smallville', 'TX', '54323', 75),
  (10, 'Melissa', 'Davis', 'melissadavis@email.com', '555-6666', '951 Pine Ave', 'Bigtown', 'FL', '67893', 200);

INSERT INTO employees (employee_id, first_name, last_name, email, phone, address, city, state, zip_code, position, hourly_wage)
VALUES
(1, 'John', 'Doe', 'johndoe@email.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345', 'Server', 15.00),
(2, 'Jane', 'Smith', 'janesmith@email.com', '234-567-8901', '456 Oak Ave', 'Sometown', 'NY', '67890', 'Bartender', 17.50),
(3, 'Mike', 'Johnson', 'mikejohnson@email.com', '345-678-9012', '789 Elm St', 'Otherplace', 'TX', '23456', 'Chef', 25.00),
(4, 'Sarah', 'Lee', 'sarahlee@email.com', '456-789-0123', '321 Pine St', 'Somewhere', 'FL', '34567', 'Host', 12.00),
(5, 'David', 'Jones', 'davidjones@email.com', '567-890-1234', '654 Birch Ln', 'Nowhere', 'MA', '45678', 'Server', 14.00),
(6, 'Emily', 'Brown', 'emilybrown@email.com', '678-901-2345', '987 Cedar Rd', 'Anytown', 'CA', '12345', 'Bartender', 16.00),
(7, 'Brian', 'Taylor', 'briantaylor@email.com', '789-012-3456', '246 Oak Ave', 'Sometown', 'NY', '67890', 'Chef', 28.00),
(8, 'Jessica', 'Clark', 'jessicaclark@email.com', '890-123-4567', '369 Elm St', 'Otherplace', 'TX', '23456', 'Host', 11.00),
(9, 'Kevin', 'Lee', 'kevinlee@email.com', '901-234-5678', '753 Pine St', 'Somewhere', 'FL', '34567', 'Server', 15.00),
(10, 'Michelle', 'Davis', 'michelledavis@email.com', '012-345-6789', '159 Birch Ln', 'Nowhere', 'MA', '45678', 'Bartender', 18.00);

INSERT INTO reservations (reservation_id, customer_id, date, time, party_size, table_number, notes)
VALUES
(1, 3, '2023-04-08', '18:00:00', 4, 5, 'Outdoor seating preferred'),
(2, 1, '2023-04-10', '19:30:00', 2, 3, 'Anniversary dinner'),
(3, 4, '2023-04-12', '12:30:00', 6, 8, 'Birthday celebration'),
(4, 2, '2023-04-14', '20:00:00', 3, 1, ''),
(5, 5, '2023-04-15', '18:30:00', 5, 7, ''),
(6, 7, '2023-04-17', '14:00:00', 2, 2, ''),
(7, 8, '2023-04-18', '19:00:00', 4, 6, 'Gluten-free options needed'),
(8, 10, '2023-04-19', '21:00:00', 2, 4, ''),
(9, 9, '2023-04-20', '17:30:00', 3, 10, ''),
(10, 6, '2023-04-22', '18:30:00', 6, 9, 'High chair needed for toddler');

INSERT INTO menu_items (menu_item_id, name, description, category, price, in_stock)
VALUES (1, 'Margherita Pizza', 'Tomato sauce, mozzarella cheese, and fresh basil', 'Pizza', 12.99, TRUE),
(2, 'Pepperoni Pizza', 'Tomato sauce, mozzarella cheese, and pepperoni', 'Pizza', 14.99, TRUE),
(3, 'Caesar Salad', 'Romaine lettuce, croutons, parmesan cheese, and Caesar dressing', 'Salad', 8.99, TRUE),
(4, 'Spaghetti Bolognese', 'Spaghetti with meat sauce', 'Pasta', 11.99, TRUE),
(5, 'Chicken Alfredo', 'Fettuccine with creamy Alfredo sauce and grilled chicken', 'Pasta', 13.99, TRUE),
(6, 'New York Strip Steak', '12 oz. grilled steak with mashed potatoes and green beans', 'Entree', 22.99, TRUE),
(7, 'Grilled Salmon', '6 oz. grilled salmon with roasted vegetables', 'Entree', 19.99, TRUE),
(8, 'Cheesecake', 'New York-style cheesecake with raspberry sauce', 'Dessert', 6.99, TRUE),
(9, 'Tiramisu', 'Coffee-flavored Italian dessert', 'Dessert', 7.99, TRUE),
(10, 'Soda', 'Coke, Sprite, or Dr. Pepper', 'Beverage', 2.49, TRUE);

INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (1, 1, 1, '2022-03-15', '18:30:00', 25.99, 'No onions on burger.');
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (2, 3, 2, '2022-03-17', '12:15:00', 32.50, 'Extra sauce on pizza.');
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (3, 5, 1, '2022-03-19', '19:00:00', 47.85, 'Gluten-free pasta, please.');
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (4, 2, 3, '2022-03-20', '16:45:00', 17.99, NULL);
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (5, 4, 2, '2022-03-22', '11:30:00', 28.75, 'No nuts in salad.');
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (6, 6, 1, '2022-03-23', '14:15:00', 21.50, NULL);
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (7, 7, 3, '2022-03-25', '18:45:00', 39.25, 'Medium rare steak.');
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (8, 9, 2, '2022-03-27', '20:00:00', 12.99, NULL);
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (9, 8, 1, '2022-03-28', '17:30:00', 18.75, NULL);
INSERT INTO orders (order_id, customer_id, employee_id, order_date, order_time, total_price, notes)
VALUES (10, 10, 3, '2022-03-30', '13:00:00', 29.50, 'Extra cheese on burger.');
INSERT INTO order_items (order_id, menu_item_id, quantity) VALUES (1, 4, 2),
(1, 2, 1), (2, 5, 3),(2, 3, 1), (3, 1, 1), (3, 6, 2),(4, 2, 1), (4, 3, 1),(5, 4, 2), (5, 1, 1);

INSERT INTO feedback (feedback_id, customer_id, date, time, feedback_text) VALUES
(1, 1, '2022-10-01', '10:00:00', 'Great food and service!'),
(2, 2, '2022-10-02', '12:30:00', 'The music was a bit too loud.'),
(3, 3, '2022-10-03', '18:45:00', 'The dish was not as described on the menu.'),
(4, 4, '2022-10-04', '20:15:00', 'The waitstaff was very friendly and accommodating.'),
(5, 5, '2022-10-05', '14:00:00', 'The dessert was amazing!'),
(6, 6, '2022-10-06', '17:30:00', 'The wine selection was great.'),
(7, 7, '2022-10-07', '19:00:00', 'The wait time for our table was longer than expected.'),
(8, 8, '2022-10-08', '13:15:00', 'The salad was not fresh.'),
(9, 9, '2022-10-09', '15:45:00', 'The steak was cooked perfectly.'),
(10, 10, '2022-10-10', '21:30:00', 'The cocktail was too sweet.');

INSERT INTO inventory (inventory_id, menu_item_id, quantity) VALUES
(1, 1, 50),
(2, 2, 75),
(3, 3, 25),
(4, 4, 100),
(5, 5, 200),
(6, 6, 30),
(7, 7, 20),
(8, 8, 40),
(9, 9, 50),
(10, 10, 100);

INSERT INTO order_history (order_id, customer_id, employee_id, order_date, order_time, total_price, notes) VALUES
(10001, 20001, 30001, '2022-03-15', '13:30:00', 45.99, 'No special requests'),
(10002, 20003, 30005, '2022-03-16', '19:00:00', 82.50, 'Allergic to nuts'),
(10003, 20002, 30002, '2022-03-17', '18:45:00', 56.70, 'Gluten-free'),
(10004, 20004, 30003, '2022-03-18', '20:15:00', 70.00, 'Extra spicy'),
(10005, 20001, 30005, '2022-03-19', '12:00:00', 23.80, 'No onions'),
(10006, 20002, 30003, '2022-03-20', '14:30:00', 44.50, 'No dairy'),
(10007, 20004, 30004, '2022-03-21', '17:45:00', 67.40, 'Extra ketchup'),
(10008, 20003, 30002, '2022-03-22', '21:00:00', 92.75, 'Allergic to shellfish'),
(10009, 20001, 30001, '2022-03-23', '19:15:00', 60.20, 'No salt'),
(10010, 20004, 30005, '2022-03-24', '13:00:00', 35.90, 'Extra mayo');

INSERT INTO employee_schedule (schedule_id, employee_id, shift_start, shift_end) VALUES
(1, 101, '2023-04-03 08:00:00', '2023-04-03 16:00:00'),
(2, 102, '2023-04-03 09:00:00', '2023-04-03 17:00:00'),
(3, 103, '2023-04-03 10:00:00', '2023-04-03 18:00:00'),
(4, 104, '2023-04-03 11:00:00', '2023-04-03 19:00:00'),
(5, 105, '2023-04-03 12:00:00', '2023-04-03 20:00:00'),
(6, 106, '2023-04-03 13:00:00', '2023-04-03 21:00:00'),
(7, 107, '2023-04-03 14:00:00', '2023-04-03 22:00:00'),
(8, 108, '2023-04-03 15:00:00', '2023-04-03 23:00:00'),
(9, 101, '2023-04-04 08:00:00', '2023-04-04 16:00:00'),
(10, 102, '2023-04-04 09:00:00', '2023-04-04 17:00:00');

INSERT INTO salaries (salary_id, employee_id, pay_date, amount) VALUES
  (1, 1001, '2022-01-31', 5000.00),
  (2, 1002, '2022-01-31', 4500.00),
  (3, 1003, '2022-01-31', 5500.00),
  (4, 1004, '2022-01-31', 6000.00),
  (5, 1005, '2022-01-31', 6500.00),
  (6, 1006, '2022-01-31', 7000.00),
  (7, 1007, '2022-01-31', 7500.00),
  (8, 1008, '2022-01-31', 8000.00),
  (9, 1009, '2022-01-31', 8500.00),
  (10, 1010, '2022-01-31', 9000.00);


INSERT INTO offers (offer_id, name, description, start_date, end_date, discount, min_total) VALUES
  (1, 'Summer Sale', 'Get discounts on all summer clothing', '2022-06-01', '2022-06-30', 10.00, 50.00),
  (2, 'Back to School', 'Get discounts on all school supplies', '2022-08-01', '2022-08-31', 15.00, 100.00),
  (3, 'Black Friday', 'Get discounts on all items', '2022-11-25', '2022-11-27', 25.00, 75.00),
  (4, 'Cyber Monday', 'Get discounts on all electronics', '2022-11-28', '2022-11-30', 20.00, 150.00),
  (5, 'Christmas Sale', 'Get discounts on all decorations', '2022-12-01', '2022-12-31', 30.00, 50.00),
  (6, 'New Year Sale', 'Get discounts on all items', '2023-01-01', '2023-01-15', 10.00, 50.00),
  (7, 'Valentine\'s Day', 'Get discounts on all gifts', '2023-02-01', '2023-02-14', 15.00, 75.00),
  (8, 'Easter Sale', 'Get discounts on all items', '2023-04-01', '2023-04-15', 10.00, 25.00),
  (9, 'Spring Sale', 'Get discounts on all spring clothing', '2023-05-01', '2023-05-31', 20.00, 50.00),
  (10, 'Memorial Day', 'Get discounts on all items', '2023-05-27', '2023-05-29', 25.00, 100.00);
  
  -- 1. Display the top 5 most loyal customers based on their loyalty points.
SELECT first_name, last_name, loyalty_points
FROM customers
ORDER BY loyalty_points DESC
LIMIT 5;

-- 2. Display the total sales for each category of menu items .
SELECT category, SUM(total_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN menu_items mi ON oi.menu_item_id = mi.menu_item_id
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY category;

-- 3.Display the menu items that have never been ordered
SELECT name, category
FROM menu_items
WHERE menu_item_id NOT IN (
  SELECT menu_item_id FROM order_items
);

-- 4. Display the menu items that are out of stock.
SELECT name, category
FROM menu_items
WHERE in_stock = FALSE;

-- 5. Display the average hourly wage for each position.
SELECT position, AVG(hourly_wage) AS avg_hourly_wage
FROM employees
GROUP BY position;

-- 6. Display the menu items that have been ordered more than 100 times.
SELECT name, category, COUNT(*) AS num_orders
FROM menu_items
JOIN order_items ON menu_items.menu_item_id = order_items.menu_item_id
GROUP BY menu_items.menu_item_id
HAVING num_orders > 100;

-- 7. Display the number of reservations made for each day in the next week.
SELECT date, COUNT(*) AS num_reservations
FROM reservations
WHERE date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 WEEK)
GROUP BY date;

-- 8. Display the top 10 busiest hours based on the number of orders placed.
SELECT DATE_FORMAT(order_time, '%H:%i') AS hour, COUNT(*) AS num_orders
FROM orders
GROUP BY hour
ORDER BY num_orders DESC
LIMIT 10;

-- .Display the menu items that have never been out of stock. +++++++++++++++++++
SELECT name, category
FROM menu_items
WHERE menu_item_id NOT IN (
  SELECT menu_item_id FROM inventory WHERE quantity = 0
);

-- .Display the total sales for each employee in the last month. +++++++++
SELECT first_name, last_name, SUM(total_price) AS total_sales
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY e.employee_id;

-- 9.Display the number of reservations made by each customer in the month
SELECT c.first_name, c.last_name, COUNT(*) AS num_reservations
FROM customers c
JOIN reservations r ON c.customer_id = r.customer_id
WHERE date >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY c.customer_id;

-- 10.Show the top 5 employees with the highest total sales for the year 2022.
SELECT employees.first_name, employees.last_name, SUM(orders.total_price) AS total_sales
FROM employees
JOIN orders ON employees.employee_id = orders.employee_id
WHERE orders.order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY employees.first_name, employees.last_name
ORDER BY total_sales DESC
LIMIT 5;

-- 11.Show the average hourly wage of each position in the restaurant.
SELECT position, AVG(hourly_wage) AS avg_hourly_wage
FROM employees
GROUP BY position;

-- 12.Show the menu items that are out of stock and need to be reordered.
SELECT name, quantity
FROM menu_items
JOIN inventory ON menu_items.menu_item_id = inventory.menu_item_id
WHERE in_stock = FALSE AND quantity < 10;

-- 13.Show the inventory level of each menu item and indicate whether it is low, medium, or high.
SELECT name, quantity,
  CASE
    WHEN quantity < 10 THEN 'Low'
    WHEN quantity < 50 THEN 'Medium'
    ELSE 'High'
  END AS inventory_level
FROM menu_items
JOIN inventory ON menu_items.menu_item_id = inventory.menu_item_id;

-- 14.Find all reservations that have a party size greater than the average party size of all reservations:
SELECT *
FROM reservations
WHERE party_size > (
  SELECT AVG(party_size)
  FROM reservations
);

-- 15.Calculate the total number of hours worked by each employee in the past week:
SELECT e.employee_id, e.first_name, e.last_name, SUM(TIME_TO_SEC(TIMEDIFF(es.shift_end, es.shift_start))/3600) AS hours_worked
FROM employees e
INNER JOIN employee_schedule es ON e.employee_id = es.employee_id
WHERE es.shift_start >= DATE_SUB(NOW(), INTERVAL 1 WEEK)
GROUP BY e.employee_id;

-- 16. Find the total number of orders placed by each customer.
SELECT c.first_name, COUNT(*) AS total_orders_placed
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 17.Retrieve all customers and their orders:
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- This query uses a CTE to calculate the total revenue for each category of menu items sold during a specific date range:
WITH menu_item_sales AS (
  SELECT menu_items.category, SUM(menu_items.price * order_items.quantity) AS revenue
  FROM menu_items
  JOIN order_items ON menu_items.menu_item_id = order_items.menu_item_id
  JOIN orders ON order_items.order_id = orders.order_id
  WHERE orders.order_date BETWEEN '2022-03-17' AND '2022-03-25'
  GROUP BY menu_items.category
)
SELECT category, revenue
FROM menu_item_sales
ORDER BY revenue DESC;

-- This query uses a CTE to calculate the average hourly wage for employees in each position:
WITH hourly_wage_avg AS (
  SELECT position, AVG(hourly_wage) AS avg_wage
  FROM employees
  GROUP BY position
)
SELECT position, avg_wage
FROM hourly_wage_avg
ORDER BY avg_wage DESC;

-- Find all customers who share the same last name:
SELECT c1.customer_id, c1.first_name, c1.last_name, c2.customer_id, c2.first_name, c2.last_name
FROM customers c1
JOIN customers c2 ON c1.last_name = c2.last_name AND c1.customer_id <> c2.customer_id
ORDER BY c1.last_name, c1.first_name;

-- Find all employees who have worked on the same order:
SELECT e1.employee_id, e1.first_name, e1.last_name, e2.employee_id, e2.first_name, e2.last_name, o.order_id
FROM employees e1
JOIN orders o ON o.employee_id = e1.employee_id
JOIN orders o2 ON o2.order_id = o.order_id AND o2.employee_id <> e1.employee_id
JOIN employees e2 ON e2.employee_id = o2.employee_id
ORDER BY o.order_id, e1.last_name, e1.first_name;
