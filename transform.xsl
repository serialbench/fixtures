<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <report>
      <xsl:apply-templates select="//user | //record | //database | //cache"/>
      <total>
        <xsl:value-of select="count(//user) + count(//record)"/>
      </total>
    </report>
  </xsl:template>
  <xsl:template match="user">
    <row kind="user" id="{@id}" label="{name}"/>
  </xsl:template>
  <xsl:template match="record">
    <row kind="record" id="{@id}" label="{data/field1}"/>
  </xsl:template>
  <xsl:template match="database">
    <row kind="database" label="{name}"/>
  </xsl:template>
  <xsl:template match="cache">
    <row kind="cache" label="{ttl}"/>
  </xsl:template>
</xsl:stylesheet>
