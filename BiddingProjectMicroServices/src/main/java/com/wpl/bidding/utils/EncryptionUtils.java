/**
 * 
 */
package com.wpl.bidding.utils;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.keygen.KeyGenerators;
/**
 * @author Manisha
 *
 */
public class EncryptionUtils {
    static String key = "AES";
	public static String decryptString(String input)
	{
		TextEncryptor encryptor = Encryptors.text(input, key);
		String encryptedString = encryptor.encrypt(input);
		return encryptedString;
	}
	
	public static String encryptString(String input)
	{
		  TextEncryptor decryptor = Encryptors.text(input, key);
		  String decryptedText = decryptor.decrypt(input);
		  return decryptedText;
	}

}
