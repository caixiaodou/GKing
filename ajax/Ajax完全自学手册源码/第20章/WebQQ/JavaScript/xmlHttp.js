锘?// JScript 鏂囦欢

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
			    xmlHttp=new ActiveXObject(activeKey[i]);
			    if(xmlHttp!=null)
				    return xmlHttp;
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
		xmlHttp=new window.XMLHttpRequest();
	}
}