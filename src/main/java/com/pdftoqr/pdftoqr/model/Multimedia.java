package com.pdftoqr.pdftoqr.model;

import java.awt.image.BufferedImage;

public class Multimedia {
	 private String id  ;
	 private String namePdf;
	 private String urlVideo;
	 private String nameVideo;
	 private int page;

	public Multimedia(String id, String namePdf, String urlVideo, String nameVideo, int page) {
		super();
		this.id = id;
		this.namePdf = namePdf;
		this.urlVideo = urlVideo;
		this.nameVideo = nameVideo;
		this.page = page;
	}
	public Multimedia() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNamePdf() {
		return namePdf ;
	}
	public void setNamePdf(String namePdf) {
		this.namePdf = namePdf;
	}
	
	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}
	public String getUrlVideo() {
		return urlVideo;
	}
	public String getNameVideo() {
		return nameVideo;
	}
	public void setNameVideo(String nameVideo) {
		this.nameVideo = nameVideo;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	 @Override
	public String toString() {
		return "Multimedia [id=" + id + ", namePdf=" + namePdf + ", urlVideo=" + urlVideo + ", nameVideo=" + nameVideo
				+ ", page=" + page + "]";
	}
}
