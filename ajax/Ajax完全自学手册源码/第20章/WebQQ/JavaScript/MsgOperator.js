// JScript 文件

//过滤字符串
String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g,"");
}

function sendMsg()
{
	xmlHttp=ajaxXMl.CreateXmlHttp();
	
	var toUserId=ajaxXMl.$("hidOtherId").value;
	var fromUserId=ajaxXMl.$("hidHostId").value;
	var toUserName=ajaxXMl.$("hidOtherName").value;
	var fromUserName=ajaxXMl.$("hidHostName").value;
	var msg=getContent();
	
	var url="MsgHandler.ashx?type=2";
	url=ajaxXMl.makeUrl(url,"toUserId",toUserId);
	url=ajaxXMl.makeUrl(url,"fromUserId",fromUserId);
	url=ajaxXMl.makeUrl(url,"msg",msg);
	
	clearMsg(msg,fromUserName,toUserName);
	
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=sendMsgHandler;
	xmlHttp.send(null);
}

function sendMsgHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			
		}	
	}
}
