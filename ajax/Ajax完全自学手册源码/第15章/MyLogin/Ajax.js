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

function Login(txtUserName,txtPassWord)
{
	xmlHttp=createXmlHttp();
		
	var url="Login.ashx?type=1&UserName="+encodeURIComponent(txtUserName)+"&UserPwd="+encodeURIComponent(txtPassWord);
	xmlHttp.onreadystatechange=loginHandler;
	xmlHttp.open("POST",url,true);
	xmlHttp.send(null);
}

function loginHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var result=xmlHttp.responseText;
			if(result=="True")
			{
				alert("登陆成功");
				document.getElementById("pnlMain").innerHTML="<b>登陆成功</b>";
				var div=document.getElementById("pnlTitle");
				div.innerHTML=div.innerHTML+signOutBtn;
			}
			else
			{
				alert("登陆不正确，请检查用户名和密码");
				document.getElementById("txtUserName").value="";
				document.getElementById("txtPassWord").value="";
			}
		}
	}
}

function vali4UserName()
{
	var txt=document.getElementById("txtUserName");
	if(txt.value=="")
	{
		document.getElementById("LoginUNameError").style.display="block";
		document.getElementById("LoginUNameError").style.color="red";
		document.getElementById("LoginUNameError").innerHTML="用户名不得为空";
		txt.value="";
		txt.focus();
		document.getElementById("btnLogin").disabled=false;
	}
	else
	{
		document.getElementById("LoginUNameError").style.display="none";
	}
}

function vali4Pwd()
{
	var txt=document.getElementById("txtPassWord");
	if(txt.value=="")
	{
		document.getElementById("LoginPwdError").style.display="block";
		document.getElementById("LoginPwdError").style.color="red";
		document.getElementById("LoginPwdError").innerText="密码不得为空";
		txt.value="";
		txt.focus();
		document.getElementById("btnLogin").disabled=false;
	}
	else
	{
		document.getElementById("LoginPwdError").style.display="none";
	}
}


function setErrorMessage(errorControlName,msg)
{
	document.getElementById(errorControlName).style.display="block";
	document.getElementById(errorControlName).style.color="red";
	document.getElementById(errorControlName).innerText=msg;
}

function clearAndFocus(control)
{
	control.value="";
	control.focus();
}


function register4UserName()
{
	var txt=document.getElementById("txtUserName");
	var reg = "[^a-zA-Z_0-9]";
	if(txt.value=="")
	{
		setErrorMessage("RegisterUNameError","用户名不得为空");
		clearAndFocus(txt);
		return;
	}
	if(txt.value.length<5 ||txt.value.length>16)
	{
		setErrorMessage("RegisterUNameError","用户名长度必须介于5至18");
		clearAndFocus(txt);
		return;
	}

	if(!isNaN(txt.value.substring(0,1)))
	{
		setErrorMessage("RegisterUNameError","用户名首字母不得为数字");
		clearAndFocus(txt);
		return;
	}
	
	if(txt.value.match(reg))
	{
		setErrorMessage("RegisterUNameError","用户名只能由字母、数字、_组成，不能含有特殊字符");
		clearAndFocus(txt);
		return;
	}
	
}


function register4Pwd()
{
	var txt=document.getElementById("txtPassword");
	if(txt.value=="")
	{
		setErrorMessage("RegisterPwdError","密码的不得为空");
		clearAndFocus(txt);
		return;
	}
	
	if(txt.value.length<6 || txt.value.length>16)
	{
		setErrorMessage("RegisterPwdError","密码应在6位至16位之间");
		clearAndFocus(txt);
		return;
	}
	
}

function register4SecPwd()
{
	register4Pwd();
	var txtPwd=document.getElementById("txtPassword");
	var txtSec=document.getElementById("txtSecPwd");
	
	if(txtPwd.value!=txtSec.value)
	{
		setErrorMessage("RegisterSecPwdError","两次密码输入不符，请重新输入");
		clearAndFocus(txtPwd);
		clearAndFocus(txtSec);
		return;
	}
}

function register4Email()
{
	var txt=document.getElementById("txtEmail");
	var reg="[a-zA-Z_0-9](1-10)@[a-zA-Z_0-9](1-10).[a-zA-Z_0-9](1-10)";
	if(txt.value=="")
	{
		setErrorMessage("RegisterEmailError","邮箱必须输入");
		clearAndFocus(txt);
		return;
	}
	if(txt.value.match(reg))
	{
		setErrorMessage("RegisterEmailError","邮箱格式不正确请重新输入");
		clearAndFocus(txt);
		return ;
	}
	
}


function checkName(uName)
{
	xmlHttp=createXmlHttp();
	xmlHttp.open("POST","Register.ashx?type=2&uName="+uName,true);
	xmlHttp.onreadystatechange=function()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
				document.getElementById("RegisterUNameError").style.display="block";
				switch(xmlHttp.responseText)
				{
					case "0":
						document.getElementById("RegisterUNameError").innerText="无人使用该用户名，可以使用";
						break;
					case "1":
						document.getElementById("RegisterUNameError").innerText="该用户名有人使用了,请重新输入用户名";
						document.getElementById("txtUserName").value="";
						document.getElementById("txtUserName").focus();
						break;
				}
			}
			else
			{
				alert("服务器错误");
			}	
		}
	}
	xmlHttp.send(null);
}

function RegisterUser(userName,userPwd,userEmail,valiCode)
{
	xmlHttp=createXmlHttp();
	var url="Register.ashx?type=3&UserName="+encodeURIComponent(userName)+
			"&UserPwd="+encodeURIComponent(userPwd)+"&UserEmail="+encodeURIComponent(userEmail)+
			"&ValiCode="+encodeURIComponent(valiCode);
	xmlHttp.onreadystatechange=ResisterHandler;
	xmlHttp.open("POST",url,true);
	xmlHttp.send(null);
}

function ResisterHandler()
{
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var str=xmlHttp.responseText;
			if(str=="True")
			{
				alert("注册成功");
				var div=document.getElementById("pnlTitle");
				div.innerHTML=div.innerHTML+signOutBtn;
				
				document.getElementById("pnlMain").innerHTML="注册成功";
			}
			else if(str=="false")
			{
				alert(服务器错误);
			}
			else
			{
				loadControl("register");
			}
		}
		else
		{
			alert("服务器错误");
		}
	}
}

function signOut()
{
	xmlHttp=createXmlHttp();
	var url="SignOut.ashx?type=0";
	xmlHttp.open("POST",url,true);
    xmlHttp.onreadystatechange=signOutHandler;
    xmlHttp.send(null);	
}

function signOutHandler()
{
    if(xmlHttp.readyState==4)
    {
        if(xmlHttp.status==200)
        {
            var str=xmlHttp.responseText;
            document.getElementById("pnlMain").innerHTML=str;
        }
    }
}


function loadControl(controlName)
{
	document.getElementById("loading").style.display="block";
	xmlHttp=createXmlHttp();
	xmlHttp.open("POST",controlName+".ashx?type=0&ContrlName="+controlName,true);
	xmlHttp.onreadystatechange=function()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
				document.getElementById("loading").style.display="none";
				document.getElementById("pnlMain").innerHTML=xmlHttp.responseText;
			}
			else
			{
				alert("服务器错误");
			}	
		}
	}
	xmlHttp.send(null);
}

