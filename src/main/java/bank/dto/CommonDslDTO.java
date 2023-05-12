package bank.dto;

public class CommonDslDTO {
	 String code;
	 String monthly;
	 String term;
	 String regularDate;
	 
	 public String getMonthly() {
		return monthly;
	}
	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getRegularDate() {
		return regularDate;
	}
	public void setRegularDate(String regularDate) {
		this.regularDate = regularDate;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

}
