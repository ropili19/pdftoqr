package com.pdftoqr.config;

import org.springframework.boot.context.properties.ConfigurationProperties;



@ConfigurationProperties(prefix = "file")
public class PDFuploadProperties {
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
     
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
    
}