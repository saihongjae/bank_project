--------------------------------------------------------------
CREATE TABLE bank_member (
    name VARCHAR2(20) NOT NULL,
    ssn VARCHAR2(13) PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    pw VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL
);

drop table bank_member;
SELECT * FROM bank_member;

INSERT INTO bank_member(name, ssn, id, pw, email, phone)
VALUES ('이홍재', '0104171234567', 'saihong', '12345', 'ghdwo901088@gmail.com', '01030598507');
--------------------------------------------------------------
CREATE TABLE bank_account_type (
    pb_type_no NUMBER(3) NOT NULL,
    pb_type VARCHAR2(20) NOT NULL
);

drop table bank_account_type;
SELECT * FROM bank_account_type;

INSERT INTO bank_account_type 
VALUES (1,'대출');
INSERT INTO bank_account_type
VALUES (2,'예금');
INSERT INTO bank_account_type 
VALUES (3,'적금');
-----------------------------------------------------------------
CREATE TABLE bank_account (
    ssn VARCHAR2(13) NOT NULL,
    account_num VARCHAR2(13) PRIMARY KEY,
    pw NUMBER(4) NOT NULL,
    balance NUMBER(20) NOT NULL,
    account_type NUMBER(3) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL
);

drop table bank_account;
SELECT * FROM bank_account;
INSERT INTO bank_account(ssn, account_num, pw, balance, account_type) 
VALUES ('0104171234567', '3021234567881', '1234', 100000, 1);
----------------------------------------------------------------
CREATE TABLE bank_manager (
    m_name VARCHAR(10) NOT NULL,
    m_id VARCHAR2(20) PRIMARY KEY,
    m_pw VARCHAR2(20) NOT NULL
);

drop table bank_manager;
SELECT * FROM bank_manager;

INSERT INTO bank_manager
VALUES ('이홍재', 'king_saihong', '1234');
----------------------------------------------
CREATE TABLE bank_board (
    id VARCHAR2(20) PRIMARY KEY,
    title VARCHAR2(60) NOT NULL,
    contents VARCHAR2(1000) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL
);

drop table bank_board;
SELECT * FROM bank_board;

INSERT INTO bank_board(id, title, contents)
VALUES ('saihong', '제목', '내용');
-------------------(봉인)------------------------------
--CREATE TABLE bank_loan (
--    branch_name VARCHAR2(20) NOT NULL,
--    loan_number VARCHAR2(20) PRIMARY KEY,
--   loan_cost NUMBER(20) NOT NULL
--);
--------------------------------
select * from bank_manager
WHERE m_id = 'king_saihong' and m_pw = '12345';