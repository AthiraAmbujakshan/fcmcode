package com.cognizant.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@ServletComponentScan
@SpringBootApplication
public class ApplicationTest extends SpringBootServletInitializer{

	public static void main(String[] args) {
		
SpringApplication.run(ApplicationTest.class, args);
	}

}
