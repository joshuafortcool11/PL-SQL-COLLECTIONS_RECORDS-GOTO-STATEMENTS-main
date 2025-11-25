###  2. Insert Sample Data

### Customers

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


### Products

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


### Transactions

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


