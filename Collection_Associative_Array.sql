###  Collection Example (Associative Array)

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
