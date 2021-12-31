<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  
  
  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="17cm" page-width="25.7cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">
          
          <fo:block>
            <fo:table border="0.5pt solid black" text-align="center" border-spacing="3pt" table-layout="fixed">
              <fo:table-column column-width="150px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              
              <!-- HEADER -->
              <fo:table-header>        
                <fo:table-row>
                  <fo:table-cell padding="4pt" border="1pt solid black" background-color="blue" number-columns-spanned="11">
                    <fo:block text-align="center" font-weight="bold">
                      Emploi du temps de la  <xsl:value-of select="emploidutemps/emploidutemps_avant_cc/semaine/text()" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              
              <!-- BODY -->
              <fo:table-body>
                <!-- 1er ligne -->
                <fo:table-row>
                  <fo:table-cell padding="6pt" border="1pt solid blue" background-color="C59696" number-rows-spanned="1">
                    <fo:block text-align="center" font-weight="bold">Heure/Jours </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Lundi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Mardi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Mercredi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Jeudi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Vendredi </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure">
                    <xsl:with-param name="hour">9h00-10h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure">
                    <xsl:with-param name="hour">10h45-12h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="10mm" >
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="11" background-color="yellow">
                    <fo:block> PAUSE DÉJEUNER </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure">
                    <xsl:with-param name="hour">13h45-15h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure">
                    <xsl:with-param name="hour">16h00-17h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                
                
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
      
      
      
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">
          
          <fo:block>
            <fo:table border="0.5pt solid black" text-align="center" border-spacing="3pt" table-layout="fixed">
              <fo:table-column column-width="150px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              <fo:table-column column-width="90px" />
              <fo:table-column column-width="90px"/>
              
              <!-- HEADER -->
              <fo:table-header>        
                <fo:table-row>
                  <fo:table-cell padding="4pt" border="1pt solid black" background-color="blue" number-columns-spanned="11">
                    <fo:block text-align="center" font-weight="bold">
                      Emploi du temps de la  <xsl:value-of select="emploidutemps/emploidutemps_apres_cc/semaine/text()" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              
              <!-- BODY -->
              <fo:table-body>
                <!-- 1er ligne -->
                <fo:table-row>
                  <fo:table-cell padding="6pt" border="1pt solid blue" background-color="C59696" number-rows-spanned="1">
                    <fo:block text-align="center" font-weight="bold">Heure/Jours </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Lundi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Mardi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Mercredi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Jeudi </fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="2" background-color="c59696">
                    <fo:block> Vendredi </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure2">
                    <xsl:with-param name="hour">9h00-10h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure2">
                    <xsl:with-param name="hour">10h45-12h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="10mm" >
                  <fo:table-cell padding="6pt" border="0.5pt solid black" number-columns-spanned="11" background-color="yellow">
                    <fo:block> PAUSE DÉJEUNER </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure2">
                    <xsl:with-param name="hour">13h45-15h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                <fo:table-row height="30mm">
                  <xsl:call-template name="heure2">
                    <xsl:with-param name="hour">16h00-17h30</xsl:with-param>  
                  </xsl:call-template>
                </fo:table-row>
                
                
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  
  <xsl:template name="heure">
    <xsl:param name="hour" /> 
    <fo:table-cell padding="6pt" border="1pt solid blue" background-color="silver" number-rows-spanned="1">
      <fo:block> <xsl:value-of select="$hour"/> </fo:block>   
    </fo:table-cell>
    
    <xsl:for-each select="emploidutemps/emploidutemps_avant_cc/heures/heure[@debut=$hour]">
      <xsl:for-each select="./*/cours">
        <fo:table-cell padding="6pt" border="0.5pt solid black" number-rows-spanned="{@heure div 2}" number-columns-spanned="{@groupe}" vertical-align="bottom">
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="matiere"/> 
          </fo:block>
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="professeur"/> 
          </fo:block>
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="salle"/> 
          </fo:block>
        </fo:table-cell>
      </xsl:for-each >
    </xsl:for-each>   
  </xsl:template>
  
  <xsl:template name="heure2">
    <xsl:param name="hour" /> 
    <fo:table-cell padding="6pt" border="1pt solid blue" background-color="silver" number-rows-spanned="1">
      <fo:block> <xsl:value-of select="$hour"/> </fo:block>   
    </fo:table-cell>
    
    <xsl:for-each select="emploidutemps/emploidutemps_apres_cc/heures/heure[@debut=$hour]">
      <xsl:for-each select="./*/cours">
        <fo:table-cell padding="6pt" border="0.5pt solid black" number-rows-spanned="{@heure div 2}" number-columns-spanned="{@groupe}" vertical-align="bottom">
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="matiere"/> 
          </fo:block>
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="professeur"/> 
          </fo:block>
          <fo:block vertical-align="bottom"> 
            <xsl:value-of select="salle"/> 
          </fo:block>
        </fo:table-cell>
      </xsl:for-each >
    </xsl:for-each>   
  </xsl:template>
  
  
 
</xsl:stylesheet>