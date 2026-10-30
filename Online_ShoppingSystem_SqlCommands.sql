USE onlineshopping;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Password VARCHAR(100) NOT NULL
);
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2),
    Stock_Quantity INT,
    Brand VARCHAR(100),
    Category_ID INT,
    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Address_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Order_Status VARCHAR(30),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Address_ID)
        REFERENCES Address(Address_ID)
);
CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT,
    Added_Date DATE,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Method VARCHAR(50),
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Transaction_ID VARCHAR(100) UNIQUE,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);
CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY,
    Order_ID INT,
    Courier_Name VARCHAR(100),
    Tracking_Number VARCHAR(100) UNIQUE,
    Shipment_Date DATE,
    Delivery_Date DATE,
    Shipment_Status VARCHAR(50),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT,
    Review_Text VARCHAR(500),
    Review_Date DATE,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY,
    Customer_ID INT,
    House_No VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);
INSERT INTO Customer
(Customer_ID, Customer_Name, Email, Phone, Password)
VALUES
(101, 'Rahul Kumar', 'rahul@gmail.com', '9876543210', 'Rahul@123'),
(102, 'Priya Sharma', 'priya@gmail.com', '9876543211', 'Priya@123'),
(103, 'Arjun Reddy', 'arjun@gmail.com', '9876543212', 'Arjun@123'),
(104, 'Ananya Rao', 'ananya@gmail.com', '9876543213', 'Ananya@123'),
(105, 'Vikram Singh', 'vikram@gmail.com', '9876543214', 'Vikram@123'),
(106, 'Sneha Reddy', 'sneha@gmail.com', '9876543215', 'Sneha@123'),
(107, 'Aarav Patel', 'aarav@gmail.com', '9876543216', 'Aarav@123'),
(108, 'Meera Das', 'meera@gmail.com', '9876543217', 'Meera@123'),
(109, 'Aditya Verma', 'aditya@gmail.com', '9876543218', 'Aditya@123'),
(110, 'Kavya Nair', 'kavya@gmail.com', '9876543219', 'Kavya@123');
INSERT INTO Category
(Category_ID, Category_Name, Description)
VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Men and women clothing'),
(3, 'Books', 'Educational and general books'),
(4, 'Home Appliances', 'Appliances for home use'),
(5, 'Sports', 'Sports equipment and accessories'),
(6, 'Beauty', 'Beauty and personal care products');
INSERT INTO Product
(Product_ID, Product_Name, Description, Price, Stock_Quantity, Brand, Category_ID)
VALUES
(501, 'Wireless Headphones', 'Bluetooth wireless headphones', 2499, 25, 'Boat', 1),
(502, 'Smart Watch', 'Fitness tracking smart watch', 3999, 15, 'Noise', 1),
(503, 'Laptop', '15 inch performance laptop', 55999, 8, 'HP', 1),
(504, 'Smartphone', 'Android smartphone', 24999, 12, 'Samsung', 1),
(505, 'T-Shirt', 'Cotton casual T-Shirt', 799, 40, 'Puma', 2),
(506, 'Jeans', 'Slim fit denim jeans', 1499, 30, 'Levis', 2),
(507, 'Python Programming', 'Programming textbook', 699, 20, 'Pearson', 3),
(508, 'Database Systems', 'DBMS reference book', 899, 18, 'McGraw Hill', 3),
(509, 'Microwave Oven', '20 litre microwave oven', 8999, 10, 'LG', 4),
(510, 'Electric Kettle', '1.5 litre electric kettle', 1299, 35, 'Prestige', 4),
(511, 'Cricket Bat', 'Professional cricket bat', 2499, 7, 'SS', 5),
(512, 'Football', 'Professional football', 999, 25, 'Nivia', 5),
(513, 'Face Wash', 'Daily skincare face wash', 399, 50, 'Nivea', 6),
(514, 'Perfume', 'Long lasting perfume', 1599, 22, 'Fogg', 6),
(515, 'Bluetooth Speaker', 'Portable Bluetooth speaker', 1999, 5, 'JBL', 1);
INSERT INTO Address
(Address_ID, Customer_ID, House_No, Street, City, State, Pincode)
VALUES
(201, 101, '12-4', 'MG Road', 'Hyderabad', 'Telangana', '500001'),
(202, 102, '45-2', 'Banjara Road', 'Hyderabad', 'Telangana', '500034'),
(203, 103, '8-11', 'Park Street', 'Bengaluru', 'Karnataka', '560001'),
(204, 104, '22-7', 'Lake View Road', 'Chennai', 'Tamil Nadu', '600001'),
(205, 105, '15-8', 'Gandhi Nagar', 'Delhi', 'Delhi', '110001'),
(206, 106, '7-3', 'Madhapur Road', 'Hyderabad', 'Telangana', '500081'),
(207, 107, '18-6', 'FC Road', 'Pune', 'Maharashtra', '411004'),
(208, 108, '10-2', 'Salt Lake Road', 'Kolkata', 'West Bengal', '700001'),
(209, 109, '32-5', 'Civil Lines', 'Jaipur', 'Rajasthan', '302001'),
(210, 110, '5-9', 'MG Road', 'Kochi', 'Kerala', '682001'),
(211, 101, '22-8', 'Kukatpally', 'Hyderabad', 'Telangana', '500072');
INSERT INTO Orders
(Order_ID, Customer_ID, Address_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(301, 101, 201, '2026-08-01', 2499, 'Delivered'),
(302, 102, 202, '2026-08-03', 3999, 'Delivered'),
(303, 103, 203, '2026-08-05', 55999, 'Shipped'),
(304, 104, 204, '2026-08-07', 799, 'Delivered'),
(305, 105, 205, '2026-08-10', 8999, 'Pending'),
(306, 106, 206, '2026-08-12', 24999, 'Delivered'),
(307, 107, 207, '2026-08-15', 1499, 'Shipped'),
(308, 108, 208, '2026-08-17', 1598, 'Delivered'),
(309, 109, 209, '2026-08-20', 2499, 'Pending'),
(310, 110, 210, '2026-08-22', 1299, 'Delivered'),
(311, 101, 211, '2026-08-25', 1999, 'Shipped'),
(312, 102, 202, '2026-08-27', 2998, 'Pending');
INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Date, Amount, Transaction_ID)
VALUES
(601, 301, 'UPI', '2026-08-01', 2499, 'TXN1001'),
(602, 302, 'Credit Card', '2026-08-03', 3999, 'TXN1002'),
(603, 303, 'Debit Card', '2026-08-05', 55999, 'TXN1003'),
(604, 304, 'Cash on Delivery', '2026-08-07', 799, 'TXN1004'),
(605, 305, 'UPI', '2026-08-10', 8999, 'TXN1005'),
(606, 306, 'Credit Card', '2026-08-12', 24999, 'TXN1006'),
(607, 307, 'UPI', '2026-08-15', 1499, 'TXN1007'),
(608, 308, 'Debit Card', '2026-08-17', 1598, 'TXN1008'),
(609, 309, 'UPI', '2026-08-20', 2499, 'TXN1009'),
(610, 310, 'Cash on Delivery', '2026-08-22', 1299, 'TXN1010'),
(611, 311, 'UPI', '2026-08-25', 1999, 'TXN1011'),
(612, 312, 'Credit Card', '2026-08-27', 2998, 'TXN1012');
INSERT INTO Shipment
(Shipment_ID, Order_ID, Courier_Name, Tracking_Number,
 Shipment_Date, Delivery_Date, Shipment_Status)
