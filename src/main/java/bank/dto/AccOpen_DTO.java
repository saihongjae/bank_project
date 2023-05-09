package bank.dto;

public class AccOpen_DTO {
	int dn_code;// 상품코드 code 예금인지 적금인지 + 대출 // 예적대
	String dn_accNum;// 계좌번호 accNum
	String dn_pw ; //계좌 비번
	String dn_ssn ;// 고객주민번호 ssn -- 이걸 누가 가지고 있는지 (외부키?)
	//int c_isClosed;//해지유무 isClosed
	String dn_endDate ;// 만기일 endDate (시작일 + 상품 기간)
	//int c_balance;//잔액(한도) balance
	
	
	
	



   

    

}
