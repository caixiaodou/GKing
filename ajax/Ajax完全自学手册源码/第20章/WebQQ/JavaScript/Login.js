var xmlHttp;
var ajaxXMl=new AjaxXmlHttp();

function AjaxXmlHttp()
{
		
}

AjaxXmlHttp.prototype.CreateXmlHttp=function()
{
	var activeKey=new Array("MSXML2.XMLHTTP.5.0",
	                                            "MSXML2.XMLHTTP.4.0",
	                                            "MSXML2.XMLHTTP.3.0",
	                                            "MSXML2.XMLHTTP",
	                                            "Microsoft.XMLHTTP");
	if(window.ActiveXObject)
	{
		for(var i=0;i<activeKey.length;i++)
		{
		    try
	        {
			    this.xmlHttp=new ActiveXObject(activeKey[i]);
			    if(this.xmlHttp!=null)
				    return this.xmlHttp;
			 }
	        catch(error)
	        {
		         continue;
	        } 
		}
		throw new Error("客户端浏览器版本过低，不支持XMLHttpRequest对象，请更新浏览器");
	}
	else if(window.XMLHttpRequest)
	{
		this.xmlHttp=new window.XMLHttpRequest();
	}
}

AjaxXmlHttp.prototype.$=function(elemenID)
{
	return document.getElementById(elemenID) ;
}

AjaxXmlHttp.prototype.makeUrl=function(url,parameterName,parameterValue)
{
	url+=(url.indexOf("?"))==-1 ? "?" : "&";//判断当前URL中是否存在? 即参数分隔符
	url+=encodeURIComponent(parameterName)+"="+encodeURIComponent(parameterValue);
	return url;
}



function loginWebQQ(qqNum,qqPwd)
{
	
	xmlHttp=ajaxXMl.CreateXmlHttp();
	var url=ajaxXMl.makeUrl("Login.ashx","type",1);
	url=ajaxXMl.makeUrl(url,"qqNum",qqNum);
	url=ajaxXMl.makeUrl(url,"pwd",qqPwd);
	xmlHttp.open("Post",url,null);
	xmlHttp.onreadystatechange=loginWebQQHandler;
	xmlHttp.send(null);
}

function loginWebQQHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			if(str=="1")
			{
				ajaxXMl.$("divLoginInfo").innerHTML="<b>登陆成功</b>";
				loadWebQQPanel();
			}
			else if(str=="0")
			{
				ajaxXMl.$("divLoginInfo").innerHTML="<b>登陆失败</b>";
			}
			else
			{
				ajaxXMl.$("divLoginInfo").innerHTML="<b>服务器错误</b>";
			}
		}
	}
}

function loadWebQQPanel()
{
	ajaxXMl.$("divWebQQPanel").innerHTML=" <iframe id ='chatqq' src=Frame.aspx marginheight=0 "
				+"marginwidth=0 frameborder=0 scrolling=no height='700px' width='792px' "+
				" style='top:12px;left:8px'></iframe>";
}


function loadRegister()
{
    ajaxXMl.$("divWebQQPanel").innerHTML=" <iframe id ='chatqq' src=Register.aspx marginheight=0 "
				+"marginwidth=0 frameborder=0 scrolling=no height='700px' width='792px' "+
				" style='top:12px;left:8px'></iframe>";
}


