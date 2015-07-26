// 作者 洪石丹
var xmlHttp;

function createXmlHttp()
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

function addUrlParameter(url,parameterName,parameterValue)
{
	url+=(url.indexOf("?"))==-1 ? "?" : "&";//判断当前URL中是否存在? 即参数分隔符
	url+=encodeURIComponent(parameterName)+"="+encodeURIComponent(parameterValue);
	return url;
}


function startRequest(customerStr)
{
	xmlHttp=createXmlHttp();
	xmlHttp.onreadystatechange=readyStateChangeHandler;
	xmlHttp.open("GET",addUrlParameter("AjaxPage.aspx","customerInfo",customerStr),null);
	xmlHttp.send(null);
}	

function readyStateChangeHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			var div=document.getElementById("divServerMsg");
			div.innerHTML="<b>"+str+"</b>";
		}
	}
}
