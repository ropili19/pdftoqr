package com.pdftoqr.pdftoqr.exceptions;

public class FileConversException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public FileConversException(String message) {
		super(message);
	}

	public FileConversException(String message, Throwable cause) {
		super(message, cause);
	}
}
