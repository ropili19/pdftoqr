package com.pdftoqr.pdftoqr.model;


public class UploadFileResponse {
    public UploadFileResponse() {
		super();
	}

	private String fileName;
    private String fileDownloadUri;

    public UploadFileResponse(String fileName, String fileDownloadUri, String fileType, long size) {
        this.setFileName(fileName);
        this.setFileDownloadUri(fileDownloadUri);
    }

	@Override
	public String toString() {
		return "UploadFileResponse [fileName=" + fileName + ", fileDownloadUri=" + fileDownloadUri + "]";
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileDownloadUri() {
		return fileDownloadUri;
	}

	public void setFileDownloadUri(String fileDownloadUri) {
		this.fileDownloadUri = fileDownloadUri;
	}



}