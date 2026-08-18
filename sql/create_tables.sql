CREATE TABLE Customers (
    c_id VARCHAR2(10) PRIMARY KEY,
    c_name VARCHAR2(40),
    c_phone VARCHAR2(15),
    c_email VARCHAR2(30),
    c_address VARCHAR2(150),
    c_type VARCHAR2(30),
    dropship VARCHAR2(30),
    agent VARCHAR2(30)
);

CREATE TABLE Staff (
    s_id VARCHAR2(10) PRIMARY KEY,
    s_name VARCHAR2(40),
    s_phone VARCHAR2(15),
    s_address VARCHAR2(150),
    s_email VARCHAR2(30),
    s_bank VARCHAR2(30),
    s_salary NUMBER(15,2)
);

CREATE TABLE Vendors (
    v_id VARCHAR2(10) PRIMARY KEY,
    v_name VARCHAR2(30),
    v_phone VARCHAR2(15),
    v_email VARCHAR2(40),
    v_address VARCHAR2(50),
    v_duedate DATE,
    v_dueamt NUMBER(15,2),
    v_type VARCHAR2(30),
    v_bank VARCHAR2(30)
);

CREATE TABLE Products (
    p_id VARCHAR2(10) PRIMARY KEY,
    p_name VARCHAR2(40),
    p_price NUMBER(15,2),
    p_category VARCHAR2(20),
    p_type VARCHAR2(30),
    p_weight NUMBER(20,2),
    p_qty NUMBER(20)
);

CREATE TABLE Orders (
    o_id VARCHAR2(10) PRIMARY KEY,
    o_ref VARCHAR2(30),
    o_date DATE,
    o_stat VARCHAR2(20),
    c_id VARCHAR2(10),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (c_id) REFERENCES Customers(c_id)
);

CREATE TABLE Inventory (
    in_id VARCHAR2(10) PRIMARY KEY,
    in_stockqty NUMBER(20),
    in_price NUMBER(15,2),
    in_date DATE,
    v_id VARCHAR2(10),
    CONSTRAINT fk_inventory_vendor
        FOREIGN KEY (v_id) REFERENCES Vendors(v_id)
);

CREATE TABLE Order_Details (
    o_id VARCHAR2(10),
    p_id VARCHAR2(10),
    order_qty NUMBER(10),
    comm_rate NUMBER,
    CONSTRAINT pk_order_details
        PRIMARY KEY (o_id, p_id),
    CONSTRAINT fk_orderdetails_order
        FOREIGN KEY (o_id) REFERENCES Orders(o_id),
    CONSTRAINT fk_orderdetails_product
        FOREIGN KEY (p_id) REFERENCES Products(p_id)
);

CREATE TABLE Inventory_Details (
    in_id VARCHAR2(10),
    p_id VARCHAR2(10),
    CONSTRAINT pk_inventory_details
        PRIMARY KEY (in_id, p_id),
    CONSTRAINT fk_inventorydetails_inventory
        FOREIGN KEY (in_id) REFERENCES Inventory(in_id),
    CONSTRAINT fk_inventorydetails_product
        FOREIGN KEY (p_id) REFERENCES Products(p_id)
);

CREATE TABLE Delivery (
    d_id VARCHAR2(10) PRIMARY KEY,
    d_date DATE,
    d_cost NUMBER(10,2),
    d_method VARCHAR2(30),
    o_id VARCHAR2(10),
    s_id VARCHAR2(10),
    CONSTRAINT fk_delivery_order
        FOREIGN KEY (o_id) REFERENCES Orders(o_id),
    CONSTRAINT fk_delivery_staff
        FOREIGN KEY (s_id) REFERENCES Staff(s_id)
);
