// JScript 文件


var xmlHttp;
var xmlDoc;

function createXmlHttp()
{
	var activeKey=new Array("Msxml2.XMLHTTP","Microsoft.XMLHTTP");
	if(window.ActiveXObject)
	{
		try
		{
			for(var i=0;i<activeKey.length;i++)
			{
				xmlHttp=new ActiveXObject(activeKey[i]);
				if(xmlHttp!=null)
					return xmlHttp;
				else
					continue;
			}
		}
		catch(error)
		{
			alert("你的浏览器出现了以下错误,请立即升级浏览器");//提醒客户
		}
	}
	else if(window.XMLHttpRequest)
	{
		xmlHttp=new window.XMLHttpRequest();
	}
}

function createXmlDom()
{
	var xmlVersions=new Array(
			"MSXML2.DOMDocument.5.0",
			"MSXML2.DOMDocument.4.0",
			"MSXML2.DOMDocument.3.0",
			"MSXML2.DOMDocument",
			"Microsoft.XmlDom"
			);
		
	for(var i=0;i<xmlVersions.length;i++)
	{
		try
		{
			var xmlDom=new ActiveXObject(xmlVersions[i]);
			return xmlDom;
		}
		catch(error)
		{
			continue;
		}
	}
	
	throw new Error("XML DOM对象在当前浏览器中不支持 请立即更新浏览器");
}













