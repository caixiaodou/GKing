<%@ Page language="c#" Codebehind="WebForm1.aspx.cs" AutoEventWireup="false" Inherits="Test4Google.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type=text/javascript language=javascript>
			
	var xmlHttp;
			var key;
			var barColor="gray";
			var spanId="block";
			var clearSpan="&nbsp;&nbsp;&nbsp;";
			var timeid;
			
			function createXmlHttp()
			{
				if(window.ActiveXObject)
				{
					xmlHttp=new window.ActiveXObject("Microsoft.XMLHTTP");
				}
				else if(window.XMLHttpRequest)
				{
					xmlHttp=new window.XMLHttpRequest();
				}
			}

			function progressGo()
			{
				createXmlHttp();
				checkDiv();
				var url="http://localhost/Test4Google/WebForm2.aspx?task=start";
				var btn=document.getElementById("btnGo");
				btn.disabled=true;
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange=readyStateChangeHandler;
				xmlHttp.send(null);
			}

			function readyStateChangeHandler()
			{
				if(xmlHttp.readyState==4)
				{
					if(xmlHttp.status==200)
					{
						timeid=window.setTimeout("pollServer()",2000);
					}
				}
			}

			function pollServer()
			{
				createXmlHttp();
				var url="http://localhost/Test4Google/WebForm2.aspx?task=poll&key="+key;
				xmlHttp.open("POST",url,true);
				xmlHttp.onreadystatechange=pollCallBack;
				xmlHttp.send(null);
			}


			function pollCallBack()
			{
				
				if(xmlHttp.readyState==4)
				{
					if(xmlHttp.status==200)
					{
						
						var xmldoc=xmlHttp.responseXML;
						var persentCompletes=xmldoc.getElementsByTagName("percent");
						var persentComplete=persentCompletes[0].firstChild.nodeValue;
						var myIndex=processResult(persentComplete);
						for(var i=1;i<=myIndex;i++)
						{
							var block=document.getElementById("block"+i);
							block.innerHTML=clearSpan;
							block.style.backgroundColor=barColor;
							
							var nextCell=i+1;
							if(nextCell>myIndex && nextCell<=9)
							{
								document.getElementById("block"+nextCell).innerHTML=persentComplete+"%";
							}
							
						}

						if(myIndex<9)
						{
							timeid=window.setTimeout("pollServer()",1000);
						}
						else
						{
							window.clearTimeout(timeid);
							document.getElementById("complete").innerHTML="<b>已完成</b>";
							document.getElementById("pnlProgressBar").disabled=false;	
						}
						
					}
				}
			}

			function processResult(completeIndex)
			{
				var ind;
				
				if(completeIndex.length==1)
				{
					ind=1;
				}
				else if(completeIndex.length==2)
				{
					ind=completeIndex.substring(0,1);
				}
				else
				{
					ind=9;
				}
				
				return ind;
			}


			function checkDiv()
			{
				var progressbar=document.getElementById("pnlProgressbar");
				if(progressbar.style.visibility=="visible")
				{
					clearBar();
					document.getElementById("complete").innerHTML="";
				}
				else
				{
					progressbar.style.visibility="visible";
				}	
			}

			function clearBar()
			{
				for(var i=1;i<10;i++)
				{
					var block=document.getElementById("block"+i);
					block.innerHtml=clearSpan;
					block.style.backgroundColor="white";
				}
			}
		</script>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<div align=center>
				<h1>无刷新进度条</h1>
				<asp:Button Runat=server ID="btnGo" Text="启动进度条"></asp:Button>
			</div>
			<table align=center>
				<tbody>
					<tr>
						<td>
							<asp:Panel ID="pnlProgressBar" runat="server" style="BORDER-RIGHT:black 2px solid; PADDING-RIGHT:2px; BORDER-TOP:black 2px solid; PADDING-LEFT:2px; VISIBILITY:hidden; PADDING-BOTTOM:2px; BORDER-LEFT:black 2px solid; PADDING-TOP:2px; BORDER-BOTTOM:black 2px solid">
								<SPAN id="block1">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block2">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block3">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block4">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block5">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block6">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block7">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block8">&nbsp;&nbsp;&nbsp;</SPAN>
								<SPAN id="block9">&nbsp;&nbsp;&nbsp;</SPAN>
							</asp:Panel>
						</td>
					</tr>
					<tr>
						<td id="complete" align=center>
						
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</HTML>
