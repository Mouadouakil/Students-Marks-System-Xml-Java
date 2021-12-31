import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openxml4j.exceptions.InvalidFormatException;
import org.openxml4j.opc.Package;

/**
 * ExcelReader
 */
public class ExcelReader {

    ExcelReader() {
        //
    }

    public static ArrayList<ArrayList<String>> readExcel(String filePath, String fileName) throws IOException, InvalidFormatException {
        // file object to open xslx file
        File file = new File(filePath + "ExcelFiles\\" + fileName);

        // fileInput object to read excel file
        FileInputStream fis = new FileInputStream(file);

        Workbook workbook = null;

        // Find the file extension by splitting file name in substring and getting only
        // extension name
        String fileExtension = fileName.substring(fileName.indexOf("."));

        if (fileExtension.equals(".xlsx")) {
            workbook = new XSSFWorkbook(Package.open(fis));
        } else if (fileExtension.equals(".xls")) {
            workbook = new HSSFWorkbook(fis);
        }

        Sheet sheet = workbook.getSheetAt(0);

        // find number of rows in sEscel file
        int rowCount = sheet.getLastRowNum() - sheet.getFirstRowNum();

        // data array
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        // loop iver the rows
        for (int i = 0; i < rowCount + 1; i++) {
            Row row = sheet.getRow(i);
            ArrayList<String> rowData = new ArrayList<String>();

            // loop over the cells
            for (int j = 0; j < row.getLastCellNum(); j++) {
                String cellVal = row.getCell(j).toString();
                // System.out.print(cellVal + " ; ");
                rowData.add(cellVal);
            }
            // System.out.println();
            data.add(rowData);
        }

        return data;
    }
}