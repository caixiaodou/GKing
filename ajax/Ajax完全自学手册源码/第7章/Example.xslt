<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/A">
		<html>
			<head>
				<title>简单XSLT实例</title>
			</head>
			<body>
				<div style="text-align:center;color:#8679B9;font-size:24px;font-style: normal;font-variant: normal;font-weight: bolder;">
					<ul>
						<li>
							<xsl:value-of select="/A/C"></xsl:value-of>
						</li>
					</ul>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
