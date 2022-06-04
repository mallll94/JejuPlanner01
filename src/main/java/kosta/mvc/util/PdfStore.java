package kosta.mvc.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;

import com.itextpdf.layout.font.FontProvider;

public class PdfStore{

	//src : html파일 경로("D:\\sample.html") , dest : pdf를 만들 경로("D:\\sample.pdf")
	public void makepdf(String src, String dest) throws IOException {
		//한국어를 표시하기 위해 폰트 적용 
	    String FONT = "C:\\Edu\\util";
	    //ConverterProperties : htmlconverter의 property를 지정하는 메소드인듯
	    ConverterProperties properties = new ConverterProperties();
	    FontProvider fontProvider = new DefaultFontProvider(false, false, false);
	    FontProgram fontProgram = FontProgramFactory.createFont(FONT);
	    fontProvider.addFont(fontProgram);
	    properties.setFontProvider(fontProvider);

		//pdf 페이지 크기를 조정. convertToElements의 매개변수 부분만 다름.
		List<IElement> elements = HtmlConverter.convertToElements(new FileInputStream(src), properties);
	    PdfDocument pdf = new PdfDocument(new PdfWriter(dest));
	    Document document = new Document(pdf);
	    	//setMargins 매개변수순서 : 상, 우, 하, 좌
	        document.setMargins(50, 0, 50, 0);
	        for (IElement element : elements) {
	            document.add((IBlockElement) element);
	        }
	        document.close();
	}
}
