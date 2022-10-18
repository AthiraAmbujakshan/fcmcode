package com.cognizant.test;

import java.io.IOException;
import java.util.List;



import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;



import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;



import com.cognizant.test.module.data.ReportTable;

public class Excel_ReportSummaryExporter {
private XSSFWorkbook workbook;
private XSSFSheet sheet;
private List<ReportTable> listData;

public ExcelReportSummaryExporter(List<ReportTable> listData) {
this.listData = listData;
workbook = new XSSFWorkbook();
}


private void writeHeaderLine() {
sheet = workbook.createSheet("Users");

Row row = sheet.createRow(0);

CellStyle style = workbook.createCellStyle();
XSSFFont font = workbook.createFont();
font.setBold(true);
font.setFontHeight(13);
style.setFont(font);

createCell(row, 0, "Table Information", style);
createCell(row, 1, "No. of Row(s) Before Migration", style);
createCell(row, 2, "No. of Row(s) Migrated", style);
createCell(row, 3, "No. of Row(s) After Migration", style);

}

private void createCell(Row row, int columnCount, Object value, CellStyle style) {
sheet.autoSizeColumn(columnCount);
Cell cell = row.createCell(columnCount);
if (value instanceof Integer) {
cell.setCellValue((Integer) value);
} else if (value instanceof Boolean) {
cell.setCellValue((Boolean) value);
}else {
cell.setCellValue((String) value);
}
cell.setCellStyle(style);
}

private void writeDataLines() {
int rowCount = 1;

CellStyle style = workbook.createCellStyle();
XSSFFont font = workbook.createFont();
font.setFontHeight(14);
style.setFont(font);



for (ReportTable his : listData) {
Row row = sheet.createRow(rowCount++);
int columnCount = 0;

createCell(row, columnCount++ ,his.getTableInformation(),style);
createCell(row, columnCount++ ,his.getNoofrowsbeforemigration(),style);
createCell(row, columnCount++ ,his.getNoofrowsmigrated(),style);
createCell(row, columnCount++ ,his.getNoofrowsaftermigration(),style);
}
}

public void export(HttpServletResponse response) throws IOException {
writeHeaderLine();
writeDataLines();
try {
ServletOutputStream outputStream = response.getOutputStream();
workbook.write(outputStream);
workbook.close();

outputStream.close();

}
catch(Exception e)
{
	e.printStackTrace();
}
}
}
