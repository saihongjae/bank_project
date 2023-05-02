CREATE TABLE bank_member (
    name VARCHAR2(20) NOT NULL,
    ssn VARCHAR2(13) PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    pw VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    reg_date VARCHAR2(20) DEFAULT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOT NULL
);
 
CREATE TABLE bank_account (
    ssn NUMBER(13) NOT NULL,
    account_num NUMBER(13) PRIMARY KEY,
    pw NUMBER(4) NOT NULL,
    pb_type VARCHAR2(20) NOT NULL,
    balance NUMBER(20) NOT NULL,
    reg_date date NOT NULL
);

CREATE TABLE bank_manager (
    m_name VARCHAR(10) NOT NULL,
    m_id VARCHAR2(20) PRIMARY KEY,
    m_pw VARCHAR2(20) NOT NULL
);

CREATE TABLE bank_loan (
    branch_name VARCHAR2(20) NOT NULL,
    loan_number VARCHAR2(20) PRIMARY KEY,
    loan_cost NUMBER(20) NOT NULL
);

CREATE TABLE bank_board (
    reg_date date NOT NULL,
    id VARCHAR2(20) PRIMARY KEY,
    title VARCHAR2(60) NOT NULL,
    contents VARCHAR2(1000) NOT NULL
);

drop table bank_member;
SELECT * FROM bank_member;
INSERT INTO bank_member(name, ssn, id, pw, email, phone) VALUES ('이홍재', '0104171234567', 'saihong', '12345', 'ghdwo901088@gmail.com', '01030598507');