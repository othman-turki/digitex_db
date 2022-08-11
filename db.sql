--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- INITIALISATION
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE operators(
    id INT NOT NULL AUTO_INCREMENT,
    rfid VARCHAR(255) UNIQUE DEFAULT NULL,
    reg_num VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE monitors(
    id INT NOT NULL AUTO_INCREMENT,
    reg_num VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE maintainers(
    id INT NOT NULL AUTO_INCREMENT,
    reg_num VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE machines(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    ref VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE prod_lines(
    id INT NOT NULL AUTO_INCREMENT,
    prod_line VARCHAR(255) NOT NULL,
    operator_reg_num VARCHAR(255) NOT NULL,
    monitor_reg_num VARCHAR(255) NOT NULL,
    machine_id INT DEFAULT NULL,
    digitex VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num),
    FOREIGN KEY (monitor_reg_num) REFERENCES monitors(reg_num),
    FOREIGN KEY (machine_id) REFERENCES machines(id)
);


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- PRODUCTION
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE fab_orders(
    id INT NOT NULL AUTO_INCREMENT,
    fab_order VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    client VARCHAR(255) NOT NULL,
    prod_line VARCHAR(255) NOT NULL,
    quantity VARCHAR(255) NOT NULL,
    fo_status VARCHAR(255) NOT NULL DEFAULT 'START',
    start_date VARCHAR(255) NOT NULL,
    end_date VARCHAR(255) NOT NULL DEFAULT '',
    dt_import DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE packets(
    id INT NOT NULL AUTO_INCREMENT,
    rfid VARCHAR(255) UNIQUE DEFAULT NULL,
    pack_num VARCHAR(255) UNIQUE NOT NULL,
    start_date VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    size VARCHAR(255) NOT NULL,
    quantity VARCHAR(255) NOT NULL,
    fab_order_id INT NOT NULL,  -- model, client, prod_line FROM fab_orders
    dt_import DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY (fab_order_id) REFERENCES fab_orders(id) ON DELETE CASCADE
);

-- SELECT 
--     T2.rfid, T2.pack_num, T2.start_date, T2.color, T2.size, T2.quantity, T1.model, T1.client, T1.prod_line, T2.dt_import
-- FROM fab_orders AS T1
-- INNER JOIN packets AS T2
-- ON
--     T1.id = T2.fab_order_id;

CREATE TABLE gamut(
    id INT NOT NULL AUTO_INCREMENT,
    fab_order_id INT NOT NULL,
    pack_num VARCHAR(255) NOT NULL,
    operation_code VARCHAR(255) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    unit_time VARCHAR(255) NOT NULL,
    qte_h VARCHAR(255) NOT NULL,
    machine_name VARCHAR(255) DEFAULT NULL,
    machine_ref VARCHAR(255) DEFAULT NULL,
    digitex VARCHAR(255) DEFAULT NULL,
    dt_import DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY (fab_order_id) REFERENCES fab_orders(id) ON DELETE CASCADE,
    FOREIGN KEY (pack_num) REFERENCES packets(pack_num)
);


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- DIGITEX
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

