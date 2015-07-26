// JScript 文件

var frameStr1="<iframe id ='chatqqForm'  marginheight=0 "
				+"marginwidth=0 frameborder=0 scrolling=no width=444px height=360px "+
				" style='top:12px;left:8px' src=";
var frameStr2="></iframe>";
var xmlHttp;
var timerId;

//请求MsgHandler 获得当前用户未读消息中的第一条消息
function loadMsg()
{
	xmlHttp=ajaxXMl.CreateXmlHttp();
	var url="MsgHandler.ashx?type=0";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=loadMsgHandler;
	xmlHttp.send(null);
}

function loadMsgHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var msgId=xmlHttp.responseText;
			var url=ajaxXMl.makeUrl("ChatForPrivate.aspx","msgId",msgId);
			loadFrame(url);
		}
	}
}


function loadFrame(frameUrl)
{
	var divChatPanel=ajaxXMl.$("divChatPanel");
	var string=frameStr1+frameUrl+frameStr2;
	divChatPanel.innerHTML=string;
}

function getNotReadMsg()
{
	xmlHttp=ajaxXMl.CreateXmlHttp();
	var url="MsgHandler.ashx?type=1";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=getNotReadMsgHandler;
	xmlHttp.send(null);
	
}


function getNotReadMsgHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var spnMsgCount=ajaxXMl.$("spnMsgCount");
			spnMsgCount.innerText=xmlHttp.responseText;
			window.setTimeout("getNotReadMsg()",20000);
		}
	}
}


function findFriend()
{
    var str1="<iframe id ='findFriend'  marginheight=0 "
				+"marginwidth=0 frameborder=0 scrolling=no width=485px height=360px "+
				" style='top:12px;left:8px' src=";
	var str2="></iframe>";
	
	var divChatPanel=ajaxXMl.$("divChatPanel");
	var string=str1+"FindFriend.aspx"+str2;
	divChatPanel.innerHTML=string;
	reloadChatqqForm();
}


function reloadChatqqForm()
{
    chatmain.location.reload();
    window.setTimeout("reloadChatqqForm()",30000);
}







