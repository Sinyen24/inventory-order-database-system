-- Sample data for Inventory & Order Database System

-- CUSTOMERS
INSERT INTO Customers VALUES
('C001', 'Alice Tan', '0123456789', 'alice@example.com',
 'Kajang, Selangor', 'Retail', 'No', 'No');

INSERT INTO Customers VALUES
('C002', 'Brian Lee', '0134567890', 'brian@example.com',
 'Cheras, Kuala Lumpur', 'Agent', 'No', 'Yes');


-- STAFF
INSERT INTO Staff VALUES
('S001', 'Daniel Wong', '0145678901',
 'Kuala Lumpur', 'daniel@example.com',
 '1234567890', 3200.00);

INSERT INTO Staff VALUES
('S002', 'Emily Lim', '0156789012',
 'Selangor', 'emily@example.com',
 '2345678901', 3500.00);


-- VENDORS
INSERT INTO Vendors VALUES
('V001', 'Eco Packaging Sdn Bhd', '0167890123',
 'eco@example.com', 'Shah Alam, Selangor',
 DATE '2026-09-30', 1500.00, 'Packaging', '3456789012');

INSERT INTO Vendors VALUES
('V002', 'Fresh Supply Enterprise', '0178901234',
 'fresh@example.com', 'Kajang, Selangor',
 DATE '2026-10-15', 2200.00, 'General Supplier', '4567890123');


-- PRODUCTS
INSERT INTO Products VALUES
('P001', 'Biodegradable Food Box', 12.50,
 'Packaging', 'Biodegradable', 0.50, 100);

INSERT INTO Products VALUES
('P002', 'Sharifah RTE Meal Pack', 18.00,
 'Food', 'Ready-To-Eat', 0.80, 80);

INSERT INTO Products VALUES
('P003', 'Paper Cup Set', 8.50,
 'Packaging', 'Disposable', 0.30, 150);


-- ORDERS
INSERT INTO Orders VALUES
('O001', 'REF1001', DATE '2026-08-01', 'Completed', 'C001');

INSERT INTO Orders VALUES
('O002', 'REF1002', DATE '2026-08-05', 'Pending', 'C002');


-- INVENTORY
INSERT INTO Inventory VALUES
('I001', 100, 10.00, DATE '2026-07-20', 'V001');

INSERT INTO Inventory VALUES
('I002', 150, 6.50, DATE '2026-07-22', 'V002');


-- ORDER DETAILS
INSERT INTO Order_Details VALUES
('O001', 'P001', 5, 0.05);

INSERT INTO Order_Details VALUES
('O001', 'P002', 2, 0.08);

INSERT INTO Order_Details VALUES
('O002', 'P003', 10, 0.04);


-- INVENTORY DETAILS
INSERT INTO Inventory_Details VALUES
('I001', 'P001');

INSERT INTO Inventory_Details VALUES
('I002', 'P003');


-- DELIVERY
INSERT INTO Delivery VALUES
('D001', DATE '2026-08-03', 15.00,
 'Courier', 'O001', 'S001');

INSERT INTO Delivery VALUES
('D002', DATE '2026-08-08', 20.00,
 'Van Delivery', 'O002', 'S002');

COMMIT;
