--  Bảng thanh toán 
CREATE TABLE payments (
    payment_id      INT AUTO_INCREMENT PRIMARY KEY,
    booking_id      INT          NOT NULL,
    payment_date    DATETIME     DEFAULT CURRENT_TIMESTAMP,
    amount          DECIMAL(10,2),
    payment_method  VARCHAR(50), 
    payment_status  VARCHAR(20), 
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

--  Bảng sản phẩm đồ ăn
CREATE TABLE products (
    product_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_name    VARCHAR(100),
    price           DECIMAL(10,2),
    stock_quantity  INT
);

--  Bảng hóa đơn đồ ăn 
CREATE TABLE food_orders (
    order_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT,
    order_date    DATETIME     DEFAULT CURRENT_TIMESTAMP,
    total_amount  DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

--  Chi tiết hóa đơn đồ ăn 
CREATE TABLE food_order_details (
    order_id    INT,
    product_id  INT,
    quantity    INT,
    unit_price  DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES food_orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)  ON DELETE CASCADE
);
-- Payments
INSERT INTO payments (booking_id, amount, payment_method, payment_status) VALUES
(1, 150000.00, 'momo', 'paid'),
(2, 90000.00,  'cash', 'pending');
-- Products
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Bắp rang bơ lớn', 45000.00, 200),
('Coca-Cola',        25000.00, 300),
('Combo đôi',        85000.00, 100);
-- Food Orders
INSERT INTO food_orders (customer_id, total_amount) VALUES
(1, 70000.00),
(2, 85000.00);
-- Food Order Details
INSERT INTO food_order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 45000.00),
(1, 2, 1, 25000.00),
(2, 3, 1, 85000.00);
