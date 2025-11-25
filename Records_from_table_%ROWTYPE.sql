###  Record from Table (%ROWTYPE)

DECLARE
    cust_record customers%ROWTYPE;
BEGIN
    SELECT * INTO cust_record FROM customers WHERE customer_id = 1;

    DBMS_OUTPUT.PUT_LINE('Customer: ' || cust_record.cust_name);
    DBMS_OUTPUT.PUT_LINE('Region: ' || cust_record.region);
END;
/
