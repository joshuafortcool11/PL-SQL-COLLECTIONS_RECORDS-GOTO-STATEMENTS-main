###  Record Example (User-Defined)

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

