package bank.dto;

public class AccOpen_DTO {
	String name;
	int dn_code;// 상품코드 code 예금인지 적금인지 + 대출 // 예적대
	String dn_accNum;// 계좌번호 accNum
	String dn_pw ; //계좌 비번
	String dn_ssn ;// 고객주민번호 ssn -- 이걸 누가 가지고 있는지 (외부키?)
	//int c_isClosed;//해지유무 isClosed
	String dn_endDate ;// 만기일 endDate (시작일 + 상품 기간)
	//int c_balance;//잔액(한도) balance
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDn_code() {
		return dn_code;
	}
	public void setDn_code(int dn_code) {
		this.dn_code = dn_code;
	}
	public String getDn_accNum() {
		return dn_accNum;
	}
	public void setDn_accNum(String dn_accNum) {
		this.dn_accNum = dn_accNum;
	}
	public String getDn_pw() {
		return dn_pw;
	}
	public void setDn_pw(String dn_pw) {
		this.dn_pw = dn_pw;
	}
	public String getDn_ssn() {
		return dn_ssn;
	}
	public void setDn_ssn(String dn_ssn) {
		this.dn_ssn = dn_ssn;
	}
	public String getDn_endDate() {
		return dn_endDate;
	}
	public void setDn_endDate(String dn_endDate) {
		this.dn_endDate = dn_endDate;
	}
	
	
	
	



   

    

}
