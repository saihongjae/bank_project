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
VALUES (1,'입출금');
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
    dn_code NUMBER(3),
    dn_ssn VARCHAR2(13),
    dn_accNum VARCHAR2(13) PRIMARY KEY,
    dn_pw VARCHAR2(4),
    dn_balance NUMBER(20) DEFAULT 0,
    dn_requestDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    dn_startDate VARCHAR2(20),
    dn_endDate VARCHAR2(20),
    dn_isClosed NUMBER(1) DEFAULT 0,
    dn_open_situation NUMBER(1) DEFAULT 0
);

drop table customer_account_dn ;

SELECT * FROM customer_account_dn;

INSERT INTO customer_account_dn(dn_accNum)
VALUES('4084170000001');

--TO_CHAR(ADD_MONTHS(TO_CHAR(sysdate, 'YYYY-MM-DD'), 12), 'YYYY-MM-DD')
INSERT INTO customer_account_dn( dn_code, dn_ssn, dn_accNum, dn_pw)
VALUES(1, '0104171234567', '4084170000003', '1223');

INSERT INTO customer_account_dn( dn_code, dn_ssn, dn_accNum, dn_pw, dn_open_situation)
VALUES(1, '0104171234567', (SELECT TO_CHAR(MAX(TO_NUMBER(dn_accNum))+1) FROM customer_account_dn), '1123', 0);
COMMIT;

SELECT TO_CHAR(MAX(TO_NUMBER(dn_accNum))+1) FROM customer_account_dn;
                    
--SELECT bm.name, e.dn_ssn, dn_requestDate, e.dn_open_situation 
--FROM(SELECT ROWNUM rownumber, dn_ssn, dn_open_situation, dn_requestDate FROM customer_account_dn) e ,bank_member bm
--WHERE e.dn_ssn = bm.ssn;

UPDATE customer_account_dn
SET dn_open_situation = 1, dn_startdate = TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS')
WHERE dn_accnum = '4084170000009' and dn_requestdate = '2023/05/11 09:45:59';

SELECT *
FROM customer_account_dn;

SELECT bm.name, e.dn_accnum, e.dn_requestDate, pb.pb_type
FROM customer_account_dn e ,bank_member bm, bank_account_type pb
WHERE e.dn_ssn = bm.ssn AND pb.pb_type_no = e.dn_code AND e.dn_open_situation = 0;

SELECT bm.name, e.dn_ssn, e.dn_requestDate, dn_code
FROM customer_account_dn e 
JOIN bank_member bm 
ON e.dn_ssn = bm.ssn
JOIN bank_account_type pb 
ON pb.pb_type_no = e.dn_code 
WHERE e.dn_open_situation = 0;

SELECT E.Salary AS "SecondHighestSalary"
FROM (SELECT ROWNUM AS rownumber, Salary
      FROM Employee) E
WHERE E.rownumber = 2
-- 적금 대출
CREATE TABLE customer_account_sl (
    sl_code NUMBER(3) NOT NULL,
    sl_accNum VARCHAR2(13) NOT NULL,
    sl_ssn VARCHAR2(13) NOT NULL,
    sl_isClosed NUMBER(1) DEFAULT 0 NOT NULL,
    sl_startDate VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL,
    sl_endDate VARCHAR2(20) DEFAULT NULL,
    sl_balance NUMBER(20) DEFAULT NULL,
    sl_expiration NUMBER(20) NOT NULL,
    sl_monthly NUMBER(20) 
);