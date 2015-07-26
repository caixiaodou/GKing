<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:本书="http://blog.csdn.net/hongbo0521">
	<xsl:template match="Book">
		<html>
			<head>
				<title>解析作者与读者资料</title>
			</head>
			<body>
				<div align="center" style="text-alignt:center;back-color:blue;width:100%">
					书籍名称：
					<span style="text-align:center;font-weight:bold">
						<xsl:value-of select="@name"></xsl:value-of>
					</span>
					数据报表
				</div>
				<hr size="1" style="color:red;"/>
				<xsl:apply-templates select="本书:Writer"/>
				<hr size="1" style="color:red;"/>
				<div align="center" style="border:solid 1px gray">
					<div align="center" style="background-color: #ffcc99; cursor:hand;">读者</div>
					<div>
						<table cellspacing="0" width="80%">
							<tbody>
								<!--
									通过模板调用遍历所有的student子元素
								-->
								<xsl:apply-templates select="本书:Reader"/>
							</tbody>
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="本书:Writer">
		<div style="border:solid 1px gray;">
			<div style="background-color:#ffcc99;cursor:hand;text-align:center">作者</div>
			<div id="Writer">
				<table align="center">
					<tbody>
						<tr>
							<td>
								姓名
							</td>
							<td>
								<xsl:value-of select="@Name"></xsl:value-of>
							</td>
							<td>
								邮箱
							</td>
							<td>
								<xsl:value-of select="@Email"></xsl:value-of>
							</td>
							<td>
								年龄
							</td>
							<td>
								<xsl:value-of select="@Age"></xsl:value-of>
							</td>
							<td>
								QQ号码
							</td>
							<td>
								<xsl:value-of select="@QQNumber"></xsl:value-of>
							</td>
							<td>
								性别
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="@Sex">
										<xsl:value-of select="@Sex"></xsl:value-of>
									</xsl:when>
									<xsl:otherwise>
										<span style="#CCCCCC">未知</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center" style="background-color:#D9E1F7;text-align:center">
					作者IT技能列表
					<table width="80%" cellspacing="0">
						<tbody>
							<xsl:for-each select="本书:Skills/本书:Skill">
								<tr>
									<xsl:choose>
									<xsl:when test="position() mod 2=0">
										<xsl:attribute name="bgcolor">#ddffdd</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="bgcolor">#ddddff</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
									<td>技能<xsl:value-of select="position()"></xsl:value-of></td>
									<td>
										<xsl:value-of select="@SkillName"></xsl:value-of>
									</td>
									<td>
										<xsl:value-of select="@SkillLevel"></xsl:value-of>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="本书:Reader">
		<div style="border:solid 1px gray;">
			<div style="background-color:#ffcc99;cursor:hand;text-align:center">读者</div>
			<div id="Reader">
				<div align="center" style="background-color:#D9E1F7;text-align:center">
					<table width="80%" cellspacing="0">
						<tbody>
								<tr>
									<td>
										姓名
									</td>
									<td>
										<xsl:value-of select="@Name"></xsl:value-of>
									</td>
									<td>
										邮箱
									</td>
									<td>
										<xsl:value-of select="@Email"></xsl:value-of>
									</td>
									<td>
										年龄
									</td>
									<td>
										<xsl:value-of select="@Age"></xsl:value-of>
									</td>
									<td>
										QQ号码
									</td>
									<td>
										<xsl:choose>
											<xsl:when test="@QQNumber">
												<xsl:value-of select="@QQNumber"></xsl:value-of>
											</xsl:when>
											<xsl:otherwise>
												<span style="#CCCCCC">未知</span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td>
										性别
									</td>
									<td>
										<xsl:choose>
											<xsl:when test="@Sex">
												<xsl:value-of select="@Sex"></xsl:value-of>
											</xsl:when>
											<xsl:otherwise>
												<span style="#CCCCCC">未知</span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
