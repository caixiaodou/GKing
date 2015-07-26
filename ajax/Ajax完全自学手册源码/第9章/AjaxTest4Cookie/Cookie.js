// JScript 文件
/*
function setCookie(name,value)
{
	var cookie=name+"="+encodeURIComponent(value);
	var expires=addYear();
	var path="http://localhost/AjaxTest4Cookie/WebForm1.aspx";
	var domain="http://localhost/AjaxTest4Cookie";
	var secure=true;
	if(expires)
	{
		cookie+=";expires="+expires.toGMTString();
	}
	if(path)
	{
		cookie+=";path="+path;	
	}
	
	if(domain)
	{
		cookie+=";doMain="+domain;
	}
	
	if(secure)
	{
		cookie+=";secure="+secure;
	}
	document.cookie=cookie;
}

function getCookie(name)
{
	var re="(?:;)?"+name+"=([^;]*);?";
	var reg=new RegExp( re);
	
	if(reg.test(document.cookie))
	{
		return decodeURIComponent(RegExp["$1"]);
	}
	else
	{
		return null;
	}
}

function addYear()
{
	var nowYear=new Date();
	var result=new Date(nowYear.getYear()+1,nowYear.getMonth(),nowYear.getDay(),nowYear.getHours(),nowYear.getMinutes());
	return result;
}*/

function getCookie(name)
{
	var re="(?:;)?"+name+"=([^;]*);?";
	var reg=new RegExp( re);
	
	if(reg.test(document.cookie))
	{
		return decodeURIComponent(RegExp["$1"]);
	}
	else
	{
		return null;
	}
}

window.onload=function()
{
	var userName=getCookie("userName");
	var userEmail=getCookie("UserEmail");
	
	if(userName&&userEmail)
	{
		document.forms[0].txtUserName.value=userName;
		document.forms[0].txtEmail.value=userEmail;	
	}
}

