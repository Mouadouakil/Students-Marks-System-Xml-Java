<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns:fo= "http://www.w3.org/1999/XSL/Format">
    <xsl:template match="Attestation">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple-page" 
                    page-height= "25cm"
                    page-width="19cm" 
                    margin-top= "2cm "
                    margin-bottom= "2cm"
                    margin-left="2cm"
                    margin-right="2cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>  
            <fo:page-sequence master-reference= "simple-page"> 
                <fo:flow flow-name="xsl-region-body">
                    <fo:block 
                        border= "2 px solid black"
                        padding="4mm"
                        space-after="18mm" > 
                        <fo:block 
                            font-weight="bold"
                            font-family= "Helvetica"
                            font-size="24pt"
                            text-align="center"
                        border= "3px solid black"
                        space-before ="8mm"
                        space-after="18mm"
                        padding="2mm">
                            Attestation de réussite
                    </fo:block>
                        <fo:block>
                            Je soussigné Monsieur le directeur adjoint déclare que l'élève a réussi son année scolaire.
                        </fo:block>
                        <fo:block font-weight="bold"
                            font-family="Helvetica"
                            font-size= "18pt"
                            text-align="center"
                            
                            space-after="10mm"
                            padding="2mm">
                            Informations élève:
                        </fo:block>
                        
                        <fo:block 
                            border= "2 px solid black"
                            padding="2mm"
                            space-after="28mm">
                           <fo:block 
                            font-size= "10pt"
                            space-before="14pt "
                            space-after="2mm"
                            line-height= "20pt"
                            text-align="left"
                            start-indent="2mm" >
                               NOM COMPLET: <xsl:value-of select="eleve/nom"/>
                           
                            </fo:block>
                            <fo:block 
                                font-size="10pt"
                                space-after="2mm"
                                start-indent="2mm"
                                line-height="20pt">
                                CNE: <xsl:value-of select="eleve/cne" />
                            </fo:block>
                            <fo:block 
                                font-size="10pt"
                                start-indent="2mm"
                                space-after="2mm"
                                line-height= "20pt">
                                FILIÈRE: <xsl:value-of select= "eleve/filiere"/>
                            </fo:block>
                        </fo:block>
                        <fo:block 
                            font-family="Helvetica"
                            font-size= "16pt"
                            text-align="center"
                            space-after="10mm"
                            padding="2mm">
                            Signature du Directeur Adjoint:
                        </fo:block>
                    </fo:block>
                </fo:flow> 
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>     
                    
