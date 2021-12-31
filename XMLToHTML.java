import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class XMLToHTML {

    public XMLToHTML() {
        //
    }

    public static void convertXMLToHTML(String xmlFile, String xsltFile, String module) {
        StringWriter sw = new StringWriter();

        String filesPath = System.getProperty("user.dir") + "\\src\\";

        // xml filepath
        String xmlFilePAth = filesPath + "\\XMLFiles\\" + xmlFile;

        // xslt file path
        String xsltFilePAth = filesPath + "\\XSLTFiles\\" + xsltFile;

        // output html file location
        String fileName = xmlFile.substring(0, xmlFile.indexOf("."));
        String htmlFileLocation = filesPath + "\\HTMLFiles\\" + fileName + ".html";

        Source xml = new StreamSource(xmlFilePAth);
        Source xslt = new StreamSource(xsltFilePAth);

        try {

            FileWriter fw = new FileWriter(htmlFileLocation);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer trasform = tFactory.newTransformer(xslt);

            // modify param value here
            // mod stands for module code
            trasform.setParameter("mod", module);

            trasform.transform(xml, new StreamResult(sw));

            // test if i can change xslt props

            fw.write(sw.toString());
            fw.close();

            System.out.println(fileName + ".html generated successfully at " + filesPath +"\\HTMLFiles");

        } catch (IOException | TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        /* ------- demonstration --------------- */
        // generate html file from xml
        XMLToHTML.convertXMLToHTML("notes_ginf2.xml", "notes.xsl", "mat1");
    }
}
