package bank_project_java;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		bank_Dao bank_Dao = new bank_Dao();
		bank_Dto bank_Dto = new bank_Dto();
		System.out.println(bank_Dao.BankManagerLoginCheck("king_saihong", "1234"));
	}

}
