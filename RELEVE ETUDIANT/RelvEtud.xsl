<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    
    
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" 
                    page-height="30cm" page-width="25cm" 
                    margin-top="0.5cm" margin-bottom="0.5cm"
                    margin-left="1cm" margin-right="1cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="16pt"
                        font-family="sans-serif"
                        line-height="20pt"
                        text-align="center"
                        margin-bottom="0.5cm">RELEVÉ DE NOTES DE INSAF BENZAKOUR</fo:block>
                    <fo:block>
                        <fo:table border="1pt solid black" text-align="center" border-spacing="10pt" table-layout="fixed">
                            <fo:table-column column-width="350px"/>
                            <fo:table-column column-width="350px"/>
                            <fo:table-column column-width="340px" />
                            <fo:table-column column-width="200px" />
                            <fo:table-column column-width="200px" />
                            <fo:table-column column-width="200px" />
                            <fo:table-column column-width="200px" />
                            <fo:table-column column-width="200px" />
          
                            
                            <!-- HEADER -->
                            <fo:table-header>        
                                <fo:table-row>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">MODULE</fo:block>
                                    </fo:table-cell>
                                    
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">MATIERE</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="10pt" border="1pt solid black" background-color="#e6e4e1">
                                        <fo:block text-align="center" font-weight="bold">NOTE</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            
                            <!-- BODY -->
                            <fo:table-body>
                                <!-- 1er ligne -->
                                <xsl:for-each select="//Module">
                                    <fo:table-row>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="2">
                                            <fo:block text-align="center"><xsl:value-of select="@name" /></fo:block>
                                        </fo:table-cell>
                                        
                                        <xsl:for-each select="./Matiere[1]">
                                            <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                                <fo:block text-align="center"><xsl:value-of select="@name" /></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                                <fo:block text-align="center"><xsl:value-of select="@note" /></fo:block>
                                            </fo:table-cell>
                                        </xsl:for-each>
                                    </fo:table-row>
                                    <xsl:for-each select="./Matiere[2]">
                                        <fo:table-row>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center"><xsl:value-of select="@name" /></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                            <fo:block text-align="center"><xsl:value-of select="@note" /></fo:block>
                                        </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <fo:table-row background-color="green">
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-columns-spanned="2">
                                        <fo:block text-align="center" font-weight="bold">Resultat:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="10pt" border="1pt solid black" number-rows-spanned="1">
                                        <fo:block text-align="center" font-weight="bold"> 
                                            <xsl:variable name="number" select=" avg(Releve/Modules/Module/Matiere[position()=2])  "/>
                                            <xsl:value-of select=" format-number($number, '#.##')"/>/20
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