package com.bookstore.util;

import java.util.Properties;

public class QueryUtil {

	private static Properties prop = new Properties();
	static {
		try {
			//특정 클래스와 똑같은 폴더에 있는 파일을 읽을때 사용한다.
			prop.load(Class.forName("com.bookstore.util.QueryUtil").getResourceAsStream("query.properties"));
		} catch (Exception e){
			throw new RuntimeException(e);
		}
	}
	
	public static String getSQL(String name) {
		return prop.getProperty(name);
	}
}
