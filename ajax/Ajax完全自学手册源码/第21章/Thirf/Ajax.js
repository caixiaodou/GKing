// JScript 文件

function readElement()
{
	var bodyNode=document.body;
	var tableNode=bodyNode.getElementsByTagName("table");
	
	if(tableNode.length==2)
	{
		tableNode=tableNode[1];
	}
	
	var rows=tableNode.rows;
	var cells=tableNode.cells;
	
	var xmlDom=createXmlDom();
	
	for(var i=0;i<rows.length;i++)
	{
		var rowElement=xmlDom.createElement("data");
		for(var j=0;j<rows[i].cells.length;j++)
		{
			if(i==0)
			{
				var element=xmlDom.createElement("header");
				var str="";
				for(var k=0;k<tableNode.rows[i].cells[j].childNodes.length;k++)
				{
				  var child=tableNode.rows[i].cells[j].childNodes[k];
				  if(child.tagName=="BR")
				  {
				    str+=child.innerHTML;
				    str+=" ";
				  }
				  
				  if(k==0)
				  {
				    str=tableNode.rows[i].cells[j].childNodes[k].nodeValue;
				    str+=" "; 
				    continue;
				  }
				  

				  
				  if(child.tagName=="SPAN")
				  {
				    str+=child.innerText;
				    str+=" ";
				  }
				}    
				var textNode=xmlDom.createTextNode(str);
				
				element.appendChild(textNode);
				rowElement.appendChild(element);
				continue;
			}
			
			var element=xmlDom.createElement("body");
			var str="";
			for(var k=0;k<tableNode.rows[i].cells[j].childNodes.length;k++)
			{
			  var child=tableNode.rows[i].cells[j].childNodes[k];
			  if(k==0)
			  {
			    str=tableNode.rows[i].cells[j].childNodes[k].nodeValue;
			   str+=" ";  
			    continue;
			  }
			  
			  if(child.tagName=="SPAN")
			  {
			    str+=child.innerText;
			   str+=" "; 
			  }
			 
		        if(j==rows[i].cells.length-1)
		       {
		              if(child.tagName=="BR")
		              {
		                str+=child.parentNode.innerHTML;
		                str+=" ";
		                continue;
		              }
		       } 
	       
			}    
			var textNode=xmlDom.createTextNode(str);
			element.appendChild(textNode);
			rowElement.appendChild(element);
			
		}
		if(i==0)
		{
		    xmlDom.appendChild(rowElement);
		}
		else
		{
		    xmlDom.documentElement.appendChild(rowElement);
		}
	}
	
	return xmlDom;
}

var xmlHttp;

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

function getData()
{
    var xmlDom=readElement();
	xmlHttp=createXmlHttp();   
	xmlHttp.open("POST","getData.ashx?type=1",true);
	//xmlHttp.setRequestHeader("Content-Type","text/html;charset=UTF-8");   
    xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");   
	xmlHttp.onreadystatechange=getDataHandler;
	xmlHttp.send(encodeURIComponent(xmlDom.xml));
}

function getDataHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			
			alert("sucess");
		}
		
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
	
	throw new Error("�ͻ��������汾��ͣ���֧��XML DOM��������XML DOM");
}