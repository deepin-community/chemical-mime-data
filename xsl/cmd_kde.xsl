<?xml version="1.0" encoding="UTF-8"?>

<!--
  Document  $Id: cmd_kde.xsl,v 1.6 2007/01/26 20:02:56 dleidert Exp $
  Summary   XSLT stylesheet to convert XML database into KDE
            .desktop files.
  
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
<!-- * xsl:template match (modes) section                                  -->
<!-- ********************************************************************* -->

<xsl:template match="/">
	<xsl:apply-templates select=".//mime-type[@support = 'yes'
	                             and not(conflicts[@kde = 'yes'])]">
		<xsl:sort select="@type"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="mime-type">
  <!-- * Output the content for every chemical MIME type to a separate     -->
  <!-- * file, named from mime-type[@type]. Then just process the content  -->
  <!-- * of the currently processed mime-type node.                        -->
	<xsl:call-template name="common.write.chunk">
		<xsl:with-param name="filename" select="concat(substring-after(@type,'/'),'.desktop')"/>
		<xsl:with-param name="method" select="'text'"/>
		<xsl:with-param name="indent" select="'yes'"/>
		<xsl:with-param name="omit-xml-declaration" select="'yes'"/>
		<xsl:with-param name="media-type" select="'text/plain'"/>
		<xsl:with-param name="doctype-public" select="''"/>
		<xsl:with-param name="doctype-system" select="''"/>
		<xsl:with-param name="content">
			<xsl:call-template name="kde.desktop.header"/>
			<xsl:text>MimeType=</xsl:text>
			<xsl:value-of select="@type"/>
			<xsl:text>&#10;</xsl:text>
			<xsl:apply-templates select="comment|icon"/>
			<xsl:if test="not(child::icon)">
				<xsl:call-template name="kde.desktop.generic.icon"/>
			</xsl:if>
      <!-- * Output the pattern in alphabetical order.                     -->
			<xsl:apply-templates select="glob">
				<xsl:sort select="@pattern"/>
			</xsl:apply-templates>
			<xsl:text>&#10;</xsl:text>
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template match="comment">
	<xsl:text>Comment</xsl:text>
	<xsl:if test="@xml:lang != ''">
		<xsl:text>[</xsl:text>
		<xsl:value-of select="@xml:lang"/>
		<xsl:text>]</xsl:text>
	</xsl:if>
	<xsl:text>=</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="icon">
	<xsl:text>Icon=</xsl:text>
	<xsl:choose>
		<xsl:when test="@kde != ''">
			<xsl:value-of select="@kde"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>chemistry</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="glob">
  <!-- * The pattern must occur in the Pattern field.                      -->
	<xsl:if test="position() = 1">
		<xsl:text>Patterns=</xsl:text>
	</xsl:if>
	<xsl:value-of select="@pattern"/>
	<xsl:text>;</xsl:text>
  <!-- * And after the last pattern we need a newline.                     -->
	<xsl:if test="position() = last">
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="acronym|alias|application|expanded-acronym|
                     magic|match|root-XML|specification|sub-class-of|supported-by"/>


<!-- ********************************************************************* -->
<!-- * Named templates for special processing and functions.               -->
<!-- ********************************************************************* -->

<xsl:template name="kde.desktop.header">
  <!-- * The header of a KDE MIME(lnk) .desktop file always looks the      -->
  <!-- * same. Output the header here.                                     -->
	<xsl:text>[Desktop Entry]
Encoding=UTF-8
Type=MimeType&#10;</xsl:text>
</xsl:template>

<xsl:template name="kde.desktop.generic.icon">
  <!-- * Just output the completely processed and (maybe) extended output  -->
  <!-- * without escaping the content. This saves added acronym templates  -->
  <!-- * tags.                                                             -->
	<xsl:text>Icon=chemistry&#10;</xsl:text>
</xsl:template>

</xsl:stylesheet>

