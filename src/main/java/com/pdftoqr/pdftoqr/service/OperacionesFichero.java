package com.pdftoqr.pdftoqr.service;

import java.awt.AlphaComposite;
import java.awt.Composite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.imageio.ImageIO;
import org.apache.pdfbox.cos.COSArray;
import org.apache.pdfbox.cos.COSBase;
import org.apache.pdfbox.cos.COSDictionary;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.common.filespecification.PDComplexFileSpecification;
import org.apache.pdfbox.pdmodel.common.filespecification.PDEmbeddedFile;
import org.apache.pdfbox.pdmodel.graphics.image.LosslessFactory;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotation;
import org.apache.pdfbox.pdmodel.interactive.annotation.PDAnnotationLink;
import org.apache.pdfbox.printing.PDFPageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import com.pdftoqr.config.PDFuploadProperties;
import com.pdftoqr.config.utils.Constants;
import com.pdftoqr.config.utils.Utils;
import com.pdftoqr.pdftoqr.exceptions.FileConversException;
import com.pdftoqr.pdftoqr.model.Multimedia;
import com.pdftoqr.pdftoqr.model.UploadFileResponse;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
@Service
public class OperacionesFichero {
	
    private final Path ubicacionFichero;
	private Utils utils;
	 @Autowired
	    public OperacionesFichero( PDFuploadProperties fileStorageProperties) {
	        this.ubicacionFichero = Paths.get(fileStorageProperties.getUploadDir())
	                .toAbsolutePath().normalize();

	        try {
	            Files.createDirectories(this.ubicacionFichero);
	        } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	 
	public Multimedia getInfoRichMedia(PDAnnotation annotation, int numpage, int contmedia) {
		Multimedia video = new Multimedia();
		try {
			COSArray array = (COSArray) annotation.getCOSObject().getObjectFromPath("RichMediaContent/Assets/Names/");
			COSDictionary annotDic = (COSDictionary) annotation.getCOSObject().getDictionaryObject("RichMediaContent");
			COSBase assets = annotDic.getDictionaryObject("Assets");
			COSDictionary c = (COSDictionary) assets;
			COSArray k = (COSArray) c.getItem("Names").getCOSObject().getCOSObject();
			String nameVideo = k.getString(4);
			if (nameVideo.contains(".swf")) {
				nameVideo = k.getString(0);
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

	public BufferedImage generateQRforUrl(String url, float width, float height) {
		BufferedImage bImageFromConvert = null;
		ByteArrayOutputStream out = QRCode.from(url).to(ImageType.PNG).withSize(Math.round(width), Math.round(height))
				.stream();

		byte[] imageInByte;
		try {

			imageInByte = out.toByteArray();
			out.close();
			InputStream in = new ByteArrayInputStream(imageInByte);
			bImageFromConvert = ImageIO.read(in);
			in.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
		}
		return bImageFromConvert;
	}

	private BufferedImage resizeImage(BufferedImage originalImage, int type, float width, float height) {
		BufferedImage resizedImage = new BufferedImage(Math.round(width), Math.round(height), type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, Math.round(width), Math.round(height), null);
		g.dispose();
		return resizedImage;
	}

	public BufferedImage paint(BufferedImage bi1, BufferedImage bi2, float width, float height) {

		BufferedImage resultImage = new BufferedImage(bi1.getWidth(), bi1.getHeight(), BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = resultImage.createGraphics();
		g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		g2.drawImage(bi2, 0, 0, null);
		Composite c = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, .35f);
		g2.setComposite(c);
		g2.drawImage(bi1, 0, 0, null);
		return resultImage;
	}

	public void insertarImagenQR(PDDocument docoriginal, PDPage page, PDAnnotation annotation, String url,
			PDDocument pdoc, int numpage, BufferedImage imgMarca, BufferedImage imgqr) {
		PDRectangle rect = annotation.getRectangle();
		annotation.setLocked(false);
		annotation.setHidden(true);
		int type = imgMarca.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : imgMarca.getType();
		BufferedImage resizeImagevideo = resizeImage(imgMarca, type, rect.getWidth(), rect.getHeight());
		BufferedImage resizeImageqR = resizeImage(imgqr, type, rect.getWidth(), rect.getHeight());
		BufferedImage merge = this.paint(resizeImagevideo, resizeImageqR, rect.getWidth(), rect.getHeight());
		insertQr(docoriginal, page, merge, rect, pdoc, numpage);
	}
	
	private void insertQr(PDDocument docoriginal, PDPage page, BufferedImage mergeqr, PDRectangle rect, PDDocument pdoc,
			int numpage) {
		try {
			mergeqr.createGraphics().drawRenderedImage(mergeqr, null);
			PDImageXObject image = LosslessFactory.createFromImage(pdoc, mergeqr);
			PDPageContentStream contentStream = new PDPageContentStream(pdoc, page,
					PDPageContentStream.AppendMode.APPEND, true);
			float x = rect.getLowerLeftX();
			float y = rect.getLowerLeftY();
			float width = rect.getWidth();
			float height = rect.getHeight();
			contentStream.drawImage(image, x, y, width, height);
			contentStream.addRect(x, y, width, height);
			contentStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void creacionFichTemporal(PDDocument pdoc, String namefile, UploadFileResponse generado) {
		try {
			File file = File.createTempFile(namefile.replace(".", "") + "_QR", ".pdf",
					this.ubicacionFichero.toAbsolutePath().toFile());
			pdoc.save(file);
			System.out.println(file.getName());
			generado.setFileName(file.getName());
			pdoc.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void printResource(String fileName) {

		Path filePath = this.ubicacionFichero.resolve(fileName).normalize();
		Resource resource;
		try {
			resource = new UrlResource(filePath.toUri().toString());

			if (resource.exists()) {

				PDDocument document = PDDocument.load(new File(filePath.toString()));
				printerPdf(document, filePath);

			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private void printerPdf(PDDocument document, Path filePath) {
		PrinterJob job = PrinterJob.getPrinterJob();
		job.setPageable(new PDFPageable(document));

		try {
			job.print();
		} catch (PrinterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	public File getPathToFile(String fileName) {

		File file = new File(this.ubicacionFichero + "\\" + fileName);
		return file;
	}

	public Resource loadFileAsResource(String fileName) {
		try {
			Path filePath = this.ubicacionFichero.resolve(fileName).normalize();
			Resource resource = new UrlResource(filePath.toUri());
			if (resource.exists()) {
				Resource resource2 = new UrlResource(filePath.toUri().toString());
				return resource2;
			} else {
				throw new FileNotFoundException("Fichero no encontrado " + fileName);
			}
		} catch (IOException ex) {
			try {
				throw new FileNotFoundException("Fichero no encontrado " + fileName);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public UploadFileResponse parserFile(PDDocument docoriginal, String namefile, JSONArray jsonmultis,
			UploadFileResponse generado) throws FileNotFoundException {
		utils=new Utils();
		PDDocument pdoc = null;
		try {
			pdoc = new PDDocument();
			int numpage = 0;

			int contmedia = 0;
			for (PDPage page : docoriginal.getPages()) {
				numpage = numpage + 1;

				for (PDAnnotation annotation : page.getAnnotations()) {
					String url = "";
					contmedia += 1;
					if (annotation.getSubtype().equals("RichMedia")) {

						Multimedia video = getInfoRichMedia(annotation, numpage, contmedia);
						utils.setUrlfromjson(jsonmultis, video);
						if (!video.getUrlVideo().equals("")) {
							BufferedImage imgMarca = getImgforQR(video.getUrlVideo());
							PDRectangle rect = annotation.getRectangle();
							BufferedImage imgqr = generateQRforUrl(video.getUrlVideo(), rect.getWidth(),
									rect.getHeight());
							insertarImagenQR(docoriginal, page, annotation, url, pdoc, numpage, imgMarca, imgqr);
						}
					} else if (annotation instanceof PDAnnotationLink) {
						url = utils.getUrlforQR(annotation);
						if (!url.equals("")) {
							BufferedImage imgMarca = getImgforQR(url);
							PDRectangle rect = annotation.getRectangle();
							BufferedImage imgqr = generateQRforUrl(url, rect.getWidth(), rect.getHeight());
							insertarImagenQR(docoriginal, page, annotation, url, pdoc, numpage, imgMarca, imgqr);
						}
					}

				}
				pdoc.addPage(page);
			}

		} catch (Exception e) {
			throw new FileConversException("File not convers to Qr ");
		} finally {
			try {

				creacionFichTemporal(pdoc, namefile, generado);
				docoriginal.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return generado;
	}
	
	public BufferedImage getImgforVideo(String url) throws FileNotFoundException {
		BufferedImage imgmarcaunknow;
		try {
			File sourceimage = new File(
					this.ubicacionFichero.toAbsolutePath().toString().replace("uploads", "usr//local//video.jpg"));
			imgmarcaunknow = ImageIO.read(sourceimage);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new FileNotFoundException("File image not found " + url);
		}

		return imgmarcaunknow;

	}
	
	public BufferedImage getImgforQR(String url) throws FileNotFoundException {
		URL uri;
		try {
			uri = new URL(url);
			if (uri.getHost().equals(Constants.HOSTYOUTUBE))
				return getImgforYoutube(url);
			else {
				return getImgforVideo(url);
			}
		} catch (MalformedURLException e) {
			return getImgforVideo(url);
		} catch (FileNotFoundException e) {
			throw new FileNotFoundException("Fichero no encontrado " + url);
		}

	}

	public BufferedImage getImgforYoutube(String url) throws FileNotFoundException {
		BufferedImage imgMarca = null;
		try {
			String idUri = "";
			URL a = new URL(url);
			String[] params = a.getQuery().split("&");
			for (int i = 0; i < params.length; i++) {
				String[] split = params[i].split("=");
				if (split[0].equals("v")) {
					idUri = split[1];
				}

			}

			URL urlImg = new URL("http://img.youtube.com/vi/" + idUri + "/0.jpg");
			imgMarca = ImageIO.read(urlImg);

		} catch (Exception e) {

			imgMarca = getImgforVideo(url);
		}

		return imgMarca;

	}

}