--------------------------------------------------------------
CREATE TABLE bank_member (
    name VARCHAR2(20) NOT NULL,
    ssn VARCHAR2(13) PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    pw VARCHAR2(30) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD') NOT NULL
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
    bno NUMBER(2) NOT NULL,
    id VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    question_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS'),
    answer VARCHAR2(1000) DEFAULT null,
    answer_date VARCHAR2(20) DEFAULT null
);

SELECT * FROM bank_board ;
drop table bank_board;

--------------------------------
--상품명 p_name
--상품코드 p_code
--기간 p_term (12, 24, 36)
--이율 p_rate

CREATE TABLE product_list (
    p_name VARCHAR2(50) PRIMARY KEY, 
    p_code NUMBER(3) NOT NULL,
    p_rate NUMBER(3, 2) NOT NULL
);

drop table product_list;

INSERT INTO product_list VALUES('삼조 S드림 정기예금', 2, 2.90);
INSERT INTO product_list VALUES('삼조뱅크 자유적금', 3, 3.80);
INSERT INTO product_list VALUES('삼편한 직장인대출S', 4, 3.59);


-- 상품코드 code -- 예금인지 적금인지 + 대출 / 예적대
-- 고객주민번호 ssn -- 이걸 누가 가지고 있는지 (외부키?)
-- 계좌번호 accNum
-- 해지유무 isClosed
-- 시작일 startDate
-- 만기일 endDate (시작일 + 상품 기간)
-- 잔액(한도) balance
-- 월적금액 monthly

-- 일반 입출금
-- (1, '2348293748234234', '1234', '8402921238221')
-- 일반 1
-- 예금 2
-- 적금 3
-- 대출 4
-- 일반통장 공통
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
drop table account_common;

--예금 적금 대출
CREATE TABLE customer_account_dsl (
    dsl_accNum VARCHAR2(13) PRIMARY KEY,
    dsl_monthly NUMBER(20) DEFAULT NULL,
    dsl_term NUMBER(2) NOT NULL,
    dsl_regularDate NUMBER(2) DEFAULT NULL
);

SELECT * FROM customer_account_dsl;
DROP TABLE customer_account_dsl;

SELECT bm.name, e.ac_accNum, e.ac_requestDate, pb.pb_type FROM account_common e ,bank_member bm, bank_account_type pb
WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 1;

SELECT e.ac_accNum, e.ac_balance, e.ac_startDate, e.ac_endDate, pb.pb_type, ca.dsl_term, ca.dsl_monthly
FROM account_common e, bank_member bm, bank_account_type pb, customer_account_dsl ca
WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 1
AND bm.id = 'happyjh' AND ca.dsl_accnum = e.ac_accNum;