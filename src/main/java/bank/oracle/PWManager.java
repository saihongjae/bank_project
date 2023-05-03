package bank.oracle;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class PWManager {
	
	public static String encryption(String pw) {
		//알고리즘
		String alg = "AES/CBC/PKCS5Padding";
		
		//키
		String aesKey = "abcdefghabcdefghabcdefghabcdefgh"; //32byte

		String aesIv = "0123456789abcdef"; //16byte
		
		//암호화된 유저 비밀번호
		String encPw="";
		
		try {
			Cipher cipher = Cipher.getInstance(alg);
			//키로 비밀키 생성
			SecretKeySpec keySpec = new SecretKeySpec(aesKey.getBytes(), "AES");
			
			//iv 로 spec 생성
			IvParameterSpec ivParamSpec = new IvParameterSpec(aesIv.getBytes());
			
			//암호화 적용
			cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);
			byte[] encrypted1 = cipher.doFinal(pw.getBytes("UTF-8")); // ID 암호화(인코딩 설정)
			encPw = Base64.getEncoder().encodeToString(encrypted1); // 암호화 인코딩 후 저장
		} catch (Exception e) {
			System.out.println("암호화 중 오류 발생 ");
			e.printStackTrace();
		}
		
		
		return encPw;
	}
}
