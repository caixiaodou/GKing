<%@ Page language="c#" Codebehind="Chat.aspx.cs" AutoEventWireup="false" Inherits="ChatSystem.Chat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>UChat</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" href=/ChatSystem/Css/niftyCorners.css>
		<link rel="stylesheet" href=/ChatSystem/Css/style.css>
		<script type="text/javascript" src=/ChatSystem/JS/AjaxFuncation.js></script>
		<script type="text/javascript" src=/ChatSystem/JS/NotfyCode.js></script>
		<script type="text/javascript">

		
		
		
		
		/**
 * @author Administrator
 */
//全局变量声明
var timeID;
var refreshRate=2000;//刷新时间 2秒
var rnd=Math.random();//随机对象

var isNotIE;
var isIE;//判断浏览器是否非IE浏览器
var ajaxPageName="Server.aspx";

function createXmlHttp()
{
	var xmlHttp;
	if(window.ActiveXObject)
	{
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
		xmlHttp=new XMLHttpRequest();
	}
	
	return xmlHttp;
}

function getBrowserType()
{
	isNotIE=(navigator.appName=="Netscape");
	isIE=(navigator.appName=="Microsoft Internet Explorer");
}

function captureReturn(event)
{
	//alert( event.keyCode);
	//firefox2.0中不支持 window.event.keyCode 及判断当前按下得按钮
	if(event.which || event.keyCode)
	{
		//alert( event.keyCode);
		//按下得是回车键
		if(event.which==13 || event.keyCode==13)
		{
			postText();
			return false;		
		}
		else
		{
			return true;	
		}
	}
}

function postText()
{
	rnd++;
	var chatBox=document.getElementById("mytext");
	var chat=chatBox.value;
	chatBox.value="";
	
	var userid=window.location.search.substring(1,window.location.search.length);
	url = 'Server.aspx?action=PostMsg&u=' + userid + '&t=' + encodeURIComponent(chat) + '&session=' + rnd;
	
	var req=createXmlHttp();
	req.onreadystatechange=function()
	{
		if(req.readyState==4)
		{
			if(req.status==200)
			{
				updateAll();
			}
		}
	}
	
	req.open( 'GET', url, true );
	req.send( null );
}

function setTimers()
{
	timeID=window.setTimeout("updateAll()",refreshRate);
}

function updateAll()
{
	window.clearTimeout(timeID);//暂停实施某件事情
	getUserList();
	setTimers();
}

function getUserList()
{
	rnd++;
	url = 'Server.aspx?action=UserList&session=' + rnd;
	
	var req=createXmlHttp();
	
	req.onreadystatechange=function()
	{
		if(req.readyState==4)
		{
			if(req.status==200)
			{
				var obj=document.getElementById("userlist");
				obj.innerHTML=req.responseText;
				getBufferText();
			}
		}
	}
	
	req.open('GET',url,true);
	req.send(null);
}


function getBufferText()
{
	rnd++;
	url = 'Server.aspx?action=GetMsg&session=' + rnd;
	var req=createXmlHttp();
	
	req.onreadystatechange=function()
	{
		if(req.readyState==4)
		{
			if(req.status==200)
			{
				var obj=document.getElementById("chatbuffer");
				obj.innerHTML=req.responseText;
				scrollChatPanel();
			}
		}
		
	}
	
	req.open( 'GET', url , true );
	req.send( null );
}



function scrollChatPanel()
{
	var obj=document.getElementById("chatpane");
	obj.scrollTop=obj.scrollHeight;//scrollHeight滚动条高度  scrollTop滚动条偏移量 
}

function setFocous(controlName)
{
	var control=document.getElementById(controlName);
	if(control!=null)
	{
		control.focus();
	}
}

function focusWindow()
{
	window.focus();
}
function showLoadScrollran()
{
	var loading = "<div style=\"text-align:center;color:red;\"><h5>Loading...</h5></div>";
	
	var chat=document.getElementById("chatbuffer");
	chat.innerHTML=loading;
	
	var user=document.getElementById();
	user.innerText=loading;
}

		window.onload=function(){
		Nifty("div#form","big transparent");
		Nifty("div#chatbox","normal transparent");
		Nifty("div#userbox","normal transparent");		
		}
		</script>
		<style> #form{margin:10px; background:#778899; padding:15px; width:80%;}
	#chatpane{background:#FFFFF0;}
		</style>
	</HEAD>
	<body>
		<h1>聊天室</h1>
		<form id="Form1" method="post" runat="server">
		</form>
		<div id="form">
			<div id="chatpane">
				<ul id="chatbuffer" />
			</div>
			<div id="userpane">
				<ul id="userlist" />
			</div>
			<p class="clear">
				<label id="username">信息: </label><input type="text" class="mytext" id="mytext" onkeydown="captureReturn(event)"></p>
		</div>
		<script type="text/javascript">
			sniffBrowserType();
			showLoadScreen();
			setTimers();
			setFocus('mytext');
		</script>
	</body>
</HTML>
