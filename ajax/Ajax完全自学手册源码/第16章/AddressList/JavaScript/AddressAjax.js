var xmlHttp;
var signOutBtn="<a href='javascript:signOut()'>注销</a>";

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

function setCookie(name,value)
{
	var cookie=name+"="+encodeURIComponent(value);
	var expires=addYear();
	var secure=true;
	if(expires)
	{
		cookie+=";expires="+expires.toGMTString();//设定超时时间
	}
	if(secure)
	{
		cookie+=";secure="+secure;
	}
	document.cookie=cookie;
}

function addYear()
{
	var nowYear=new Date();
	var result=new Date(nowYear.getYear()+1,nowYear.getMonth(),nowYear.getDay(),nowYear.getHours(),nowYear.getMinutes());
	return result;
}


//获取Cookie
function getCookie(name)
{
	xmlHttp=createXmlHttp();
	var url="AddressList.ashx?type=3&cookieName="+name;
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=getCookieHandler;
	xmlHttp.send(null);
}

function getCookieHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			document.getElementById('hidUserName').value=str;
			document.getElementById('txtOtherUser').value=str;
		}
	}
}


function otherLogin(otherName)
{
	var otherUser=document.getElementById('hidUserName');
	if(otherName='')
	{
		document.getElementById('divLoginOtherInfo').style.display="block";
		document.getElementById('divLoginOtherInfo').innerHTML="用户名不得为空";	
		return;
	}
	else
	{
		otherUser.value=otherName;
	}
	xmlHttp=createXmlHttp();
	var url="AddressList.ashx?type=1&userName="+otherName;
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=otherLoginHandler;
	xmlHttp.send(null);
}

function otherLoginHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			if(xmlHttp.responseText=="1")
			{
				document.getElementById('divLoginOtherInfo').style.display="block";
				document.getElementById('divLoginOtherInfo').innerHTML="登陆成功";
			}
		}
	}
}

function getAddressListByType(controlId)
{
	var otherUser=document.getElementById('hidUserName');
	if(otherUser.value='')
	{
		document.getElementById('divLoginOtherInfo').style.display="block";
		return;
	}
	switch(controlId)
	{
		case 'spnFriend':
			AddressListByType(1);
			break;
		case 'spnColleague':
			AddressListByType(2);
			break;
		case 'spnFamily':
			AddressListByType(3);
			break;
		case 'spnOther':
			AddressListByType(4);
			break;
	}
}

function AddressListByType(typeName)
{
	xmlHttp=createXmlHttp();
	var url="AddressList.ashx?type=2&typeName="+typeName;
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=getAddressListHandler;
	xmlHttp.send(null);
}

function getAddressListHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			document.getElementById('divInfo').innerHTML=str;
		}
	}
}

function insertAddressList(rdbType,name,rdbSex,phone,handPhone,eamil,postAddress,familtAddress,qq,msn)
{
  	xmlHttp=createXmlHttp();
	var typeName;
	for(var i=0;i<rdbType.length;i++)
	{
		if(rdb[i].checked)
		{
			typeName=rdb[i].value;
		}
	}
	var sex=rdbSex[0].checked ? '男' : '女';
	
	
	var url="AddressList.ashx?type=3&typeName="+typeName+"&name="+name+"&sex="
					+sex+"&phone="+phone+"&handphone="+handPhone+"&email="+email
					+"&postaddress="+postAddress+"&familyaddress="+familtAddress
					+"&qq="+qq+"&msn="+msn;
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=insertAddressListHandler;
	xmlHttp.send(null);
}

function insertAddressListHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			document.getElementById('divInfo').innerHTML=str;
		}
	}
}

