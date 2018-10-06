package com.pdftoqr.pdftoqr;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;

import com.pdftoqr.config.PDFuploadProperties;



@SpringBootApplication
@EnableConfigurationProperties({
	PDFuploadProperties.class
})
@ComponentScan("com.pdftoqr")

public class PdftoqrApplication {

	public static void main(String[] args) {
		SpringApplication.run(PdftoqrApplication.class, args);
	}
}
