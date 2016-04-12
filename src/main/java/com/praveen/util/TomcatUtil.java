package com.praveen.util;

import java.io.File;

import org.apache.catalina.LifecycleState;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;

/**
 * Tomcat util class.
 * 
 * @author Praveen
 *
 */
public class TomcatUtil {
	Tomcat tomcat = new Tomcat();
	
	/**
	 * Start tomcat server.
	 * 
	 * @param webAppDir
	 * @param port
	 * @throws Exception
	 */
	public void startServer(String webAppDir, int port) throws Exception {
		tomcat.setPort(Integer.valueOf(port));
		StandardContext ctx = (StandardContext) tomcat.addWebapp("/", new File(
				webAppDir).getAbsolutePath());
		System.out.println("configuring app with basedir: "
				+ new File("./" + webAppDir).getAbsolutePath());
		tomcat.start();
		tomcat.getServer().await();
	}
	
	/**
	 * Stop tomcat server.
	 * 
	 * @throws Exception
	 */
	public void stopServer() throws Exception {
		if (tomcat.getServer().getState() == LifecycleState.STARTED) {
			tomcat.stop();
		}
	}
}
