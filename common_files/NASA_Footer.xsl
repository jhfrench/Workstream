<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" standalone="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>RSS Feed for NASA Footer</title>
				<style>
				.off {
				text-decoration:none;
				color:black;
				}
				.on {
				text-decoration:underline;
				color:black;
				}

				</style>

			</head>
			<body bgcolor="#cccccc">
				<font face="arial, helvetica">
				<p style="font-size:70%">
				<xsl:for-each select="//item">
					<a class="off" onmouseover="this.className='on';" onmouseout="this.className='off';">
					  <xsl:attribute name="href">
					  	<xsl:value-of select="link"/>
					  </xsl:attribute>
					  <xsl:attribute name="target">
					  	<xsl:text>target='_new'</xsl:text>
					</xsl:attribute>
					  	<font color="#000000"><xsl:value-of select="title"/></font>
					</a>
					<br />
				</xsl:for-each>
				</p>
			</font>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
