import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.crypto.dsig.TransformException;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

public class PDFGenerator {

    public PDFGenerator() {
        //
    }

    
    public static void generateStudentCard(String xmlFile, String studentCode)
            throws IOException, FOPException, TransformException, TransformerException {

        String filesPath = System.getProperty("user.dir") + "\\src\\";
        
        // XSLT FO File
        String xsltFileLocation = filesPath + "\\XSLTFiles\\Student_Card_Gen.xsl";
        File xsltFile = new File(xsltFileLocation);

        // the XML file wich provide the source
        String xmlFileLocation = filesPath + "\\XMLFiles\\" + xmlFile;
        StreamSource xmlSource = new StreamSource(new File(xmlFileLocation));

        // create an instance of fop factory
        FopFactory fopFactory = FopFactory.newInstance();
        // user agent object is needed for transformation
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        // creaate new PDF File
        String PDFFileLocation = filesPath + "\\PDFFiles\\student_" + studentCode + "_card.pdf";
        File pdfFile = new File(PDFFileLocation);

        // setup output
        OutputStream out;
        out = new FileOutputStream(pdfFile);

        try {
            // fop with desired output extension
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            // setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            // change student code param in xsl file
            // code is a String should be passed in the params
            transformer.setParameter("student_code", studentCode);

            Result result = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            // That's where the XML is first transformed to XSL-FO and then
            // PDF is created
            transformer.transform(xmlSource, result);
            System.out.println("\n\n\n\n\nstudent_" + studentCode + "_card.pdf generated succesfully at " + filesPath + "\\PDFFiles\n\n\n\n\n");
        } finally {
            out.close();
        }
    }

    public static void generateReleveDeNote(String xmlFile)
            throws IOException, FOPException, TransformException, TransformerException {

        String filesPath = System.getProperty("user.dir") + "\\src\\";
        // XSLT FO File
        String xsltFileLocation = filesPath + "\\XSLTFiles\\emploidutemps.xsl";
        File xsltFile = new File(xsltFileLocation);

        // the XML file wich provide the source
        String xmlFileLocation = filesPath + "\\XMLFiles\\" + xmlFile;
        StreamSource xmlSource = new StreamSource(new File(xmlFileLocation));

        // create an instance of fop factory
        FopFactory fopFactory = FopFactory.newInstance();
        // user agent object is needed for transformation
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        // creaate new PDF File
        String PDFFileLocation = filesPath + "\\PDFFiles\\emploidutemps.pdf";
        File pdfFile = new File(PDFFileLocation);

        // setup output
        OutputStream out;
        out = new FileOutputStream(pdfFile);

        try {
            // fop with desired output

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);


            // setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            Result result = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            // That's where the XML is first transformed to XSL-FO and then
            // PDF is created
            transformer.transform(xmlSource, result);
            System.out.println("\n\n\n\nreleve de note generated\n\n\n");
        } finally {
            out.close();
        }
    }
    public static void main(String[] args) {
        String xmlFile = "emploidutemps.xml";
        String studentCode = "123";
        try {

            generateReleveDeNote(xmlFile);

        } catch (IOException | FOPException | TransformerException | TransformException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}
