<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs opentopic"
    version="2.0"
    xmlns:miramo="http://ExternalFunction.miramo.com"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:mm="http://www.miramo.com/XSL/Transform"
    >
    
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    <!-- Import main Miramo XSL stylesheets, templates may be overridden by including new definitions 
        in this file, or a file imported after these <xsl:import> statements -->
    <xsl:import href="plugin:com.miramo.mmpdf:xsl/map2miramo.xsl"/>   
    <xsl:import href="plugin:com.miramo.mmpdf:xsl/topic2miramo.xsl"/> 
    <xsl:import href="plugin:com.miramo.mmpdf:xsl/utilities.xsl"/>
    
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    <!-- Import useful utilities from the common XSL area. These are used for localization 
    of variables, eg for the <note> element, by means of the get-variable template  -->
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    
    <!-- Use plugin URI scheme: https://www.dita-ot.org/3.3/topics/plugin-coding-conventions.html -->
    <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
    <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
    <xsl:variable name="msgprefix">mmpdf</xsl:variable>
    <!-- Include custom.xsl local to this plugin -->
    <xsl:include href="../cfg/xsl/custom.xsl"/>
    
    <xsl:include href="plugin:com.miramo.mmpdf:xsl/params.xsl"/>
    <xsl:variable name="documentXmlLang">
        <xsl:if test="not(mm:xmlLangIsConfigured(*/@xml:lang))">
            <xsl:variable name="message">language <xsl:value-of select="*/@xml:lang"/> is not configured in <xsl:value-of select="$transtype"/> plugin folder 'cfg/langlist.xml' file: unable to process multi-lingual text.
                Add a new entry to the 'cfg/langlist.xml' file, or use a supported value for @xml:lang.</xsl:variable>
            <xsl:value-of select="mm:warn($message)"/>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="not(*/@xml:lang)"><xsl:value-of select="$defaultDocumentXmlLang"/></xsl:when>
            <xsl:when test="mm:xmlLangIsConfigured(*/@xml:lang)"><xsl:value-of select="lower-case(*/@xml:lang)"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$defaultDocumentXmlLang"/></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
    <!-- root template match is in map2miramo.xsl -->
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

</xsl:stylesheet>