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

//获取省区电视台的频道列表
function getChanel(tvSet)
{
	xmlHttp=createXmlHttp();
	xmlHttp.onreadystatechange=getChanelHandler;
	xmlHttp.open("POST","Tv.ashx?type=0&TVSET="+encodeURIComponent(tvSet),true);
	xmlHttp.send(null);
}

//异步读取数据处理函数
function getChanelHandler()
{
	clearOptions();//当xmlHttp读取状态发生改变时即清空频道下拉框的内容
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{		
		    clearOptions();
			fillOptions(xmlHttp.responseXML);
		}
	}
}

//清除所有的频道下拉框的内容
function clearOptions()
{
    var slcChanel=document.getElementById("slcTvChanel");
	slcChanel.options.length=0;    
}

//填充频道下拉框
function fillOptions(dom)
{
	//得到根节点
    var nodes=dom.getElementsByTagName("TvSet");
     var op=new Option();
	op.text="请选择频道";
	document.getElementById("slcTvChanel").options.add(op);
	for(var i=0;i<nodes[0].childNodes.length;i++)
	{
		//遍历根节点的子节点  并将内容添加至频道下拉框
		var o=new Option();
		o.text=nodes[0].childNodes[i].text;
		o.value=i+1;
		document.getElementById("slcTvChanel").options.add(o);
	}
}

//根据客户选择频道 改变内容 
function changeContent(tvSet,chanelID)
{
	xmlHttp=createXmlHttp();
	xmlHttp.onreadystatechange=changeContentHandler;
	xmlHttp.open("POST","Tv.ashx?type=1&TVSET="+encodeURIComponent(tvSet)+"&chanelId="+encodeURIComponent(chanelID),true);
	xmlHttp.send(null);
}

function changeContentHandler()
{
    if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{		
			var divContent=document.getElementById("divContent");
			divContent.innerHTML="";
			//接收服务器回发内容，并进行显示
			divContent.innerHTML=xmlHttp.responseText;
			
		}
	}
}

//根据客户选择的星期天数改变电视预告内容
function changeContentByWeekDay(tvSet,chanelID,weekDay)
{
	xmlHttp=createXmlHttp();
	xmlHttp.onreadystatechange=changeContentByWeekDayHandler;
	xmlHttp.open("POST","Tv.ashx?type=2&TVSET="+encodeURIComponent(tvSet)+"&chanelId="+encodeURIComponent(chanelID)+"&weekDay="+encodeURIComponent(weekDay),true);
	xmlHttp.send(null);
}

function changeContentByWeekDayHandler()
{
    if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{		
			var divContent=document.getElementById("divContent");
			divContent.innerHTML="";
			divContent.innerHTML=xmlHttp.responseText;
			
		}
	}
}

//执行翻译的主函数，接收翻译类型
function translate(language)
{
	xmlHttp=createXmlHttp();
	xmlHttp.onreadystatechange=translateHandler;
	xmlHttp.open("POST","translate.ashx?text="+document.getElementById("txtContent").value+"&langpair="+encodeURIComponent(language),true);
	xmlHttp.send(null);
}


function translateHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{		
			var divResult=document.getElementById("divResult");
			divResult.innerHTML="";
			divResult.innerHTML=xmlHttp.responseText;		
		}
	}
}














