<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" />
  <xsl:key name="DEF" match="node()" use="@def"/>
  <!-- Transformacja tożsamościowa -->
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>

  <!-- Podstawienie Elementu definicji za Element referencyjny -->
  <xsl:template match="node()[@ref]">
    <xsl:apply-templates select="key('DEF', @ref)" />
  </xsl:template>

  <!-- Po natrafieniu na atrybut def nic nie robi -->
  <xsl:template match="@def" />
</xsl:stylesheet>