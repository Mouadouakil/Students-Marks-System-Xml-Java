import java.io.File;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class XMLWriter {

    public Document document;

    XMLWriter() {
        //
        try {
            DocumentBuilderFactory documentFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder;
            documentBuilder = documentFactory.newDocumentBuilder();

            document = documentBuilder.newDocument();
        } catch (ParserConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void writeToXML(String filePath, String fileName, Element element, String dtdFile) {

        try {
            // append root element to document
            document.appendChild(element);

            // create XML file
            // transform the DOM Object to an XML File
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();

            // Set DTD file
            // String dtdDirectory = "../DTDFiles/";
            // transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, dtdDirectory + dtdFile);

            DOMSource domSource = new DOMSource(document);
            String file = filePath + "XMLFiles\\" + fileName;
            StreamResult streamResult = new StreamResult(new File(file));

            transformer.transform(domSource, streamResult);

            System.out.println("Done creating XML File");
        } catch (TransformerConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (TransformerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /*
     * public static void main(String[] args) { XMLWriter xw = new XMLWriter();
     * String filePath = System.getProperty("user.dir") + "\\src\\XMLFiles";
     * xw.writeToXML(filePath, "xmlFile.xml"); System.out.println("it works!"); }
     */
}
