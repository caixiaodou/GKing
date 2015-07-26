<%@ Page language="c#" Inherits="AjaxTest4Cookie.WebForm1" CodeFile="WebForm1.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" language="javascript" src=Cookie.js>
		</script>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						客户姓名
					</td>
					<td>
						<asp:TextBox Runat="server" ID="txtUserName"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						客户EMail
					</td>
					<td>
						<asp:TextBox Runat="server" ID="txtEmail"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<asp:Button Runat="server" ID="btnSubmit" Text="提交" onclick="btnSubmit_Click"></asp:Button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
