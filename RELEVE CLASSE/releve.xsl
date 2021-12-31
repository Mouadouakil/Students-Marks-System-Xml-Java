<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    
    
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" 
                    page-height="30cm" page-width="25cm" 
                    margin-top="0.5cm" margin-bottom="0.5cm"
                    margin-left="0.3cm" margin-right="0.5cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="16pt"
                        font-family="sans-serif"
                        line-height="20pt"
                        text-align="center"
                        margin-bottom="0.5cm">RELEVÉ DE NOTES GINF2</fo:block>
                    <fo:block>
                        <fo:table border="1pt solid black" text-align="center" border-spacing="10pt" table-layout="fixed">
                            <fo:table-column column-width="100px"/>
                            <fo:table-column column-width="100px"/>
                            <fo:table-column column-width="110px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="70px"/>
                            <fo:table-column column-width="100px"/>
                            
                            
                            <!-- HEADER -->
                            <fo:table-header>        
                                <fo:table-row>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">CNE</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">FirstName</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">LastName</fo:block>
                                    </fo:table-cell>
                                    <xsl:for-each select="//Note[1]/matiere">
                                        <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                            <fo:block text-align="center" font-weight="bold"><xsl:value-of select="@codeMat" /></fo:block>
                                        </fo:table-cell>
                                    </xsl:for-each>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">MOY</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            
                            <!-- BODY -->
                            <fo:table-body>
                                <!-- 1er ligne -->
                                <xsl:for-each select="//Note">
                                    <fo:table-row>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center"><xsl:value-of select="./CNE" /></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center"><xsl:value-of select="./FirstName" /></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center"><xsl:value-of select="./LastName" /></fo:block>
                                        </fo:table-cell>
                                        <xsl:for-each select="./matiere">
                                            <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                                <fo:block text-align="center"><xsl:value-of select="./@note" /></fo:block>
                                            </fo:table-cell>
                                        </xsl:for-each>
                                        
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center" font-weight="bold"> 
                                                <xsl:variable name="number" select=" avg(for $n in matiere/@note return $n)  "/>
                                                <xsl:value-of select=" format-number($number, '#.##')"/>/20
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                                <fo:table-row>
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-columns-spanned="3">
                                        <fo:block text-align="center" font-weight="bold">Resultat:</fo:block>
                                    </fo:table-cell>
                            
                            
                                <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                   <fo:block>
                                       <xsl:variable name="number" select="avg (NotesClasse/Note/matiere[position()=1])"/>
                                       <xsl:value-of select=" format-number($number, '#.###')"/>
                                   </fo:block>
                                    
                               </fo:table-cell>
                                    
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=2] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                    
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg( NotesClasse/Note/matiere[position()=3] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                    
                                  
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=4] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                    
                                   
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=5] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                    
                                </fo:table-cell>
                                    
                                   
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=6] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                 
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=7] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                    
                                    
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=8] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1" >
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=9] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=10] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                        <xsl:variable name="number" select="avg(NotesClasse/Note/matiere[position()=11] )"/>
                                        <xsl:value-of select=" format-number($number, '#.###')"/>
                                    </fo:block>
                                </fo:table-cell>
                                
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                    <fo:block>
                                       
                                    </fo:block>
                                </fo:table-cell>
                                </fo:table-row>
           
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    
</xsl:stylesheet>