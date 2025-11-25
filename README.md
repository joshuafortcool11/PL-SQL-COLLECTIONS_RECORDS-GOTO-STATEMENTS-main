# PL-SQL-COLLECTIONS_RECORDS-GOTO-STATEMENTS-main


Name:Iradukunda joshua

Id: 27967

course:Database Development with pl/sql

#  Agriculture Database — PL/SQL Project

##  Overview
This project demonstrates the use of **PL/SQL programming concepts** — including the **GOTO statement**, **Records**, and **Collections** — using a sample database called **`agriculture`**.  
It includes table creation, data insertion, and examples of PL/SQL blocks that handle database logic dynamically.

---
Business Problem

Context: Agribusiness operating across regions in Rwanda.

Challenge: The company does not know the top-selling agricultural products in each region.



##  1. Database Setup


### Create Tables
```sql
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
```

---

##  2. Insert Sample Data

### Customers
```sql
INSERT INTO customers VALUES (1, 'Yabesi', 'Musanze');
INSERT INTO customers VALUES (2, 'Niyonkuru', 'Rubavu');
INSERT INTO customers VALUES (3, 'Nyirimpeta', 'Gasabo');
INSERT INTO customers VALUES (4, 'Rukundo', 'Kicukiro');
INSERT INTO customers VALUES (5, 'Shema', 'Nyabihu');
INSERT INTO customers VALUES (6, 'Ruterana', 'Nyabihu');
INSERT INTO customers VALUES (7, 'Iduhorahafi', 'Remera');
INSERT INTO customers VALUES (8, 'Niyomugaba', 'Kimironko');
INSERT INTO customers VALUES (9, 'Uwase', 'Rubavu');
INSERT INTO customers VALUES (10, 'Uwera', 'Gakenke');
```

### Products
```sql
INSERT INTO products VALUES (1, 'Beans', 'Legumes');
INSERT INTO products VALUES (2, 'Oranges', 'Fruits');
INSERT INTO products VALUES (3, 'Carrots', 'Vegetables');
INSERT INTO products VALUES (4, 'Coffee', 'Cash Crops');
INSERT INTO products VALUES (5, 'Milk', 'Livestock');
INSERT INTO products VALUES (6, 'Flowers', 'Horticulture');
INSERT INTO products VALUES (7, 'Tea', 'Cash Crops');
INSERT INTO products VALUES (8, 'Onions', 'Vegetables');
INSERT INTO products VALUES (9, 'Bananas', 'Fruits');
INSERT INTO products VALUES (10, 'Rice', 'Cereals');
```

### Transactions
```sql
INSERT INTO transactions VALUES (1, 1, 1, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 12000);
INSERT INTO transactions VALUES (2, 3, 4, TO_DATE('2025-04-13', 'YYYY-MM-DD'), 12400);
INSERT INTO transactions VALUES (3, 5, 7, TO_DATE('2025-05-09', 'YYYY-MM-DD'), 17800);
INSERT INTO transactions VALUES (4, 8, 2, TO_DATE('2025-09-09', 'YYYY-MM-DD'), 20000);
INSERT INTO transactions VALUES (5, 9, 8, TO_DATE('2025-07-03', 'YYYY-MM-DD'), 25000);
INSERT INTO transactions VALUES (6, 5, 4, TO_DATE('2025-02-20', 'YYYY-MM-DD'), 27000);
INSERT INTO transactions VALUES (7, 1, 9, TO_DATE('2025-03-15', 'YYYY-MM-DD'), 10000);
INSERT INTO transactions VALUES (8, 4, 8, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 8000);
INSERT INTO transactions VALUES (9, 10, 1, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 8000);
INSERT INTO transactions VALUES (10, 10, 10, TO_DATE('2025-10-10', 'YYYY-MM-DD'), 100000);

COMMIT;
```

---

##  3. PL/SQL Concepts Demonstrated

GOTO STATEMENTS



