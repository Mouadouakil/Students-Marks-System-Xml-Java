import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.openxml4j.exceptions.InvalidFormatException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import Models.Module;
import Models.Note;
import Models.Student;

public class App {

    // generates student XMl file
    private static void studentsToXML(ArrayList<ArrayList<String>> data, XMLWriter xw, Document doc, String filePath,
            String modelName, String className) {
        // loop over data and save it to studentsList
        for (int i = 1; i < data.size(); i++) {
            Student student = new Student();
            ArrayList<String> firstRow = data.get(0);
            ArrayList<String> row = data.get(i);
            for (int j = 0; j < row.size(); j++) {
                // get attribute name and value
                String attrName = firstRow.get(j);
                String attrVal = row.get(j);

                // set Student attributes
                student.setAttribute(attrName, attrVal);
            }
            Student.addStudent(student);
        }

        Element studentsElement = Student.generateClassXML(className, doc);
        // output filename
        String file = modelName + "_" + className + ".xml";

        // set DTD Files String
        String dtdFile = "students.dtd";

        xw.writeToXML(filePath, file, studentsElement, dtdFile);
    }

    // generate module XML File
    private static void modulesToXML(ArrayList<ArrayList<String>> data, XMLWriter xw, Document doc, String filePath,
            String className) {
        // loop over data and save it to modulesList
        for (int i = 1; i < data.size(); i++) {
            Module module = new Module();
            ArrayList<String> firstRow = data.get(0);
            ArrayList<String> row = data.get(i);
            for (int j = 0; j < row.size(); j++) {
                // get attribute name and value
                String attrName = firstRow.get(j);
                String attrVal = row.get(j);

                // set Module attributes
                module.setAttribute(attrName, attrVal);
            }
            Module.addModule(module);
        }

        Element modulesElement = Module.generateModuleXML(className, doc);
        // output filename
        String file = "modules_" + className + ".xml";

        // DTD FILE
        String dtdFile = "modules.dtd";

        xw.writeToXML(filePath, file, modulesElement, dtdFile);
    }

    // generate Note XML File
    private static void notesToXML(ArrayList<ArrayList<String>> data, XMLWriter xw, Document doc, String filePath,
            String className) {
        // loop over data and save it to notesList
        for (int i = 1; i < data.size(); i++) {
            Note note = new Note();
            ArrayList<String> firstRow = data.get(0);
            ArrayList<String> row = data.get(i);
            for (int j = 0; j < row.size(); j++) {
                // get attribute name and value
                String attrName = firstRow.get(j);
                String attrVal = row.get(j);

                // set Module attributes
                note.setAttribute(attrName, attrVal);
            }
            Note.addNote(note);
        }

        Element notesElement = Note.generateClassNotesXML(className, doc);
        // output filename
        String file = "notes_" + className + ".xml";

        // DTD File
        String dtdFile = "notes.dtd";

        xw.writeToXML(filePath, file, notesElement, dtdFile);
    }

    public static void ExcelToXML(String filePath, String fileName, String className) throws IOException, InvalidFormatException {
        // call read file method from Excel Reader
        ArrayList<ArrayList<String>> data = ExcelReader.readExcel(filePath, fileName);

        // xmlwriter object
        XMLWriter xw = new XMLWriter();
        Document doc = xw.document;

        // get model name: students, moduels, profs...
        String modelName = fileName.substring(0, fileName.indexOf("."));

        switch (modelName.toLowerCase()) {
            case "students":
                studentsToXML(data, xw, doc, filePath, modelName, className);
                break;
            case "modules":
                modulesToXML(data, xw, doc, filePath, className);
                break;
            case "notes":
                notesToXML(data, xw, doc, filePath, className);
                break;
            default:
                break;
        }
    }

    public static void main(String[] args) throws IOException, InvalidFormatException {

        // excel files folder
        String filePath = System.getProperty("user.dir") + "\\src\\";
        String fileName = "students.xls";

        // generate xml file from excel file
        ExcelToXML(filePath, fileName, "ginf2");

        
        // generate html file from xml
        // XMLToHTML.convertXMLToHTML("notes_ginf2.xml", "notes.xsl", "mat1");

        /* 
        // validate xml file using dtd
        String xmlFile = "students_ginf2.xml";
        try {
            XMLValidator.validateWithDTD(xmlFile);
        } catch (ParserConfigurationException | SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        */

        /*  
        // validate xml file using xsd
        String xsdFile = "notes.xsd";
        String xmlFile = "notes_ginf2.xml";
        if(XMLValidator.validateWithXSD(xmlFile, xsdFile)) {
            System.out.println("lfile nadi");
        } else {
            System.out.println("file ma nadish");
        }
        */    

        // changes

        // change from documet_validation branch

    }
}
