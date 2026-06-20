
-- employees
CREATE TABLE employees (
    employee_id  INT AUTO_INCREMENT PRIMARY KEY,
    full_name    VARCHAR(100),
    phone        VARCHAR(20),
    email        VARCHAR(100),
    position     VARCHAR(50)
);

-- showtimes
CREATE TABLE showtimes (
    showtime_id  INT AUTO_INCREMENT PRIMARY KEY,
    movie_id     INT  NOT NULL,
    room_id      INT  NOT NULL,
    show_date    DATE,
    start_time   TIME,
    end_time     TIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)   ON DELETE CASCADE,
    FOREIGN KEY (room_id)  REFERENCES rooms(room_id)     ON DELETE CASCADE
);

-- bookings
CREATE TABLE bookings (
    booking_id    INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT          NOT NULL,
    booking_date  DATETIME     DEFAULT CURRENT_TIMESTAMP,
    total_amount  DECIMAL(10,2),
    status        VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- tickets
CREATE TABLE tickets (
    ticket_id     INT AUTO_INCREMENT PRIMARY KEY,
    booking_id    INT           NOT NULL,
    showtime_id   INT           NOT NULL,
    seat_id       INT           NOT NULL,
    ticket_price  DECIMAL(10,2),
    FOREIGN KEY (booking_id)  REFERENCES bookings(booking_id)   ON DELETE CASCADE,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id)     REFERENCES seats(seat_id)         ON DELETE CASCADE
);

-- Employees
INSERT INTO employees (full_name, phone, email, position) VALUES
('Lê Văn Cường',   '0923456789', 'cuong.le@cinema.com',  'Quản lý'),
('Phạm Thị Dung',  '0934567890', 'dung.pham@cinema.com', 'Thu ngân'),
('Hoàng Văn Em',   '0945678901', 'em.hoang@cinema.com',  'Bảo vệ');

-- Showtimes
INSERT INTO showtimes (movie_id, room_id, show_date, start_time, end_time) VALUES
(1, 1, '2025-06-01', '09:00:00', '12:01:00'),
(1, 2, '2025-06-01', '14:00:00', '17:01:00'),
(2, 3, '2025-06-02', '19:00:00', '21:49:00');

-- Bookings
INSERT INTO bookings (customer_id, total_amount, status) VALUES
(1, 150000.00, 'confirmed'),
(2, 90000.00,  'pending');

-- Tickets
INSERT INTO tickets (booking_id, showtime_id, seat_id, ticket_price) VALUES
(1, 1, 1, 75000.00),
(1, 1, 2, 75000.00),
(2, 2, 4, 90000.00);

