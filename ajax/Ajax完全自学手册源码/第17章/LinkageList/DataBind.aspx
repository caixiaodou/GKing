<%@ Page language="c#" Codebehind="DataBind.aspx.cs" AutoEventWireup="false" Inherits="LinkageList.DataBind" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<script type="text/javascript" language="javascript">
			var xmlHttp;
	var provinceID=0;
			function  createXmlHttp()
			{
				if(window.ActiveXObject)
				{
					xmlHttp=new ActiveXObject('Microsoft.XMLHTTP');
				}
				else if(window.XMLHttpRequest)
				{
					xmlHttp=new XMLHttpRequest();
				}
			}
			
			function startRequest(slcprovinceID)
			{
				createXmlHttp();
				provinceID=slcprovinceID;
				xmlHttp.onreadystatechange=readyStateHandler;
				xmlHttp.open("POST",createQueryString(provinceID),true);
				xmlHttp.send(null);
			}
			
			function readyStateHandler()
			{	
				clearCityList();
				if(xmlHttp.readyState==4)
				{
					if(xmlHttp.status==200)
					{
						changeCity(provinceID);
					}
				}
			}
			
			function changeCity(provinceID)
			{
				clearCityList();
				var xmlDoc=xmlHttp.responseXML;
				var cityIDs=xmlDoc.getElementsByTagName("AreaID");
				var citys=xmlDoc.getElementsByTagName("Name");
				
				for(var i=0;i<citys.length;i++)
				{
					var cityID=cityIDs[i].firstChild.nodeValue;
					var city=citys[i].firstChild.nodeValue;
					var cityOption=new Option(city,cityID);
					
					document.forms[0].ddlCity.options.add(cityOption);
				}
				
				document.forms[0].ddlCity.options[0].selected=true;
			}
			
			
			function clearCityList()
			{
				var myOptions=document.forms[0].ddlCity.options;
				
				for(var i=0;i<myOptions.length;i++)
				{
					document.forms[0].ddlCity.options[i]=null;
				}
			}
			
			function createQueryString(provinceID)
			{
				var queryString="http://localhost/LinkageList/ReadCity.aspx?"+"provinceID="+provinceID;
				return queryString;
			}
		</script>
		<form id="Form1" method="post" runat="server">
			<asp:Label Runat="server" ID="lblProvince">省份</asp:Label>
			<asp:DropDownList Runat="server" ID="ddlProvince"></asp:DropDownList>
			<asp:Label Runat="server" ID="lblCity">城市</asp:Label>
			<asp:DropDownList Runat="server" ID="ddlCity"></asp:DropDownList>
		</form>
	</body>
</HTML>
