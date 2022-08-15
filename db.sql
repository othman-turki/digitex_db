-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
--                            INITIALISATION
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE operators(
    id INT NOT NULL AUTO_INCREMENT,
    card_id VARCHAR(20) UNIQUE DEFAULT NULL,
    reg_num VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE monitors(
    id INT NOT NULL AUTO_INCREMENT,
    reg_num VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE maintainers(
    id INT NOT NULL AUTO_INCREMENT,
    reg_num VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE machines(
    id INT NOT NULL AUTO_INCREMENT,
    ref VARCHAR(40) UNIQUE NOT NULL,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE prod_lines(
    id INT NOT NULL AUTO_INCREMENT,
    prod_line VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    monitor_reg_num VARCHAR(20) NOT NULL,
    machine_ref VARCHAR(40) NOT NULL DEFAULT '',
    digitex VARCHAR(40) NOT NULL DEFAULT '',
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num),
    FOREIGN KEY (monitor_reg_num) REFERENCES monitors(reg_num),
    FOREIGN KEY (machine_ref) REFERENCES machines(ref)
);


-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
--                              PRODUCTION
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE fab_orders(
    id INT NOT NULL AUTO_INCREMENT,
    number VARCHAR(80) UNIQUE NOT NULL,
    model VARCHAR(80) NOT NULL,
    client VARCHAR(80) NOT NULL,
    prod_line VARCHAR(40) NOT NULL,
    quantity VARCHAR(40) NOT NULL,
    fo_status VARCHAR(40) NOT NULL DEFAULT 'START',
    start_date VARCHAR(40) NOT NULL,
    end_date VARCHAR(40) NOT NULL DEFAULT '',
    import_date DATE DEFAULT CURDATE(),
    import_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id)
);

CREATE TABLE packets(
    id INT NOT NULL AUTO_INCREMENT,
    tag_id VARCHAR(20) UNIQUE DEFAULT NULL,
    pack_num VARCHAR(40) UNIQUE NOT NULL,
    start_date VARCHAR(40) NOT NULL,
    color VARCHAR(40) NOT NULL,
    size VARCHAR(40) NOT NULL,
    quantity VARCHAR(40) NOT NULL,
    fab_order_number VARCHAR(80) NOT NULL,
    import_date DATE DEFAULT CURDATE(),
    import_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (fab_order_number) REFERENCES fab_orders(number) ON DELETE CASCADE
);

-- SELECT 
--     tbl_2.tag_id, tbl_2.pack_num, tbl_2.start_date, tbl_2.color, tbl_2.size, tbl_2.quantity, tbl_1.model, tbl_1.client, tbl_1.prod_line
-- FROM fab_orders AS tbl_1
-- INNER JOIN packets AS tbl_2
-- ON
--     tbl_1.id = tbl_2.fab_order_id;

CREATE TABLE gamuts(
    id INT NOT NULL AUTO_INCREMENT,
    fab_order_number VARCHAR(80) NOT NULL,
    operation_code VARCHAR(40) NOT NULL,
    designation VARCHAR(80) NOT NULL,
    unit_time VARCHAR(40) NOT NULL,
    qte_h VARCHAR(40) NOT NULL,
    import_date DATE DEFAULT CURDATE(),
    import_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (fab_order_number) REFERENCES fab_orders(number) ON DELETE CASCADE
);

CREATE TABLE pack_gamuts(
    id INT NOT NULL AUTO_INCREMENT,
    fab_order_number VARCHAR(80) NOT NULL,
    pack_num VARCHAR(40) NOT NULL,
    operation_code VARCHAR(40) NOT NULL,
    designation VARCHAR(80) NOT NULL,
    unit_time VARCHAR(40) NOT NULL,
    qte_h VARCHAR(40) NOT NULL,
    op_status BOOLEAN NOT NULL DEFAULT 0,
    machine_ref VARCHAR(40) NOT NULL DEFAULT '',
    digitex VARCHAR(40) NOT NULL DEFAULT '',
    import_date DATE DEFAULT CURDATE(),
    import_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (fab_order_number) REFERENCES fab_orders(number) ON DELETE CASCADE,
    FOREIGN KEY (pack_num) REFERENCES packets(pack_num),
    FOREIGN KEY (machine_ref) REFERENCES machines(ref)
);


-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
--                                DIGITEX
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE pack_operations(
    id INT NOT NULL AUTO_INCREMENT,
    pack_num VARCHAR(40) NOT NULL,
    operation_code VARCHAR(40) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    unit_time VARCHAR(40) NOT NULL,
    pack_qte VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    machine_ref VARCHAR(40) NOT NULL,
    digitex VARCHAR(40) NOT NULL,
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num)
);

CREATE TABLE presences(
    id INT NOT NULL AUTO_INCREMENT,
    digitex VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    p_status VARCHAR(40) NOT NULL,
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num),
    CHECK (p_status IN ('in', 'out'))
);

