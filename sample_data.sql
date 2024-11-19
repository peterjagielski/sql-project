-- Inserting data into Categories table
INSERT INTO Categories (category_id, name)
VALUES (1, 'Fishing Rods');

INSERT INTO Categories (category_id, name)
VALUES (2, 'Fishing Reels');

INSERT INTO Categories (category_id, name)
VALUES (3, 'Fishing Accessories');

-- Inserting data into Products table
INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (1, 'Telescopic Fishing Rod', 35.99, 150, 1);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (2, 'Carbon Fiber Fishing Rod', 49.99, 80, 1);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (3, 'Spinning Fishing Reel', 22.50, 120, 2);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (4, 'Baitcasting Fishing Reel', 55.00, 60, 2);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (5, 'Fishing Tackle Box', 12.99, 200, 3);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (6, 'Fishing Lures Set', 8.99, 300, 3);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (7, 'Fishing Net', 15.49, 100, 3);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (8, 'Fishing Knife', 18.99, 70, 3);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (9, 'Fly Fishing Rod', 60.00, 50, 1);

INSERT INTO Products (product_id, name, price, stock_quantity, category_id)
VALUES (10, 'Electric Fishing Reel', 120.00, 30, 2);

-- Inserting data into Customers table with shipping addresses
INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'ACTIVE', '123 River St, Lakeview, NY 12345');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '321-654-0987', 'ACTIVE', '456 Lake Ave, Pondville, TX 23456');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (3, 'Robert', 'Brown', 'robert.brown@example.com', '555-111-2233', 'ACTIVE', '789 Fisher Rd, Clearwater, FL 34567');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (4, 'Emily', 'Davis', 'emily.davis@example.com', '555-222-3344', 'ACTIVE', '101 Ocean Blvd, Seaside, CA 45678');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (5, 'Michael', 'Miller', 'michael.miller@example.com', '555-333-4455', 'INACTIVE', '202 Mountain St, Greenfield, CO 56789');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (6, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '555-444-5566', 'ACTIVE', '303 Valley Rd, Hillside, PA 67890');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (7, 'William', 'Wilson', 'william.wilson@example.com', '555-555-6677', 'ACTIVE', '404 Pine St, Brooksville, FL 78901');

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, status, shipping_address)
VALUES (8, 'Sophia', 'Moore', 'sophia.moore@example.com', '555-666-7788', 'INACTIVE', '505 Maple St, Redwood, CA 89012');

-- Inserting data into Orders table with specific dates
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (1, 1, '2024-11-10', 95.98, 'PENDING');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (2, 2, '2024-11-11', 78.49, 'SHIPPED');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (3, 3, '2024-11-12', 128.50, 'CANCELLED');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (4, 4, '2024-11-13', 158.99, 'SHIPPED');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (5, 5, '2024-11-14', 210.00, 'PENDING');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (6, 6, '2024-11-15', 76.49, 'PENDING');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (7, 7, '2024-11-16', 45.99, 'PENDING');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status)
VALUES (8, 8, '2024-11-17', 120.00, 'SHIPPED');

-- Inserting data into Order_Items table
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (1, 1, 1, 2, 35.99);  -- 2 Telescopic Fishing Rods

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (2, 1, 5, 1, 12.99);  -- 1 Fishing Tackle Box

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (3, 2, 3, 1, 22.50);  -- 1 Spinning Fishing Reel

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (4, 2, 6, 2, 8.99);  -- 2 Fishing Lures Sets

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (5, 3, 4, 1, 55.00);  -- 1 Baitcasting Fishing Reel

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (6, 4, 9, 1, 60.00);  -- 1 Fly Fishing Rod

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (7, 5, 10, 1, 120.00);  -- 1 Electric Fishing Reel

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (8, 6, 8, 3, 18.99);  -- 3 Fishing Knives

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES (9, 7, 7, 2, 15.49);  -- 2 Fishing Nets

-- Inserting data into Shipments table (optional)
INSERT INTO Shipments (shipment_id, order_id, shipment_date, status)
VALUES (1, 1, '2024-11-11', 'PENDING');

INSERT INTO Shipments (shipment_id, order_id, shipment_date, status)
VALUES (2, 2, '2024-11-12', 'SHIPPED');

INSERT INTO Shipments (shipment_id, order_id, shipment_date, status)
VALUES (3, 4, '2024-11-14', 'SHIPPED');

-- Inserting data into Payments table (optional)
INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method, status)
VALUES (1, 1, '2024-11-10', 95.98, 'CREDIT_CARD', 'PENDING');

INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method, status)
VALUES (2, 2, '2024-11-11', 78.49, 'PAYPAL', 'COMPLETED');
