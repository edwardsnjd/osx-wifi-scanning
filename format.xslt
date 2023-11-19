<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <xsl:template match="/">
    <xsl:variable name="tab">
      <xsl:text>&#x9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="newline">
      <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:for-each select="plist/array/dict">
      <xsl:value-of select="concat(
        key[text()='SSID_STR']/following-sibling::string,  $tab,
        key[text()=   'BSSID']/following-sibling::string,  $tab,
        key[text()= 'CHANNEL']/following-sibling::integer, $tab,
        key[text()=    'RSSI']/following-sibling::integer, $newline
      )" />
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
