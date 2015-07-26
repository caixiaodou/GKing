// JScript 文件

function addFriendList(friendId)
{
    xmlHttp=ajaxXMl.CreateXmlHttp();
	var url="FriendHandler.ashx?type=0";
	url=ajaxXMl.makeUrl(url,"friendId",friendId);
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=addFriendListHandler;
	xmlHttp.send(null);
}

function addFriendListHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			ajaxXMl.$("divInfo").innerHTML=xmlHttp.responseText;
		}
	}
}
