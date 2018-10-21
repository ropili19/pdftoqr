package com.pdftoqr.pdftoqr.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
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
import com.pdftoqr.config.utils.Utils;
import com.pdftoqr.pdftoqr.exceptions.FileConversException;
import com.pdftoqr.pdftoqr.exceptions.FileNotFoundException;
import com.pdftoqr.pdftoqr.model.Multimedia;
import com.pdftoqr.pdftoqr.model.UploadFileResponse;
import com.pdftoqr.pdftoqr.service.OperacionesFichero;


@Controller
public class PDFController {
	

	@Autowired
	private OperacionesFichero serviceOperacionesFich;
	private Utils utils = new Utils();
	
    @RequestMapping("/pdftoqr")
    public String redirHome(Model model){
        return "pdftoqr";
    }

	@PostMapping("/getMultimedias")
	public ResponseEntity<List<Multimedia>> getMultimedias(@RequestParam("file") MultipartFile file)
			throws com.pdftoqr.pdftoqr.exceptions.FileNotFoundException {
		List<Multimedia> n_multi = new ArrayList<>();
		int numpage = 0;
		try {
			PDDocument pddoc = PDDocument.load(file.getInputStream());
			for (PDPage page : pddoc.getPages()) {
				numpage = numpage + 1;
				for (PDAnnotation annotation : page.getAnnotations()) {
					String url = "";
					if (annotation.getSubtype().equals("RichMedia")) {
						Multimedia video = serviceOperacionesFich.getInfoRichMedia(annotation, numpage, numpage);
						video.setNamePdf(file.getOriginalFilename());
						n_multi.add(video);
					}
					if (annotation instanceof PDAnnotationLink) {
						url = utils.getUrlforQR(annotation);
						if (!url.equals("")) {
							Multimedia video = new Multimedia();
							video.setPage(numpage);
							video.setUrlVideo(url);
							video.setNamePdf(file.getOriginalFilename());
							n_multi.add(video);
						}
					}

				}

			}

		} catch (IOException e) {

			throw new FileNotFoundException("File not exist ");

		}
		return ResponseEntity.accepted().body(n_multi);

	}
	
	@RequestMapping(value = "/procesa", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public ResponseEntity<UploadFileResponse> fileUploadWithNumber(
			@RequestParam(value = "info", required = true) String info,
			@RequestParam(value = "file", required = true) MultipartFile file)
			throws FileNotFoundException, FileUploadException {

		UploadFileResponse generado = new UploadFileResponse();
		try {
			JSONArray jsonmultis = utils.parseoInfo(info);
			PDDocument document = PDDocument.load(file.getInputStream());
			generado = serviceOperacionesFich.parserFile(document, file.getOriginalFilename(), jsonmultis, generado);
			document.close();
//			Properties p = new Properties();
//			InputStream propertiesStream = ClassLoader.getSystemResourceAsStream("application.properties");
//			p.load(propertiesStream);
//			p.getProperty("contador");
//			p.setProperty("contador", String.valueOf(Integer.parseInt(p.getProperty("contador"))+1));
//			System.out.println("numero de ficheros procesados"+p.getProperty("contador"));
//			propertiesStream.close();
		} catch (IllegalStateException e) {
			if (file == null) {
				throw new com.pdftoqr.pdftoqr.exceptions.FileNotFoundException("File not exist ");
			}
		} catch (IOException e) {
			throw new FileConversException("File not proccessed ");
		}

		return ResponseEntity.accepted().body(generado);

	}
	  
	@GetMapping("/downloadR/{fileName:.+}")
	public StreamingResponseBody downloadR(@PathVariable String fileName, HttpServletResponse response)
			throws URISyntaxException, IOException {
		File file = serviceOperacionesFich.getPathToFile(fileName);
		response.setContentType("application/pdf");
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
		Resource resource = serviceOperacionesFich.loadFileAsResource(fileName);
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException ex) {

		}
		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}    
	    
}

