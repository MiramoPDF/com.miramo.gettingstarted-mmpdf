<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs opentopic"
    version="2.0"
    xmlns:mm="http://www.miramo.com/XSL/Transform"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    >
  <xsl:include href="./functionstubs.xsl"/> 
  
  <!-- Support for <row> @outputclass='subhead': provide overrides for 
    addCustomRowAttributes (handles keep with next) and 
    addCustomCellAttributes (applies custom table cell formatting)
  MiramoXML attribute names and values are specified in the mmComposer Reference Guide
  -->
 
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Override addCustomRowAttributes extension point to check for @outputclass=subheading to set keepWithNext property
    to prevent orphaned subheading rows -->
  <xsl:template name="addCustomRowAttributes">
      <xsl:if test="@outputclass = 'subheading' or *[@outputclass='subheading']">
        <xsl:attribute name="withNext">Y</xsl:attribute>
      </xsl:if>
  </xsl:template>
   
  <!-- Override addCustomRowAttributes extension point to check for @outputclass=subheading on parent to set cell formatting attributes -->
  <xsl:template name="addCustomCellAttributes">
    <xsl:if test="contains(../@outputclass, 'subheading')">
      <xsl:attribute name="paraDef">tableHeader</xsl:attribute>
      <xsl:attribute name="fillColor">none</xsl:attribute>
      <xsl:attribute name="topRule">Thin</xsl:attribute>
      <xsl:attribute name="bottomRule">Very Thin</xsl:attribute>
      <xsl:attribute name="topMargin">8pt</xsl:attribute>     
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="addCustomParagraphAttributes">
    <xsl:if test="contains(@outputclass, 'mmpdf:skipFloats:')">
      <xsl:attribute name="skipFloats"><xsl:value-of select="mm:getKeyValue('mmpdf:skipFloats:', @outputclass)"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>