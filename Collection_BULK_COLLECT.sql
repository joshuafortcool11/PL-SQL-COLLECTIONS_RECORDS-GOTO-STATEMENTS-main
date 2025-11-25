###  Collection with Table Data (BULK COLLECT)

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
