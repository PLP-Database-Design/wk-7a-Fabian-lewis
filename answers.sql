-- ### Question 1 Achieving 1NF (First Normal Form) 🛠️
-- Task:
-- - You are given the following table **ProductDetail**:

-- | OrderID | CustomerName  | Products                        |
-- |---------|---------------|---------------------------------|
-- | 101     | John Doe      | Laptop, Mouse                   |
-- | 102     | Jane Smith    | Tablet, Keyboard, Mouse         |
-- | 103     | Emily Clark   | Phone                           |


-- - In the table above, the **Products column** contains multiple values, which violates **1NF**.
-- - **Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order



-- **Answer**:
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);
INSERT INTO ProductDetail(OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');




-- ### Question 2 Achieving 2NF (Second Normal Form) 🧩

-- - You are given the following table **OrderDetails**, which is already in **1NF** but still contains partial dependencies:

-- | OrderID | CustomerName  | Product      | Quantity |
-- |---------|---------------|--------------|----------|
-- | 101     | John Doe      | Laptop       | 2        |
-- | 101     | John Doe      | Mouse        | 1        |
-- | 102     | Jane Smith    | Tablet       | 3        |
-- | 102     | Jane Smith    | Keyboard     | 1        |
-- | 102     | Jane Smith    | Mouse        | 2        |
-- | 103     | Emily Clark   | Phone        | 1        |

-- - In the table above, the **CustomerName** column depends on **OrderID** (a partial dependency), which violates **2NF**. 

-- - Write an SQL query to transform this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.



-- **Answer**:

 CREATE TABLE orders(
OrderID INT PRIMARY KEY,
customerName VARCHAR(100)
);
INSERT INTO orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Product  table 
CREATE TABLE product(
product_id INT primary key,
productName varchar(100),
quantity INT,
order_id INT,
foreign key(order_id) references orders(OrderID)
);

insert into product(product_id,productName,quantity,order_id)
values 
(1,'laptop',2,101),
(2,'Mouse',1,101),
(3,'Tablet',3,102),
(4,'Keyboard',2,102),
(5,'Mouse',1,102),
(6,'Phone',1,103);

