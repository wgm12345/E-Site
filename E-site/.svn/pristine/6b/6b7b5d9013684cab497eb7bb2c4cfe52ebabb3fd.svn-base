/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wy.tools;

import java.security.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author Administrator
 */
public class Encrypt
    {
	
	public static String encodeMD5(String str)
	    {
		return encode(str, "MD5");
	    }
	
	public static boolean checkEmail(String email){
	    return checkemail(email);
	    
	}
	
	
	
	private static String encode(String str, String algorithm)
	    {
		if (str == null)
		    {
			return null;
		    }
		StringBuilder sb = new StringBuilder();
		try
		    {
			MessageDigest code = MessageDigest
				.getInstance(algorithm);
			code.update(str.getBytes());
			byte[] bs = code.digest();
			for (int i = 0; i < bs.length; i++)
			    {
				int v = bs[i] & 0xFF;
				if (v < 16)
				    {
					sb.append(0);
				    }
				sb.append(Integer.toHexString(v));
			    }
		    } catch (NoSuchAlgorithmException e)
		    {
			e.printStackTrace();
		    }
		return sb.toString().toUpperCase();
	    }
	
	private static boolean checkemail(String email)
	    {
		String regex="[a-zA-Z][\\w_]+@\\w+(\\.\\w+)+";
		Pattern p=Pattern.compile(regex);
		Matcher m=p.matcher(email);
		return m.matches();
	    }
	
	
	
	

	
    }
