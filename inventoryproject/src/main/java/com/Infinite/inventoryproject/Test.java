package com.Infinite.inventoryproject;

import java.io.IOException;
import java.text.ParseException;

public class Test {
	public static void main(String[] args) {
		
			try {
				System.out.println(new CustomerDAO().forgetPassword("Raj@1233654312345", "12345"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}
}
