<?xml version="1.0" encoding="UTF-8"?>

<!--
  Document  $Id: cmd_gnome-mime.xsl,v 1.5 2007/01/26 20:02:56 dleidert Exp $
  Summary   XSLT stylesheet to convert XML database into GNOME
            .mime file.
  
  Copyright (C) 2006,2007 Daniel Leidert <daniel.leidert@wgdd.de>.

  This file is free software. The copyright owner gives unlimited
  permission to copy, distribute and modify it.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">


<!-- ********************************************************************* -->
<!-- * Import XSL stylesheets. Define output options.                      -->
<!-- ********************************************************************* -->

<xsl:import href="cmd_common.xsl"/>
<xsl:output method="text"
            encoding="UTF-8"/>


<!-- ********************************************************************* -->
<!-- * Space-stripped and -preserved elements/tokens.                      -->
<!-- ********************************************************************* -->

<xsl:strip-space elements="*"/>


<!-- ********************************************************************* -->
<!-- xsl:template match (modes) section                                    -->
<!-- ********************************************************************* -->

<xsl:template match="/">
  <!-- * Output content to 'chemical-mime-data.mime'.                      -->
  <!-- * Then process the whole file.                                      -->
	<xsl:call-template name="common.write.chunk">
		<xsl:with-param name="filename" select="'chemical-mime-data.mime'"/>
		<xsl:with-param name="method" select="'text'"/>
		<xsl:with-param name="indent" select="'yes'"/>
		<xsl:with-param name="omit-xml-declaration" select="'yes'"/>
		<xsl:with-param name="media-type" select="'text/plain'"/>
		<xsl:with-param name="doctype-public" select="''"/>
		<xsl:with-param name="doctype-system" select="''"/>
		<xsl:with-param name="content">
			<xsl:call-template name="common.header.text"/>
			<xsl:apply-templates select=".//mime-type[@support = 'yes'
			                             and not(conflicts[@gnome = 'yes'])]">
				<xsl:sort select="@type"/>
			</xsl:apply-templates>
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template match="mime-type">
	<xsl:value-of select="@type"/>
	<xsl:text>&#10;</xsl:text>
	<xsl:text>	ext:</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>&#10;&#10;</xsl:text>
</xsl:template>

<xsl:template match="glob">
	<xsl:text> </xsl:text>
	<xsl:value-of select="substring-after(@pattern,'.')"/>
</xsl:template>

<xsl:template match="acronym|alias|application|comment|expanded-acronym|icon|
                     magic|match|root-XML|specification|sub-class-of|supported-by"/>

</xsl:stylesheet>

