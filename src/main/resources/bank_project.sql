--------------------------------------------------------------
CREATE TABLE bank_member (
    name VARCHAR2(20) NOT NULL,
    ssn VARCHAR2(13) PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    pw VARCHAR2(30) NOT NULL,
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
VALUES (1,'기본');
INSERT INTO bank_account_type
VALUES (2,'예금');
INSERT INTO bank_account_type 
VALUES (3,'적금');
INSERT INTO bank_account_type 
VALUES (4,'대출');
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
VALUES (?, (SELECT TO_CHAR(MAX(TO_NUMBER(account_num))+1) FROM bank_account), ?, 0, 1);

SELECT TO_CHAR(MAX(account_num)+1) FROM bank_account;

SELECT MAX(account_num)+1 FROM bank_account;
                    
INSERT INTO bank_account(ssn, account_num, pw, balance, account_type) 
VALUES ('0104171234567','4084170000001', '1234', 5000000, 1);

INSERT INTO bank_account(ssn, account_num, pw, balance, account_type) 
VALUES ('0104171234567', (SELECT MAX(account_num)+1 FROM bank_account), '1234', 0, 1);
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
    idx NUMBER NOT NULL PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    regdate VARCHAR2(20) NOT NULL, --DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    count NUMBER NOT NULL,
    content CLOB NOT NULL
);
drop table bank_board;
SELECT * FROM bank_board;

INSERT INTO bank_board (idx, title, writer, regdate, count, content)
VALUES (1,'글제목', '글쓴이','230511',0,'글 내용');

CREATE SEQUENCE board_seq
        INCREMENT BY 1
        START WITH 1
        MINVALUE 1
        MAXVALUE 9999
        NOCYCLE
        NOCACHE
        NOORDER;
-------------------(봉인)------------------------------
--CREATE TABLE bank_loan (
--    branch_name VARCHAR2(20) NOT NULL,
--    loan_number VARCHAR2(20) PRIMARY KEY,
--   loan_cost NUMBER(20) NOT NULL
--);
--------------------------------
--상품명 p_name
--상품코드 p_code
--기간 p_term (12, 24, 36)
--이율 p_rate

CREATE TABLE product_list (
    p_name VARCHAR2(50) PRIMARY KEY, 
    p_code NUMBER(3) NOT NULL,
    p_term NUMBER(2) NOT NULL,
    p_rate NUMBER(2, 2) NOT NULL
);



-- 상품코드 code -- 예금인지 적금인지 + 대출 / 예적대
-- 고객주민번호 ssn -- 이걸 누가 가지고 있는지 (외부키?)
-- 계좌번호 accNum
-- 해지유무 isClosed
-- 시작일 startDate
-- 만기일 endDate (시작일 + 상품 기간)
-- 잔액(한도) balance
-- 만기금액 expiration
-- 월적금액 monthly

-- 일반통장 예금
CREATE TABLE customer_account_dn (
    c_code NUMBER(3) NOT NULL,
    c_accNum VARCHAR2(13) NOT NULL,
    c_pw VARCHAR2(4) NOT NULL,
    c_ssn VARCHAR2(13) NOT NULL,
    c_isClosed boolean DEFAULT false NOT NULL,
    c_startDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    c_endDate VARCHAR2(20),
    c_balance NUMBER(20) NOT NULL,
    c_expiration NUMBER(20) NOT NULL,
    c_monthly NUMBER(20) 
);

-- 적금 대출
CREATE TABLE customer_account_sl (
    c_code NUMBER(3) NOT NULL,
    c_accNum VARCHAR2(13) NOT NULL,
    c_ssn VARCHAR2(13) NOT NULL,
    c_isClosed boolean DEFAULT false NOT NULL,
    c_startDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    c_endDate VARCHAR2(20),
    c_balance NUMBER(20) NOT NULL,
    c_expiration NUMBER(20) NOT NULL,
    c_monthly NUMBER(20) 
);

