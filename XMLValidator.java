import java.io.File;
import java.io.IOException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.w3c.dom.Document;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class XMLValidator {
    public XMLValidator() {
        //
    }

    public static boolean validateWithXSD(String xmlFile, String xsdFile) {

        String xmlDirectory = System.getProperty("user.dir") + "\\src\\XMLFiles\\";
        String xsdDirectory = System.getProperty("user.dir") + "\\src\\XSDFiles\\";
        try {

            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new File(xsdDirectory + xsdFile));
            Validator validator = schema.newValidator();
            validator.validate(new StreamSource(new File(xmlDirectory + xmlFile)));
        } catch (SAXException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }

    // validate as DTD defined in XML file
    public static void validateWithDTD(String xml) throws ParserConfigurationException, SAXException, IOException {

        try {
            String xmlDirectory = System.getProperty("user.dir") + "\\src\\XMLFiles\\";
            File xmlFile = new File(xmlDirectory + xml);

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setValidating(true);

            DocumentBuilder builder = factory.newDocumentBuilder();

            ErrorHandler handler = new MyErrorHandler();

            builder.setErrorHandler(handler);

            Document document = builder.parse(xmlFile);
            System.out.println(xml + " is well formed!");
            // return true;
        } catch (ParserConfigurationException | SAXException | IOException e) {
            throw e;
            // return false;
        }
    }

    private static class MyErrorHandler implements ErrorHandler {
        public void warning(SAXParseException e) throws SAXException {
            System.out.println("Warning: ");
            printInfo(e);
        }

        public void error(SAXParseException e) throws SAXException {
            System.out.println("Error: ");
            printInfo(e);
        }

        public void fatalError(SAXParseException e) throws SAXException {
            System.out.println("Fatal Error: ");
            printInfo(e);
        }

        private void printInfo(SAXParseException e) {
            System.out.println("   Public ID: " + e.getPublicId());
            System.out.println("   System ID: " + e.getSystemId());
            System.out.println("   Line number: " + e.getLineNumber());
            System.out.println("   Column number: " + e.getColumnNumber());
            System.out.println("   Message: " + e.getMessage());
        }
    }
}
