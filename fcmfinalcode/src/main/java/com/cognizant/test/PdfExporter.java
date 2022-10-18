package com.cognizant.test;

import java.awt.Color;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.cognizant.test.oracle.module.Module;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class PdfExporter {
	private List<Module> listData;
	private PdfPCell cell = new PdfPCell();
	private String modulename;
	public PdfExporter(List<Module> listData, String modulename) {
		this.listData = listData;
		this.modulename = modulename;
	}

	private void writeTableHeader(PdfPTable table) {
		
		cell.setBackgroundColor(Color.gray);
		cell.setPadding(4);
		

		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(8);
		font.setColor(Color.WHITE);

		cell.setPhrase(new Phrase("FCM_TABLE_NAME", font));

		table.addCell(cell);
		

		cell.setPhrase(new Phrase("FCM_FIELD_NAME", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("FCM_FIELD_TYPE", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("FCM_FIELD_SIZE", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("FCM_NULL_CONSTRAINTS", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("FCM_DATA_DEFAULT", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("FCM_COLUMN_ID", font));
		table.addCell(cell);
	}

	private void writeTableData(PdfPTable table) {
		cell.setPadding(3);
		for (Module his : listData) {
			table.addCell(his.getTABLE_NAME());
			table.addCell(his.getCOLUMN_NAME());
			table.addCell(his.getDATA_TYPE());
			table.addCell(his.getDATA_LENGTH());
			table.addCell(his.getNULLABLE());
			table.addCell(his.getDATA_DEFAULT());
			table.addCell(String.valueOf(his.getCOLUMN_ID()));
		}
	}

	public void export(HttpServletResponse response) throws DocumentException, IOException {
		Document document = new Document(PageSize.A3);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();
		Image image = Image.getInstance(getClass().getClassLoader().getResource("logo1.PNG"));
		image.setAbsolutePosition(670, 1100);
		image.scaleAbsoluteWidth(140);
		image.scaleAbsoluteHeight(40);


		document.add(image);

		Font font = FontFactory.getFont(FontFactory.TIMES);
		font.setSize(14);
		font.setColor(Color.BLACK);

		Paragraph y = new Paragraph(" ", font);
		y.setAlignment(Paragraph.ALIGN_LEFT);
		
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		Paragraph p = new Paragraph("Document Generation Time: "+currentDateTime, font);
		p.setAlignment(Paragraph.ALIGN_LEFT);
		
		Paragraph p1 = new Paragraph(" ", font);
		p1.setAlignment(Paragraph.ALIGN_LEFT);

		Paragraph p2 = new Paragraph("Module Name: migrate-"+modulename, font);
		p2.setAlignment(Paragraph.ALIGN_LEFT);
		
		Paragraph p3 = new Paragraph(" ", font);
		p3.setAlignment(Paragraph.ALIGN_LEFT);
		
		
		document.add(y);
		document.add(y);
		document.add(p);
        document.add(p1);
        document.add(p2);
        document.add(p3);
        
		PdfPTable table = new PdfPTable(7);
		table.setWidthPercentage(100f);
		table.setWidths(new float[] {5f, 4.5f, 4.5f,4.5f, 5f, 4.5f, 4f});
		table.setSpacingBefore(10);

		writeTableHeader(table);
		writeTableData(table);

		document.add(table);

		document.close();

	}
}
