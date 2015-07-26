<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="ChatSystem._Default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Default</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" src="/ChatSystem/JS/NotfyCode.js"></script>
		<link rel="stylesheet" href="/ChatSystem/Css/niftyCorners.css/">
		<link rel="stylesheet" href="/ChatSystem/Css/style.css">
		<script type="text/javascript">
		window.onload=function(){
		Nifty("div#main","normal top transparent");
		Nifty("div#footer","normal bottom transparent");
		document.Form1.txtUsername.focus();
		}
		</script>
	</HEAD>
	<body>
		<h1>Ajax无刷新聊天室</h1>
		<form id="Form1" method="post" runat="server">
			<div id="main" align="center">
				<h2>服务器状态</h2>
				<table>
					<tr>
						<td><strong>在线人数</strong></td>
						<td>:</td>
						<td><%= ChatSystem.Global.Engine.Users.Length.ToString() %></td>
					</tr>
					<tr>
						<td><strong>聊天记录长度</strong></td>
						<td>:</td>
						<td><%= ChatSystem.Global.Engine.BufferText.Length.ToString() %></td>
					</tr>
					<tr>
						<td><strong>用户名</strong></td>
						<td>:</td>
						<td><asp:textbox id="txtUsername" runat="server"></asp:textbox>
							&nbsp;
							<asp:button id="btnLogin" runat="server" Text="登陆"></asp:button></td>
					</tr>
					<tr>
						<td colspan="3" class="error"><asp:literal id="lblErrorMsg" runat="server" EnableViewState="False"></asp:literal></td>
					</tr>
				</table>
			</div>
			<div id="footer"></div>
		</form>
	</body>
</HTML>
