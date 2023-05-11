package bank.dto;

public class AccOpenManagementDTO {
	
	String name;
	String dn_accnum;
	String requestDate;
	String accType;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccnum() {
		return dn_accnum;
	}
	public void setAccnum(String dn_accnum) {
		this.dn_accnum = dn_accnum;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getAccType() {
		return accType;
	}
	public void setAccType(String accType) {
		this.accType = accType;
	}
	

	
	
}
