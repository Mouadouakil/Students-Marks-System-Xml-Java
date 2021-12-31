<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match = "/"> 
     <html> 
                <body> 
                    <h2>Affichage du module Bases de données</h2> 
                    <table  border="1" cellspacing="0" cellpadding="3">
                    <tr bgcolor = "#9acd32"> 
                        <th>CNE</th> 
                        <th>NoteModule</th> 
                        
                    </tr> 
                    
                    
                        
  <xsl:for-each select="Notes/Note"> 
                            <tr>  
                                <td><xsl:value-of select = "CNE"/></td> 
                                
                                
                                <xsl:if test="M15 &lt;= 8">
                                    <td bgcolor="red">
                                        <xsl:value-of select="M15"/>
                                    </td>
                                </xsl:if>
                                <xsl:if test="M15 &gt;8 ">
                                    <xsl:if test="M15 &lt; 12">
                                        <td bgcolor="orange"><xsl:value-of select="M15"/></td>
                                    </xsl:if>
                                    <xsl:if test="M15 &gt;= 12">
                                        <td bgcolor="green"><xsl:value-of select="M15"/></td>
                                    </xsl:if>
                                </xsl:if> 
                                
                            </tr>
  </xsl:for-each> 
                        
                    </table>
                    
                  
                    <h2>Les etudiants qui doivent passer le rattrapage</h2> 
                    <table  border="1" cellspacing="0" cellpadding="3">
                        <tr bgcolor = "#9acd32"> 
                            <th>CNE</th> 
                            
                            <th>NoteModule</th> 
                        </tr> 
                        
                        
                        
                        <xsl:for-each select="Notes/Note"> 
                            <xsl:if test = "M15 &lt;12 "> 
                                 
                            <tr>  
                                <td><xsl:value-of select = "CNE"/></td> 
                                <td><xsl:value-of select = "M15"/></td> 
                               
                               </tr>
                            </xsl:if> 
                            
                        </xsl:for-each> 
                    </table>
                    
                    
                    
                </body> 
            </html> 
        </xsl:template>  
    </xsl:stylesheet>
