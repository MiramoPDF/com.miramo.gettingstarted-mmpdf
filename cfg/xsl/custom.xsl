<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs opentopic"
    version="2.0"
    xmlns:mm="http://www.miramo.com/XSL/Transform"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    >
  <xsl:include href="./functionstubs.xsl"/> 
  
  <!-- Support for <entry> @outputclass='subhead': provide overrides for standard
  makeOneRow (handles keep with next) and mm:cellAttributesFromOutputClass (applies
  custom table cell formatting 
  MiramoXML attribute names and values are specified in the mmComposer Reference Guide
  -->
 
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Override makeOneRow utility to check for <entry> @outputclass=subheading to set keepWithNext property
    to prevent orphaned subheadings -->
  <xsl:template name="makeOneRow">
    <xsl:param name="type"/>
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    <Row type="{$type}">
      <xsl:call-template name="addRowAttributes"/>
      <xsl:if test="*[@outputclass='subheading']">
        <xsl:attribute name="withNext">Y</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </Row>		
  </xsl:template>
  
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Override mm:cellAttributesFromOutputClass utility to set paragraph format to tableHeader, switch off row shading and add ruling.
       -->
  <xsl:function name="mm:cellAttributesFromOutputClass" as="node()*">
    <xsl:param name="outputclass" as="xs:string?"/>
    <xsl:param name="node" as="node()"/>
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    <xsl:if test="contains($node/@outputclass, 'subheading')">
      <xsl:attribute name="paraDef">tableHeader</xsl:attribute>
      <xsl:attribute name="fillColor">none</xsl:attribute>
      <xsl:attribute name="topRule">Very Thin</xsl:attribute>
      <xsl:attribute name="bottomRule">Very Thin</xsl:attribute>
      <xsl:attribute name="topMargin">8pt</xsl:attribute>
    </xsl:if>
  </xsl:function>
  
  
</xsl:stylesheet>