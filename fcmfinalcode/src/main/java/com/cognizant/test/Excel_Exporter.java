package com.cognizant.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.cognizant.test.oracle.module.Module;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Excel_Exporter {
private XSSFWorkbook workbook;
private XSSFSheet sheet;
private List<Module> listData;

public Excel_Exporter(List<Module> listData) {
this.listData = listData;
workbook = new XSSFWorkbook();
}


private void writeHeaderLine() {
sheet = workbook.createSheet("Users");

Row row = sheet.createRow(0);

CellStyle style = workbook.createCellStyle();
XSSFFont font = workbook.createFont();
font.setBold(true);
font.setFontHeight(14);
style.setFont(font);

createCell(row, 0, "FCM_TABLE_NAME", style);
createCell(row, 1, "FCM_FIELD_NAME", style);
createCell(row, 2, "FCM_FIELD_TYPE", style);
createCell(row, 3, "FCM_FIELD_SIZE", style);
createCell(row, 4, "FCM_NULL_CONSTRAINTS", style);
createCell(row, 5, "FCM_DATA_DEFAULT", style);
createCell(row, 6, "FCM_COLUMN_ID", style);

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



for (Module his : listData) {
Row row = sheet.createRow(rowCount++);
int columnCount = 0;

createCell(row, columnCount++ ,his.getTABLE_NAME(),style);
createCell(row, columnCount++ ,his.getCOLUMN_NAME(),style);
createCell(row, columnCount++ ,his.getDATA_TYPE(),style);
createCell(row, columnCount++ ,his.getDATA_LENGTH(),style);
createCell(row, columnCount++ ,his.getNULLABLE(),style);
createCell(row, columnCount++ ,his.getDATA_DEFAULT(),style);
createCell(row, columnCount++ ,his.getCOLUMN_ID(),style);
}
}

public void export(HttpServletResponse response) throws IOException {
writeHeaderLine();
writeDataLines();

ServletOutputStream outputStream = response.getOutputStream();
workbook.write(outputStream);
workbook.close();

outputStream.close();

}
}
