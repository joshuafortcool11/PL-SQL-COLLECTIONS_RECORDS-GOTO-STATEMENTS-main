### Create Tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    region VARCHAR(30)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    prod_name VARCHAR(50),
    category VARCHAR(40)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    sale_date DATE,
    amount DECIMAL(10,2)
);