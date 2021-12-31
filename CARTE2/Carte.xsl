<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:b="http://businesscard.org"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="b:card">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple"
                    page-height="5.5cm"
                    page-width="8.6cm"
                    margin-top="0.3cm"
                    margin-bottom="0.3cm"
                    margin-left="0.3cm"
                    margin-right="0.3cm">
                    <fo:region-body background-color="#c5d3e8"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table>
                        <fo:table-column column-width="2.5cm"/>
                        <fo:table-column column-width="5.5cm"/>
                        
                        <fo:table-header>
                            <fo:table-row >
                                <fo:table-cell number-columns-spanned="2">
                                    <fo:block font-size="16pt"
                                        font-family="sans-serif"
                                        line-height="18pt"
                                        margin-top="0.2cm"
                                        text-align="center">
                                        <xsl:value-of select="b:title"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        
                        <fo:table-body>
                            <fo:table-row>
                                
                                <fo:table-cell>
                                    <xsl:if test="b:logo">
                                        <fo:block  margin-top="0.5cm"
                                            margin-left="0.1cm">
                                            <fo:external-graphic src="url({b:logo/@uri})"
                                                content-width="2.5cm"/>
                                        </fo:block>
                                    </xsl:if>
                                    <fo:block font-size="14pt"
                                        font-family="sans-serif"
                                        line-height="20pt"
                                        margin-left="0.3cm">
                                        <xsl:value-of select="b:Cin"/>
                                    </fo:block>
                                </fo:table-cell>
                                
                                <fo:table-cell>
                                    <fo:block font-size="14pt"
                                        font-family="sans-serif"
                                        line-height="20pt"
                                        margin-left="0.3cm"
                                        margin-top="0.7cm">
                                        <xsl:value-of select="b:LastName"/>
                                    </fo:block>
                                    <fo:block font-size="14pt"
                                        font-family="sans-serif"
                                        line-height="20pt"
                                        margin-left="0.3cm">
                                        <xsl:value-of select="b:FirstName"/>
                                    </fo:block>
                                    <fo:block font-size="14pt"
                                        font-family="sans-serif"
                                        line-height="20pt"
                                        margin-left="0.3cm">
                                        <xsl:value-of select="b:CNE"/>
                                    </fo:block>
                                    <fo:block font-size="12pt"
                                        font-family="sans-serif"
                                        line-height="5pt"
                                        margin-top="0.6cm"
                                        text-align="center">
                                        <xsl:value-of select="b:Inscription"/>
                                    </fo:block>
                                </fo:table-cell>
                              
                               
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>