CREATE TABLE downtimes(
    id INT NOT NULL AUTO_INCREMENT,
    digitex VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    downtime VARCHAR(40) NOT NULL,
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num)
);

CREATE TABLE op_performances(
    id INT NOT NULL AUTO_INCREMENT,
    operator_reg_num VARCHAR(20) NOT NULL,
    production_time VARCHAR(40) NOT NULL,
    presence_time VARCHAR(40) NOT NULL,
    downtime VARCHAR(40) NOT NULL,
    performance VARCHAR(40) NOT NULL,
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num)
);

CREATE TABLE prod_performances(
    id INT NOT NULL AUTO_INCREMENT,
    prod_line VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    performance VARCHAR(40) NOT NULL,
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num)
);

CREATE TABLE notifications(
    id INT NOT NULL AUTO_INCREMENT,
    prod_line VARCHAR(40) NOT NULL,
    digitex VARCHAR(40) NOT NULL,
    operator_reg_num VARCHAR(20) NOT NULL,
    monitor_reg_num VARCHAR(20) NOT NULL,
    call_monitor VARCHAR(40) NOT NULL DEFAULT '',
    instant_call_monitor VARCHAR(40) NOT NULL DEFAULT '',
    monitor_arrival_time VARCHAR(40) NOT NULL DEFAULT '',
    call_maintainer VARCHAR(40) NOT NULL DEFAULT '',
    instant_call_maintainer VARCHAR(40) NOT NULL DEFAULT '',
    maintainer_arrival_time VARCHAR(40) NOT NULL DEFAULT '',
    PRIMARY KEY(id),
    FOREIGN KEY (operator_reg_num) REFERENCES operators(reg_num),
    FOREIGN KEY (monitor_reg_num) REFERENCES monitors(reg_num)
);

CREATE TABLE interventions(
    id INT NOT NULL AUTO_INCREMENT,
    maintainer_reg_num VARCHAR(20) NOT NULL,
    duration VARCHAR(40) NOT NULL DEFAULT '',
    failure_type VARCHAR(40) NOT NULL DEFAULT '',
    machine_ref VARCHAR(40) NOT NULL DEFAULT '',
    spare_part VARCHAR(40) NOT NULL DEFAULT '',
    cur_date DATE DEFAULT CURDATE(),
    cur_time TIME DEFAULT CURTIME(),  -- DUPLICATION: check with Hela
    PRIMARY KEY(id),
    FOREIGN KEY (maintainer_reg_num) REFERENCES maintainers(reg_num),
    FOREIGN KEY (machine_ref) REFERENCES machines(ref)
);

CREATE TABLE tags(
    id INT NOT NULL AUTO_INCREMENT,
    tag_sort VARCHAR(40) NOT NULL DEFAULT '',
    tag_exp VARCHAR(40) NOT NULL DEFAULT '',
    tag_operator VARCHAR(40) NOT NULL DEFAULT '',
    PRIMARY KEY(id)
);