<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="3.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <report30>
      <xsl:iterate select="//user | //record | //database | //cache">
        <xsl:param name="labels" as="xs:string*" select="()"/>
        <xsl:on-completion>
          <joined><xsl:value-of select="string-join($labels, ', ')"/></joined>
          <count><xsl:value-of select="count($labels)"/></count>
        </xsl:on-completion>
        <xsl:variable name="label" select="string((name, data/field1, ttl)[1])"/>
        <xsl:if test="$label != ''">
          <row kind="{local-name()}" label="{upper-case($label)}"/>
        </xsl:if>
        <xsl:next-iteration>
          <xsl:with-param name="labels" select="if ($label != '') then ($labels, $label) else $labels"/>
        </xsl:next-iteration>
      </xsl:iterate>
    </report30>
  </xsl:template>
</xsl:stylesheet>
