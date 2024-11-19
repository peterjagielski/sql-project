-- Creating Categories table
CREATE TABLE Categories (
    category_id NUMBER PRIMARY KEY, 
    name VARCHAR2(255) NOT NULL
);

-- Creating Products table
CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY, 
    name VARCHAR2(255) NOT NULL,
    price NUMBER(10, 2) NOT NULL,
    stock_quantity NUMBER(10) NOT NULL,
    category_id NUMBER,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Creating Customers table
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(255) UNIQUE NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,
    status VARCHAR2(50) CHECK (status IN ('ACTIVE', 'INACTIVE')) NOT NULL,
    shipping_address VARCHAR2(255) NOT NULL
);

-- Creating Orders table
CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE NOT NULL,
    total_amount NUMBER(10, 2) NOT NULL,
    status VARCHAR2(50) CHECK (status IN ('PENDING', 'SHIPPED', 'CANCELLED')) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating Order_Items table (to hold products in orders)
CREATE TABLE Order_Items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Creating Shipments table (tracking shipment status)
CREATE TABLE Shipments (
    shipment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    shipment_date DATE,
    status VARCHAR2(50) CHECK (status IN ('PENDING', 'SHIPPED', 'DELIVERED')) NOT NULL,
    CONSTRAINT fk_shipment_order FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Creating Payments table (tracking payment information)
CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_date DATE NOT NULL,
    amount NUMBER(10, 2) NOT NULL,
    payment_method VARCHAR2(50) CHECK (payment_method IN ('CREDIT_CARD', 'PAYPAL', 'BANK_TRANSFER')) NOT NULL,
    status VARCHAR2(50) CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED')) NOT NULL,
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);