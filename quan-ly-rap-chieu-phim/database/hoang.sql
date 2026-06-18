
-- 5. Bảng nhân viên (employees)
CREATE TABLE employees (
    employee_id  INT AUTO_INCREMENT PRIMARY KEY,
    full_name    VARCHAR(100),
    phone        VARCHAR(20),
    email        VARCHAR(100),
    position     VARCHAR(50)                  -- VD: 'thu ngân', 'bảo vệ', 'quản lý'
);

-- 6. Bảng suất chiếu (showtimes)
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

-- 7. Bảng đặt vé (bookings)
CREATE TABLE bookings (
    booking_id    INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT          NOT NULL,
    booking_date  DATETIME     DEFAULT CURRENT_TIMESTAMP,
    total_amount  DECIMAL(10,2),
    status        VARCHAR(20),                -- 'pending', 'confirmed', 'cancelled'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- 8. Bảng vé (tickets)
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
