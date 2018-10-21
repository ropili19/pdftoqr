package com.pdftoqr.config.utils;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import org.apache.pdfbox.pdmodel.interactive.action.PDAction;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionGoTo;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import com.pdftoqr.pdftoqr.model.Multimedia;

public class Utils {


	public Utils() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JSONArray parseoInfo(String info) {
		JSONArray jsonResul = new JSONArray();
		try {
			if(info!=null) {
				JSONArray jsonArr = new JSONArray(info);
				JSONObject jo = new JSONObject();
				for (int i = 0; i < jsonArr.length(); i++) {
					JSONObject jsonObj = jsonArr.getJSONObject(i);
					if (jsonObj.getString("name").contains("id")) {
						jo.put("id", jsonObj.getString("value"));
					}
					if (jsonObj.getString("name").contains("url")) {
						jo.put("url", jsonObj.getString("value"));
					}
					if (jo.length() == 2) {
						jsonResul.put(jo);
						jo = new JSONObject();
					}
	
				}
			}
		} catch (JSONException e) {
			Logger.getLogger("jj");
		}
		return jsonResul;
	}
	
	public void setUrlfromjson(JSONArray jsonmultis, Multimedia video) {
		for (int i = 0; i < jsonmultis.length(); i++) {
		    
		    try {
		    	JSONObject object = jsonmultis.getJSONObject(i);
				if(video.getId().equals(object.getString("id"))){
					video.setUrlVideo(object.getString("url"));
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}


	public String getUrlforQR(PDAnnotation annotation) {
		String url = "";

		if (annotation instanceof PDAnnotationLink) {

			PDAnnotationLink annotationlink = (PDAnnotationLink) annotation;
			PDAction action = annotationlink.getAction();
			if (action != null) {
				if (action instanceof PDActionURI || action instanceof PDActionGoTo) {
					if (action instanceof PDActionURI) {
						PDActionURI uri = (PDActionURI) action;

						url = uri.getURI();
						URL sourceurl;
						try {
							sourceurl = new URL(url);
							if (sourceurl.getHost().equals(Constants.HOSTYOUTUBE)) {
								return sourceurl.toString();
							} else {
								return "";
							}
						} catch (MalformedURLException e) {
							e.printStackTrace();
							return "";
						}

					}
				}
			}
		}
		return url;

	}
	
	
  
}
