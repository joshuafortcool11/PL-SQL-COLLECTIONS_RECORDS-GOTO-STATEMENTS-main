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
