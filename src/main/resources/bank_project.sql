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

-----------------------------------------

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

-----------------------------------------

DROP TABLE bank_manager;

CREATE TABLE bank_manager (
    m_name VARCHAR(10) NOT NULL,
    m_id VARCHAR2(20) PRIMARY KEY,
    m_pw VARCHAR2(20) NOT NULL
);

INSERT INTO bank_manager 
VALUES ('사이홍','kingsaihong', '8507');

-----------------------------------------

drop table bank_board;

CREATE TABLE bank_board (
    bno NUMBER(2) NOT NULL,
    id VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    question_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS'),
    answer VARCHAR2(1000) DEFAULT null,
    answer_date VARCHAR2(20) DEFAULT null
);

--------------------------------
--상품명 p_name
--상품코드 p_code
--기간 p_term (12, 24, 36)
--이율 p_rate

-----------------------------------------

drop table product_list;

CREATE TABLE product_list (
    p_name VARCHAR2(50) PRIMARY KEY, 
    p_code NUMBER(3) NOT NULL,
    p_rate NUMBER(3, 2) NOT NULL
);

INSERT INTO product_list VALUES('삼조 S드림 정기예금', 2, 2.90);
INSERT INTO product_list VALUES('삼조뱅크 자유적금', 3, 3.80);
INSERT INTO product_list VALUES('삼편한 직장인대출S', 4, 3.59);

-----------------------------------------
DROP TABLE account_common;

CREATE TABLE account_common (
    ac_code NUMBER(3) NOT NULL,
    ac_accNum VARCHAR2(13) PRIMARY KEY,
    ac_pw VARCHAR2(4) NOT NULL,
    ac_ssn VARCHAR2(13) NOT NULL,
    ac_isClosed NUMBER(1) DEFAULT 0 NOT NULL,
    ac_requestDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    ac_startDate VARCHAR2(20) DEFAULT NULL, 
    ac_endDate VARCHAR2(20) DEFAULT NULL,
    ac_balance NUMBER(20) DEFAULT 0,
    ac_open_situation NUMBER(1) DEFAULT 0
);

SELECT * FROM account_common;

-----------------------------------------

DROP TABLE customer_account_dsl;

CREATE TABLE customer_account_dsl (
    dsl_accNum VARCHAR2(13) PRIMARY KEY,
    dsl_monthly NUMBER(20) DEFAULT NULL,
    dsl_term NUMBER(2) NOT NULL,
    dsl_regularDate NUMBER(2) DEFAULT NULL
);




