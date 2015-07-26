// JScript 文件
var frameStr1="<iframe id ='chatForm'  marginheight=0 "
				+"marginwidth=0 frameborder=0 scrolling=no width=444px height=360px "+
				" style='top:12px;left:8px' src=";
var frameStr2="></iframe>";


function friendFaceDbClick()
{
	var hostId=ajaxXMl.$("hidHostId").value;
	var otherId=window.event.srcElement.id;
	
	var url=ajaxXMl.makeUrl("ChatForPrivate.aspx","hostID",hostId);
	url=ajaxXMl.makeUrl(url,"otherId",otherId);
	loadChatForm(url);
}

function loadChatForm(frameUrl)
{
	var divChatPanel=ajaxXMl.$("divChatPanel");
	var string=frameStr1+frameUrl+frameStr2;
	divChatPanel.innerHTML=string;
}