package com.pdftoqr.pdftoqr.controller;



import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.cos.COSArray;
import org.apache.pdfbox.cos.COSBase;
import org.apache.pdfbox.cos.COSDictionary;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.common.filespecification.PDComplexFileSpecification;
import org.apache.pdfbox.pdmodel.common.filespecification.PDEmbeddedFile;
import org.apache.pdfbox.pdmodel.interactive.action.PDAction;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionGoTo;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionURI;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.pdftoqr.pdftoqr.model.Multimedia;
import com.pdftoqr.pdftoqr.model.UploadFileResponse;
import com.pdftoqr.pdftoqr.service.OperacionesFichero;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;


@Controller
public class PDFController {
	private static String HOSTYOUTUBE = "www.youtube.com";
	public static String UPLOADED_FOLDER="/pdftoqr/uploads/";
	@Autowired
	private OperacionesFichero serviceOperacionesFich;
	Map<String, String> mapMultimedias = new HashMap<String, String>();
	
    @RequestMapping("/pdftoqr")
    public String showHello(Model model){
       // model.addAttribute("saludo", "Mi primera aplicacion web Spring Boot");
        return "pdftoqr";
    }
	@PostMapping("/getMultimedias")
	public ResponseEntity<List<Multimedia>> getMultimedias(@RequestParam("file") MultipartFile file) {
		List<Multimedia> n_multi = new ArrayList<>();
		int numpage = 0;
        try {

        	 PDDocument pddoc = PDDocument.load(file.getInputStream());

			for (PDPage page : pddoc.getPages()) {
				numpage = numpage + 1;
				for (PDAnnotation annotation : page.getAnnotations()) {
					String url = "";
					if (annotation.getSubtype().equals("RichMedia")) {
						COSArray array = (COSArray) annotation.getCOSObject()
								.getObjectFromPath("RichMediaContent/Assets/Names/");
						Multimedia video = getInfoRichMedia(annotation,numpage, numpage);
						n_multi.add(video);
					}
					if (annotation instanceof PDAnnotationLink) {
						url = getUrlforQR(annotation);
					  
						if (!url.equals("")) {
							Multimedia video = new Multimedia();
							video.setPage(numpage);
							video.setUrlVideo(url);
							n_multi.add(video);
						}
					}

				}

			}
			
		} catch (IOException e) {
			
			
			e.printStackTrace();
			//convFile.delete();
		}finally {
			
		}
		return ResponseEntity.accepted().body(n_multi);
		
	}
	
	
	  @RequestMapping(value = "/procesa", method = RequestMethod.POST, consumes = {"multipart/form-data"})
	    public ResponseEntity<UploadFileResponse> fileUploadWithNumber(@RequestParam(value = "info", required = true) String info,
	                                                         @RequestParam(value = "file", required = true) MultipartFile file) {

		  UploadFileResponse generado = new UploadFileResponse();
			try {
				JSONArray jsonmultis = parseoInfo(info);
		    	File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
				file.transferTo(convFile);
				PDDocument document = PDDocument.load(convFile);
				generado= parserFile(document,file.getOriginalFilename(),jsonmultis,generado);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return ResponseEntity.accepted().body(generado);
	    
}
	
		private JSONArray parseoInfo(String info) {
			JSONArray jsonResul = new JSONArray();
		try {
			JSONArray jsonArr = new JSONArray(info);
			JSONObject jo = new JSONObject();
	        for (int i = 0; i < jsonArr.length(); i++)
	        {
	        	//i+=1;
	        
	        
	       
	     
	        	 JSONObject jsonObj = jsonArr.getJSONObject(i);
				if(jsonObj.getString("name").contains("id")) {
					
					jo.put("id", jsonObj.getString("value"));
				}

	            if(jsonObj.getString("name").contains("url")) {
	            	jo.put("url", jsonObj.getString("value"));
	            }
	         if(jo.length()==2) {
	        	 jsonResul.put(jo);
	        	 jo = new JSONObject();
	         }
			

	           
	        }
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonResul;
	}
		private UploadFileResponse parserFile(PDDocument docoriginal, String namefile, JSONArray jsonmultis, UploadFileResponse generado) {
	    //	 Path rutafile = this.fileStorageLocation.resolve(filePath.getFileName()).normalize();
			File filetemp = new File(System.getProperty("java.io.tmpdir") + "/" + namefile+"_QR");
	        
			Resource resourceNew = null;
	         File raiz=new File(".");
	         PDDocument pdoc=null;
	        
			try {
				//resourceNew = new UrlResource(rutafile.toUri());
	    	    pdoc = new PDDocument();
	    	    int numpage=0;
	    	   
	    	    int contmedia=0;
	    	   // extraerficheros(docoriginal, filePath.toString());
				for (PDPage page : docoriginal.getPages()) {
					 numpage=numpage+1;		
					
					 for (PDAnnotation annotation : page.getAnnotations()) {
						 String url = "";
						 contmedia+=1;
						 if (annotation.getSubtype().equals("RichMedia")) {
					         //obtengo namevideo y page
							 
							 Multimedia video = getInfoRichMedia(annotation,numpage,contmedia);
							 setUrlfromjson(jsonmultis,video);
							   if(!video.getUrlVideo().equals("")) {
					                  BufferedImage imgMarca = getImgforQR(video.getUrlVideo());
					                  PDRectangle rect = annotation.getRectangle();
					                  BufferedImage imgqr=serviceOperacionesFich.generateQRforUrl(video.getUrlVideo(),rect.getWidth(),rect.getHeight());
					                  serviceOperacionesFich.insertarImagenQR(docoriginal, page, annotation, url, pdoc, numpage, imgMarca,imgqr);
				                  }  
					       } else if (annotation instanceof PDAnnotationLink) {
					                  url = getUrlforQR(annotation);
					                  if(!url.equals("")) {
						                  BufferedImage imgMarca = getImgforQR(url);
						                  PDRectangle rect = annotation.getRectangle();
						                  BufferedImage imgqr=serviceOperacionesFich.generateQRforUrl(url,rect.getWidth(),rect.getHeight());
						                  serviceOperacionesFich.insertarImagenQR(docoriginal, page, annotation, url, pdoc, numpage, imgMarca,imgqr);
					                  }
				            }
		
					               
				     }
					 pdoc.addPage(page);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
					try {	
						/** Al descomentar esta línea se crearia un fichero temporal en la carpeta indicada en el properties.*/
						serviceOperacionesFich.creacionFichTemporal(pdoc,namefile,generado);
						
					
						 docoriginal.close();
						// serviceOperacionesFich.printResource(namefile);
					} catch (IOException e) {					
						e.printStackTrace();
					}
				}
			 
				return generado;		
	    }
		private void setUrlfromjson(JSONArray jsonmultis, Multimedia video) {
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
		private Multimedia getInfoRichMedia(PDAnnotation annotation, int numpage, int contmedia) {
			Multimedia video = new Multimedia();
			try {
			COSArray array = (COSArray) annotation.getCOSObject()
					.getObjectFromPath("RichMediaContent/Assets/Names/");
			  COSDictionary annotDic = (COSDictionary) annotation.getCOSObject().getDictionaryObject("RichMediaContent");
			    COSBase assets = annotDic.getDictionaryObject("Assets");
			    COSDictionary c = (COSDictionary) assets;
				  COSArray k = (COSArray) c.getItem("Names").getCOSObject().getCOSObject();
				    String nameVideo = k.getString(4);
				    if(nameVideo.contains(".swf")) {
				    	nameVideo=k.getString(0);
				    }
				
				video.setNameVideo(nameVideo);
				video.setPage(numpage);
				COSDictionary filespec = (COSDictionary) array.getObject(1);
				PDComplexFileSpecification cfs = new PDComplexFileSpecification(filespec);
				PDEmbeddedFile embeddedFile = cfs.getEmbeddedFile();
				
					video.setId(embeddedFile.getCreationDate().getTime() + "_" + video.getNameVideo());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return video;
		}


		private BufferedImage getImgforQR(String url) {
			// TODO Auto-generated method stub
			// La url del video es de youtube?
			URL uri;
			try {
				uri = new URL(url);
				if (uri.getHost().equals(HOSTYOUTUBE))
					return getImgforYoutube(url);
				else {
					return getImgforVideo(url);
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		private BufferedImage getImgforYoutube(String url) {
			BufferedImage imgMarca = null;
			try {
				 String idUri="";
				URL a = new URL(url);
				String [] params = a.getQuery().split("&");
				for(int i= 0 ; i < params.length; i++){
					String [] split = params[i].split("=");
					if(split[0].equals("v")) {
						idUri=split[1];
					}
				
				}
				
				URL urlImg = new URL("http://img.youtube.com/vi/" + idUri + "/0.jpg");
				imgMarca = ImageIO.read(urlImg);
				//File outputfile = new File(this.serviceOperacionesFich.toAbsolutePath().toString() + "\\image.png");
				//ImageIO.write(imgMarca, "png", outputfile);
			} catch (MalformedURLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e2) {
				e2.printStackTrace();
			}
			return imgMarca;

		}
		private BufferedImage getImgforVideo(String url) {
			BufferedImage imgMarca = null;
		
				try {
					File raiz=new File(".");
					File sourceimage = new File(raiz.getCanonicalPath()+"\\src\\main\\java\\com\\pdftoqr\\config\\utils\\video.jpg");
					imgMarca = ImageIO.read(sourceimage);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			
			return imgMarca;

		}
		private String getUrlforQR(PDAnnotation annotation) {
			String url = "";

			if (annotation instanceof PDAnnotationLink) {

				PDAnnotationLink annotationlink = (PDAnnotationLink) annotation;
				// get link
				PDAction action = annotationlink.getAction();
				if (action != null) {
					if (action instanceof PDActionURI || action instanceof PDActionGoTo) {
						if (action instanceof PDActionURI) {
							// uri link
							PDActionURI uri = (PDActionURI) action;

							url = uri.getURI();
							URL sourceurl;
							try {
								sourceurl = new URL(url);
								if (sourceurl.getHost().equals(HOSTYOUTUBE)) {
									return sourceurl.toString();
								} else {
									return "";
								}
							} catch (MalformedURLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								return "";
							}

						}
					}
				}
		}
			return url;

		
		}
	  
		 
		  
	    @GetMapping("/downloadR/{fileName:.+}")
	    public StreamingResponseBody downloadR(@PathVariable String fileName,HttpServletResponse response) throws URISyntaxException, IOException {
	    	File file = serviceOperacionesFich.getPathToFile(fileName);
	        response.setContentType("application/pdf");
	      //  file = null;
	        InputStream inputStream = new FileInputStream(file);
	        return outputStream -> {
	            int nRead;
	            byte[] data = new byte[1024];
	            while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
	                outputStream.write(data, 0, nRead);
	            }
	            inputStream.close();
	        };
	    }
	    @GetMapping("/downloadFile/{fileName:.+}")
	    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) {
	        //Cargamos fichero
	        Resource resource = serviceOperacionesFich.loadFileAsResource(fileName);
	        String contentType = null;
	        try {
	            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
	        } catch (IOException ex) {
	         
	        }
	        if(contentType == null) {
	            contentType = "application/octet-stream";
	        }

	        return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
	                .body(resource);
	    }
	    
	    
	    
}

