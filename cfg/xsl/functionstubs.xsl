<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs opentopic"
  version="2.0"
  xmlns:mm="http://www.miramo.com/XSL/Transform"
  xmlns:opentopic="http://www.idiominc.com/opentopic"
  >
  
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  	*** I M P O R T A N T ! ! !
  	DO NOT MODIFY THE ORIGINAL COPY OF THIS FILE in com.miramo.mmpdf, ONLY MODIFY the copy
	located in your customization plugin, eg com.mycompany.mycompany-mmpdf/cfg/xsl/functionstubs.xsl
	***
  -->
  
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	Modify this file to add or override your own format definitions. For example,
	you might want to override a particular <ColorDef>, or other format definition,
	for a given product type, perhaps driven by setting an ant build parameter - 
	an example is included below.
	
	Do not use this file for adding new language specific variables - this is done
	by changing cfg/strings/*.xml files, see the GettingStarted guide for details.
	
	-->
  <!--  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <xsl:template name="mm:customMakeDocumentFormatDefs">
    <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    Called from: utilities.xsl:makeDocumentFormatDefs
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --> 

  	<!-- override DocumentColor1 (used for topic titles) depending on product name specified in $userVariable1 -->
  	<xsl:choose>
  		<!-- 'product1' uses Green titles -->
  		<xsl:when test="$userVariable1 = 'product1'">
  			<ColorDef colorDef="DocumentColor1" red="0" green="100" blue="0"/>
  		</xsl:when>
  		<!-- 'product2' uses Blue titles -->
  		<xsl:when test="$userVariable1 = 'product2'">
  			<ColorDef colorDef="DocumentColor1" red="0" green="0" blue="100"/>
  		</xsl:when>
  		<!-- Default is to use DocumentColor1 spec from MFD template -->
  		<xsl:otherwise/>
  	</xsl:choose>
  		
  	
  </xsl:template>
  
</xsl:stylesheet>