package com.pdftoqr.pdftoqr;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.SpringVersion;

import com.pdftoqr.config.PDFuploadProperties;



@SpringBootApplication
@EnableConfigurationProperties({
	PDFuploadProperties.class
})
@ComponentScan("com.pdftoqr")

public class PdftoqrApplication {

	public static void main(String[] args) {
		  System.out.println("version: " + SpringVersion.getVersion());
		SpringApplication.run(PdftoqrApplication.class, args);
	}
}
