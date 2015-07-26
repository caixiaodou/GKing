// JScript 文件

document.write('<link href="style.css"  rel="stylesheet" type="text/css" />');//广告层内联样式
var divWidth="240px";//广告层宽度
var divHeight="160px";//广告层高度
var loadingImg="Image/loading1.gif";
var timerID;

//获取鼠标的位置
function getMousePosition(event)
{
	if(event.pageX || event.pageY)//firefox中的位置
     {
      return {x:event.pageX, y:event.pageY};
     }
     return {//ie中的位置
      x:event.clientX + document.documentElement.scrollLeft - document.documentElement.clientLeft,
      y:event.clientY + document.documentElement.scrollTop  - document.documentElement.clientTop
     };
}

//匹配网页中的特定关键字，加超链接显示；element表示匹配区域
function matchAdvertise(element)
{
	//创建广告层
	var divAdvertise=document.createElement("div");
	//设定广告层的ID
	divAdvertise.id="divAdvertise";
	divAdvertise.setAttribute("id","divAdvertise");
	divAdvertise.setAttribute("name","divAdvertise");
	
	divAdvertise.style.width=divWidth;
	divAdvertise.style.height=divHeight;
	divAdvertise.style.position="absolute";
	divAdvertise.innerHTML="<div id=\"divAdvertiseBar\" name=\"Advertise\"><div id=\"divAdvertiseTitle\" name=\"Advertise\">"+
	"</div><div id=\"divAdvertiseClose\" name=\"Advertise\">"+
	"<img name=\"Advertise\" src=\"Image/close.jpg\" width=\"14\" height=\"14\" border=\"0\" onclick=\"hiddenAdShowBox()\" />"+
	"</div></div><div id=\"divAdvertiseContent\" name=\"divAdvertiseContent\"></a></div>";
	document.body.appendChild(divAdvertise);//添加广告显示层
	
	//获取element指定的节点
	var node=document.getElementById(element);
	//判断节点是否存在
	if(!node)
	{
	    //如果不存在 直接认为是body的第一个子节点
		node=document.body.childNodes[0];
	}
	
	//获取element指定的节点中的HTML代码
	var temp=node.innerHTML;
	for(var i=0;i<ads.length;i++)
	{
	    //获取匹配全文的关键字信息的正则表达式
		var advertise=eval("/"+ads[i]+"/g");
		//将所有关键字信息替换为链接样式
		temp=temp.replace(advertise,
    "<a oncontextmenu=\"return false;\" onmousemove=\"moveDivAdvertise(event);\" onmouseover=\"showAdvertiseSearch('"+ads[i]+"',event);\" style=\"color:Red\" name=\"Advertise\" target=\"_blank\">"+ads[i]+"</a>");
	}
	//替换element指定的节点中的HTML代码
	node.innerHTML=temp;
}

//广告层显示
function showAdvertiseSearch(key,event)
{
	try
	{
		clearTimeout(timerID);
	}
	catch(e)
	{
		
	}
	
	moveDivAdvertise(event);
	document.getElementById('divAdvertiseTitle').innerHTML="关键词\""+key+"\"的相关广告";
	document.getElementById('divAdvertiseContent').innerHTML="<img src=\""+loadingImg+"\">";//加载提示
	document.getElementById('divAdvertise').style.display="block";
	
	xmlHttp=createXmlHttp();
	xmlHttp.open("POST","Advertise.ashx?key="+encodeURIComponent(key)+"&date="+new Date(),true);
	xmlHttp.onreadystatechange=advertiseHandler;
	xmlHttp.send(null);
}

function advertiseHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
		     
			 document.getElementById('divAdvertiseContent').innerHTML=xmlHttp.responseText;//把结果显示出来	
			document.getElementById('divAdvertiseContent').style.display="block"; 
		}
	}
}



function moveDivAdvertise(event)
{
	var AdBoxLeft=getMousePosition(event).x;//当前鼠标的横坐标
	//如果广告窗体超出显示区域
	if(parseInt(document.documentElement.clientWidth)-AdBoxLeft<parseInt(document.getElementById('divAdvertise').style.width))
    {
    	AdBoxLeft=(AdBoxLeft-parseInt(document.getElementById('divAdvertise').style.width))+"px";
    }
	else
    {
    	AdBoxLeft=AdBoxLeft+"px";
    }
	
	document.getElementById('divAdvertise').style.left=AdBoxLeft;//设置横坐标
	var AdBoxTop=getMousePosition(event).y//当前鼠标的纵坐标
	if(parseInt(document.documentElement.clientHeight)-AdBoxTop<parseInt(document.getElementById('divAdvertise').style.height))
    {
    	AdBoxTop=(AdBoxTop-parseInt(document.getElementById('divAdvertise').style.height)-15)+"px";
    }
	else
    {
    	AdBoxTop=(AdBoxTop+15)+"px";
    }
	document.getElementById('divAdvertise').style.top=AdBoxTop;//设置纵坐标
}


//鼠标移动事件
document.onmouseover=function(e)
{
  e = e || window.event;   
  var eSrc=e.target||e.srcElement;
  if(eSrc.name!="Advertise")
  {
     try
	 {
	 	clearTimeout(timerID);
	 } 
	 catch(e)
	 {
	 	
	 }
     timerID=setTimeout("hiddenAdShowBox()",1000);
  }
  else
  {
     try
	 {
	 	clearTimeout(timerID);
	 } 
	 catch(e)
	 {
	 	
	 }
  }
}

//隐藏广告窗体
function hiddenAdShowBox()
{
	try
	{
		clearTimeout(timerID);
	} 
	catch(e)
	{
	
	}
 	document.getElementById('divAdvertiseContent').style.display="none";
}
matchAdvertise();



