VALUES
(701, 301, 'BlueDart', 'BD10001', '2026-08-02', '2026-08-04', 'Delivered'),
(702, 302, 'Delhivery', 'DL10002', '2026-08-04', '2026-08-06', 'Delivered'),
(703, 303, 'DTDC', 'DT10003', '2026-08-06', NULL, 'In Transit'),
(704, 304, 'BlueDart', 'BD10004', '2026-08-08', '2026-08-10', 'Delivered'),
(705, 305, 'Delhivery', 'DL10005', NULL, NULL, 'Processing'),
(706, 306, 'DTDC', 'DT10006', '2026-08-13', '2026-08-16', 'Delivered'),
(707, 307, 'BlueDart', 'BD10007', '2026-08-16', NULL, 'In Transit'),
(708, 308, 'Delhivery', 'DL10008', '2026-08-18', '2026-08-20', 'Delivered'),
(709, 309, 'DTDC', 'DT10009',NULL, NULL, 'Processing'),
(710, 310, 'BlueDart', 'BD10010', '2026-08-23', '2026-08-25', 'Delivered'),
(711, 311, 'Delhivery', 'DL10011','2026-08-26', NULL, 'In Transit'),
(712, 312, 'DTDC', 'DT10012', NULL, NULL, 'Processing');
INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Text, Review_Date)
VALUES
(801, 101, 501, 5, 'Excellent sound quality', '2026-08-05'),
(802, 102, 502, 4, 'Good smart watch', '2026-08-07'),
(803, 103, 503, 5, 'Very good laptop', '2026-08-09'),
(804, 104, 505, 4, 'Comfortable T-Shirt', '2026-08-11'),
(805, 105, 509, 5, 'Works perfectly', '2026-08-13'),
(806, 106, 504, 4, 'Good smartphone', '2026-08-15'),
(807, 107, 506, 3, 'Average quality', '2026-08-17'),
(808, 108, 514, 5, 'Nice fragrance', '2026-08-19'),
(809, 109, 511, 4, 'Good cricket bat', '2026-08-21'),
(810, 110, 510, 5, 'Very useful kettle', '2026-08-23'),
(811, 101, 515, 4, 'Good speaker', '2026-08-26'),
(812, 102, 501, 5, 'Amazing headphones', '2026-08-28');
SELECT * FROM Customer;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Address;
SELECT * FROM Orders;
SELECT * FROM Cart;
SELECT * FROM Payment;
SELECT * FROM Shipment;
SELECT * FROM Review;
SELECT Product_Name, Price
FROM Product
WHERE Price > 1000;
SELECT p.Product_Name, c.Category_Name
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;
SELECT c.Customer_Name, a.City, a.State
FROM Customer c
JOIN Address a
ON c.Customer_ID = a.Customer_ID;
SELECT c.Customer_Name, o.Order_ID, o.Order_Date,
       o.Total_Amount, o.Order_Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;
SELECT o.Order_ID, p.Payment_Method,
       p.Amount, p.Transaction_ID
FROM Orders o
JOIN Payment p
ON o.Order_ID = p.Order_ID;
SELECT p.Product_Name, c.Customer_Name,
       r.Rating, r.Review_Text
FROM Review r
JOIN Product p
ON r.Product_ID = p.Product_ID
JOIN Customer c
ON r.Customer_ID = c.Customer_ID;
SELECT COUNT(*) AS Total_Customers
FROM Customer;
SELECT COUNT(*) AS Total_Products
FROM Product;