<%@ Page language="c#" Codebehind="WebForm1.aspx.cs" AutoEventWireup="false" Inherits="ChatSystem.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr vAlign="top">
					<td style="HEIGHT: 530px" vAlign="top" width="80%"><asp:panel id="pnlChat" Width="100%" Runat="server" Height="530px" BackColor="#FFFFC0"></asp:panel></td>
					<td style="HEIGHT: 530px" vAlign="top" width="20%"><asp:panel id="pnlUser" Width="100%" Runat="server" Height="530px" BackColor="#FFE0C0"></asp:panel></td>
				</tr>
				<tr vAlign="top">
					<td style="HEIGHT: 108px" colSpan="2"><asp:panel id="pnlSay" Width="100%" Runat="server" Height="108px" BackColor="#C0C0FF">
							<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR vAlign="top">
									<TD style="HEIGHT: 36px" width="100%">
										<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD width="15%">发送至
												</TD>
												<TD width="85%"><SELECT id="slcUser"></SELECT>
												</TD>
											</TR>
										</TABLE>
										
								</TR>
								<TR vAlign="top">
									<TD width="100%">
										<INPUT id="txtSay" style="FONT-WEIGHT: bold; WIDTH: 100%; COLOR: #ff6666; FONT-FAMILY: 'Arial Black'; HEIGHT: 64px"
											type="text" size="175"></TD>
									</TD>
								</TR>
								<tr>
									<td width=100% align=center>
										<input type=button value="发送" id="btnSend"/>
										<input type=button value="退出" id="btnExit"/>
									</td>
								</tr>
							</TABLE>
						</asp:panel></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