###  GOTO Statement Example
```sql
SET SERVEROUTPUT ON;

DECLARE
    v_customer_id customers.customer_id%TYPE := 16;
    v_product_id  products.product_id%TYPE := 2;
    v_amount      transactions.amount%TYPE := 500.00;
BEGIN
    -- Check if customer exists
    DECLARE v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM customers WHERE customer_id = v_customer_id;
        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Customer does not exist!');
            GOTO end_process;
        END IF;
    END;

    -- Check if product exists
    DECLARE v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM products WHERE product_id = v_product_id;
        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Product does not exist!');
            GOTO end_process;
        END IF;
    END;

    -- Insert transaction
    INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount)
    VALUES (102, v_customer_id, v_product_id, SYSDATE, v_amount);
    DBMS_OUTPUT.PUT_LINE('Transaction recorded successfully.');

    <<end_process>>
    DBMS_OUTPUT.PUT_LINE('Process finished.');
END;
/
```


Explanation:

The GOTO statement jumps to the label <<end_process>> if a customer or product is missing.

It prevents unnecessary insert operations.


GOTO when all conditions work successfully

```sql
SET SERVEROUTPUT ON;

DECLARE
    v_customer_id customers.customer_id%TYPE := 1;
    v_product_id  products.product_id%TYPE := 2;
    v_amount      transactions.amount%TYPE := 10000.00;
BEGIN
    -- Check if customer exists
    DECLARE v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM customers WHERE customer_id = v_customer_id;
        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Customer does not exist!');
            GOTO end_process;
        END IF;
    END;

    -- Check if product exists
    DECLARE v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM products WHERE product_id = v_product_id;
        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Product does not exist!');
            GOTO end_process;
        END IF;
    END;

    -- Insert transaction
    INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount)
    VALUES (13, v_customer_id, v_product_id, SYSDATE, v_amount);
    DBMS_OUTPUT.PUT_LINE('Transaction recorded successfully.');

    <<end_process>>
    DBMS_OUTPUT.PUT_LINE('Process finished.');
END;
/

```

---

###  Record Example (User-Defined)
```sql
DECLARE
    TYPE customer_rec IS RECORD (
        customer_id NUMBER,
        cust_name   VARCHAR2(50),
        region      VARCHAR2(30)
    );
    my_customer customer_rec;
BEGIN
    my_customer.customer_id := 101;
    my_customer.cust_name   := 'Alice';
    my_customer.region      := 'North';

    DBMS_OUTPUT.PUT_LINE('ID: ' || my_customer.customer_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || my_customer.cust_name);
    DBMS_OUTPUT.PUT_LINE('Region: ' || my_customer.region);
END;
/
```

---

###  Record from Table (%ROWTYPE)
```sql
DECLARE
    cust_record customers%ROWTYPE;
BEGIN
    SELECT * INTO cust_record FROM customers WHERE customer_id = 1;

    DBMS_OUTPUT.PUT_LINE('Customer: ' || cust_record.cust_name);
    DBMS_OUTPUT.PUT_LINE('Region: ' || cust_record.region);
END;
/
```

---

###  Collection Example (Associative Array)
```sql
DECLARE
    TYPE amount_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    sales amount_table;
BEGIN
    sales(1) := 1000;
    sales(2) := 2000;
    sales(3) := 3000;

    DBMS_OUTPUT.PUT_LINE('Sale 1: ' || sales(1));
    DBMS_OUTPUT.PUT_LINE('Sale 2: ' || sales(2));
    DBMS_OUTPUT.PUT_LINE('Sale 3: ' || sales(3));
END;
/
```

---

###  Collection with Table Data (BULK COLLECT)
```sql
DECLARE
    TYPE cust_list IS TABLE OF customers.cust_name%TYPE;
    names cust_list;
BEGIN
    SELECT cust_name BULK COLLECT INTO names FROM customers;

    FOR i IN 1..names.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Customer: ' || names(i));
    END LOOP;
END;
/
```

---


##  Summary

| Concept | Description |
|----------|-------------|
| **GOTO** | Transfers control unconditionally to a labeled section of code |
| **RECORD** | Stores multiple related fields of different types |
| **%ROWTYPE** | Creates a record with the same structure as a table row |
| **COLLECTIONS** | Store multiple values of the same type (like arrays) |
| **BULK COLLECT** | Retrieves multiple rows into a collection efficiently |

---

##  Author
**NIYONKURU YABESI**  
  

 *Assignment Date:* 2025  
 *Topic:* PL/SQL — GOTO Statement, Records, and Collections
