package com.cognizant.test;



import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;


import com.cognizant.test.module.data.ReportTable;




public class PDFReportSummaryExporter {
private ArrayList<ReportTable> listData;
private PdfPCell cell = new PdfPCell();


public PDFReportSummaryExporter(ArrayList<ReportTable> listData) {
super();
this.listData = listData;


}



private void writeTableHeader(PdfPTable table) {

cell.setBackgroundColor(Color.gray);
cell.setPadding(4);



Font font = FontFactory.getFont(FontFactory.TIMES);
font.setColor(Color.WHITE);



cell.setPhrase(new Phrase("Table Information", font));



table.addCell(cell);



cell.setPhrase(new Phrase("No. of Row(s) Before Migration", font));
table.addCell(cell);



cell.setPhrase(new Phrase("No. of Row(s) Migrated", font));
table.addCell(cell);

cell.setPhrase(new Phrase("No. of Row(s) After Migration", font));
table.addCell(cell);




}



private void writeTableData(PdfPTable table) {
cell.setPadding(3);
for (ReportTable his : listData) {
table.addCell(his.getTableInformation());
table.addCell(his.getNoofrowsbeforemigration());
table.addCell(his.getNoofrowsmigrated());
table.addCell(his.getNoofrowsaftermigration());

}
}
public void export(HttpServletResponse response) throws DocumentException, IOException {
	
Document document = new Document(PageSize.A4);
PdfWriter.getInstance(document, response.getOutputStream());



document.open();
Font font1 = FontFactory.getFont(FontFactory.TIMES);
font1.setSize(10);
font1.setColor(Color.BLACK);

Paragraph p = new Paragraph(" ", font1);
p.setAlignment(Paragraph.ALIGN_LEFT);



Image image = Image.getInstance(getClass().getClassLoader().getResource("logo1.PNG"));

image.setAbsolutePosition(440, 780);
image.scaleAbsoluteWidth(140);
image.scaleAbsoluteHeight(40);


document.add(image);

Font font = FontFactory.getFont(FontFactory.TIMES);
font.setSize(10);
font.setColor(Color.BLACK);

Paragraph y = new Paragraph(" ", font);
y.setAlignment(Paragraph.ALIGN_LEFT);

Paragraph p2 = new Paragraph(" ", font);
p2.setAlignment(Paragraph.ALIGN_LEFT);


Paragraph p1 = new Paragraph(" ", font);
p1.setAlignment(Paragraph.ALIGN_LEFT);




Paragraph p3 = new Paragraph(" ", font);
p3.setAlignment(Paragraph.ALIGN_LEFT);


document.add(p1);
document.add(p2);
document.add(p3);
document.add(y);

PdfPTable table = new PdfPTable(4);

table.setWidthPercentage(110f);
table.setWidths(new float[] {3.5f, 5.5f, 4f,5.5f});
table.setSpacingBefore(10);

writeTableHeader(table);
writeTableData(table);

document.add(table);

document.close();


}
}
