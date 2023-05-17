DROP TABLE bank_member;

CREATE TABLE bank_member (
    name VARCHAR2(20) NOT NULL,
    ssn VARCHAR2(13) PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    pw VARCHAR2(30) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD') NOT NULL
);

DROP TABLE bank_account_type;

CREATE TABLE bank_account_type (
    pb_type_no NUMBER(3) NOT NULL,
    pb_type VARCHAR2(20) NOT NULL
);

INSERT INTO bank_account_type 
VALUES (1,'입출금');
INSERT INTO bank_account_type
VALUES (2,'예금');
INSERT INTO bank_account_type 
VALUES (3,'적금');
INSERT INTO bank_account_type 
VALUES (4,'대출');

DROP TABLE bank_account;

CREATE TABLE bank_account (
    ssn VARCHAR2(13) NOT NULL,
    account_num VARCHAR2(13) PRIMARY KEY,
    pw NUMBER(4) NOT NULL,
    balance NUMBER(20) NOT NULL,
    account_type NUMBER(3) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL
);

DROP TABLE bank_manager;

CREATE TABLE bank_manager (
    m_name VARCHAR(10) NOT NULL,
    m_id VARCHAR2(20) PRIMARY KEY,
    m_pw VARCHAR2(20) NOT NULL
);

INSERT INTO bank_manager 
VALUES ('사이홍','kingsaihong', '8507');

DROP TABLE bank_board;

CREATE TABLE bank_board (
    bno NUMBER(2) NOT NULL,
    id VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    question_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS'),
    answer VARCHAR2(1000) DEFAULT null,
    answer_date VARCHAR2(20) DEFAULT null
);

DROP TABLE product_list;

CREATE TABLE product_list (
    p_name VARCHAR2(50) PRIMARY KEY, 
    p_code NUMBER(3) NOT NULL,
    p_rate NUMBER(2, 2) NOT NULL
);

DROP TABLE account_common;

CREATE TABLE account_common (
    ac_code NUMBER(3) NOT NULL,
    ac_accNum VARCHAR2(13) PRIMARY KEY,
    ac_pw VARCHAR2(4) NOT NULL,
    ac_ssn VARCHAR2(13) NOT NULL,
    ac_isClosed NUMBER(1) DEFAULT 0 NOT NULL,
    ac_requestDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    ac_open_situation NUMBER(1) DEFAULT 0,
    ac_startDate VARCHAR2(20) DEFAULT NULL,
    ac_balance NUMBER(20) DEFAULT 0 NOT NULL,
    ac_endDate VARCHAR2(20) DEFAULT NULL
);

DROP TABLE customer_account_dsl;

CREATE TABLE customer_account_dsl (
    dsl_accNum VARCHAR2(13) PRIMARY KEY,
    dsl_monthly NUMBER(20) DEFAULT NULL,
    dsl_term NUMBER(2) NOT NULL,
    dsl_regularDate NUMBER(2) DEFAULT NULL
);

SELECT * FROM account_common;

