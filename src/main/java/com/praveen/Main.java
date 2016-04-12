package com.praveen;

import com.praveen.util.TomcatUtil;

/**
 * Main class to start tomcat.
 * 
 * @author Praveen
 *
 */
public class Main {
	public static void main(String[] args) throws Exception {
		String webAppDir = "src/main/webapp/";
		String webPort = System.getenv("PORT");
		if (webPort == null || webPort.isEmpty()) {
			webPort = "8080";
		}

		TomcatUtil tomcatUtil = new TomcatUtil();
		tomcatUtil.startServer(webAppDir, Integer.valueOf(webPort));
	}
}
