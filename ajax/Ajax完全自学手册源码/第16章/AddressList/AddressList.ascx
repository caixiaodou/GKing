<%@ Control Language="C#" AutoEventWireup="true" %>
    <script type="text/javascript" language="javascript">
    //验证用户输入的JavaScript文件
function checkLinkManName(userName)
{
    if(userName!=null)
    {
        var spnError=document.getElementById('spnNameError');
        var spnRight=document.getElementById('spnNameRight');
	    if(userName=="")
        {	
		    showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>用户名不得为空</b>";
        }
        else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
    }
    else
    {
        return;
    }
}

function checkPhone(phone)
{
	if(phone!=null)
	{
	    var spnError=document.getElementById('spnPhoneError');
        var spnRight=document.getElementById('spnPhoneRight');
	    var reg=/[0]{1}[2-9]{2,3}[\-]?[2-9][0-9]{6,7}/;
	    if(!reg.test(phone))
	    {
		    showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>电话号码格式不符</b>";
	    } 
	    else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
	}
	  else
    {
        return;
    }
}

function checkHandPhone(handPhone)
{
	if(handPhone!=null)
	{
	    var spnError=document.getElementById('spnHandPhoneError');
        var spnRight=document.getElementById('spnHandPhoneRight');
	    var reg=/[1]{1}[35]{1}[0-9]{1}[0-9]{8}/;
	    if(!reg.test(handPhone))
	    {
		    showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>手机号码格式不符</b>";
	    } 
	    else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
	}
	  else
    {
        return;
    }
}

function checkEmail(email)
{
	if(email!=null)
	{
	    var spnError=document.getElementById('spnEmailError');
        var spnRight=document.getElementById('spnEmailRight');
	    var reg=/^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	    if(!reg.test(email))
	    {
	        showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>邮件格式不符</b>";  
		    
	    } 
	    else
        {
            hideControl(spnError);
		    showControl(spnRight);
        }
	}
	  else
    {
        return;
    }
}



function checkQQ(qq)
{
	if(qq!=null)
	{
	    var spnError=document.getElementById('spnQQError');
        var spnRight=document.getElementById('spnQQRight');
	    var reg=/[1-9]{1}[0-9]{4,10}/;
	    if(!reg.test(qq))
	    {
		    showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>QQ号码必须为数字</b>";
	    }
	    else
	    {
		    hideControl(spnError);
		    showControl(spnRight);	
	    }
	}
	  else
    {
        return;
    }
}

function checkMSN(email)
{
	if(email!=null)
	{
	    var spnError=document.getElementById('spnMSNError');
        var spnRight=document.getElementById('spnMSNRight');
	    var reg=/^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	    if(!reg.test(email))
	    {
	        showControl(spnError);
		    hideControl(spnRight);
		    spnError.innerHTML="<img src='Image/Error.gif' /><b>邮件格式不符</b>";  
		    
	    } 
	    else
        {
            hideControl(spnError);
		    showControl(spnRight);
        }
	}
	  else
    {
        return;
    }
}

function showControl(control)
{
     control.style.display="block";
}

function hideControl(control)
{
     control.style.display="none";
}


//获取Cookie
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
			if(xmlHttp.responseText!='0')
		    {
		        var str=xmlHttp.responseText;
			    document.getElementById('hidUserName').value=str;
			    document.getElementById('txtOtherUser').value=str;
		    }
		}
	}
}


function addYear()
{
	var nowYear=new Date();
	var result=new Date(nowYear.getYear()+1,nowYear.getMonth(),nowYear.getDay(),nowYear.getHours(),nowYear.getMinutes());
	return result;
}


function otherLogin()
{
    var otherName=document.getElementById("txtOtherUser").value;
	var otherUser=document.getElementById('hidUserName');
	if(otherName=='')
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
	alert(otherName);
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
			alert(0);
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
	var url="AddressList.ashx?type=4&typeName="+typeName;
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
			document.getElementById('AddressList1_divInfo').innerHTML+=str;
		}
	}
}

function insertAddressList()
{
    var rdbType=document.getElementsByName('rdbType');
    var name=document.getElementById('AddressList1$txtName').value;
    var rdbSex=document.getElementsByName('rdbSex');
    var phone=document.getElementById('AddressList1$txtPhone').value;
    var handPhone=document.getElementById('AddressList1$txtHandPhone').value;
    var email=document.getElementById('AddressList1$txtEmail').value;
    var postAddress=document.getElementById('AddressList1$txtPostAddress').value;
    var familyAddress=document.getElementById('AddressList1$txtAddress').value;
    var qq=document.getElementById('AddressList1$txtQQ').value;
    var msn=document.getElementById('AddressList1$txtMSN').value;
	var typeName;
	for(var i=0;i<rdbType.length;i++)
	{
		if(rdbType[i].checked)
		{
			typeName=rdbType[i].value;
		}
	}
	var sex=rdbSex[0].checked ? '男' : '女';
	
	
	var url="AddressList.ashx?type=2&typeName="+encodeURIComponent(typeName)+"&name="+encodeURIComponent(name)+"&sex="
					+encodeURIComponent(sex)+"&phone="+encodeURIComponent(phone)+"&handphone="+encodeURIComponent(handPhone)+"&email="+encodeURIComponent(email)
					+"&postaddress="+encodeURIComponent(postAddress)+"&familyaddress="+encodeURIComponent(familyAddress)
					+"&qq="+encodeURIComponent(qq)+"&msn="+encodeURIComponent(msn);
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
			document.getElementById('AddressList1_divInfo').innerHTML+=str;
		}
	}
}

    </script>
<div id="divAddressList" runat="server" style="background-color:#F0F8FF;width:800px;height:180px;font-size:14px;text-align:center;font-family:新宋体;color:#0B86F9"  onmouseover="getCookie('OtherName')">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="color:#0B86F9;font-size:16px">
        <tbody>
            <tr width="100%" align="center" valign="top">
                <td width="100%" colspan="5"><b>通讯录</b></td>
            </tr>
            <tr width="100%"  valign="top">
                <td width="20%">
                    <span style="width:100%;font-size:12px;cursor:hand;color:#0B86F9" title="Add" id="spnAdd" onclick="AddressListByType(this.title)">
                        <img src="Image/add.ico"style="width: 14px; height: 16px" />添加联系人
                    </span>
                </td>
               <td width="20%">
                    <span style="width:100%;font-size:12px;cursor:hand;color:#0B86F9" title="1" id="spnFriend" onclick="AddressListByType(this.title)">
                        <img src="Image/friend.gif" />好友
                    </span>
                </td>
               <td width="20%">
                    <span style="width:100%;font-size:12px;cursor:hand;color:#0B86F9" title="2"  id="spnColleague" onclick="AddressListByType(this.title)">
                        <img src="Image/colleague.gif"/>同事
                    </span>
                </td>
               <td width="20%">
                    <span style="width:100%;font-size:12px;cursor:hand;color:#0B86F9" title="3" id="spnFamily" onclick="AddressListByType(this.title)">
                        <img src="Image/Family.gif" style="width: 16px; height: 15px" />家庭
                    </span>
                </td>
               <td width="20%">
                    <span style="width:100%;font-size:12px;cursor:hand;color:#0B86F9" title="4" id="spnOther" onclick="AddressListByType(this.title)">
                        <img src="Image/Other.gif" style="width: 16px; height: 15px" />其他
                    </span>
                </td>    
            </tr> 
           <tr valign=top>
                <td colspan="5">
                    <div runat="server" id="divInfo" style="width:100%;font-size:12px;color:#0B86F9">
                        <div id="divLogin" style="display:block;width:100%;font-size:12px;color:#0B86F9" >
                             <img src="Image/Error.gif" />未注册用户请使用临时登陆,体验功能<br />
                            <input type=text id="txtOtherUser" name="txtOtherUser" />
                            <input type="button" id="btnOtherLogin" value='临时登陆' onclick="otherLogin()" />
                            <input type="hidden" id="hidUserName" value='' />
                            <div id="divLoginOtherInfo" style="display:none" >必须登录后方可体验功能</div>
                        </div>
                    </div>
                </td>
           </tr> 
           <tr style="width:100%;font-size:12px;color:#0B86F9" valign=top >
              <td colspan="5" width=100% >
                   <table cellpadding=0 cellspacing=0 border=0 width="100%" style="color:#0B86F9;font-size:12px">
                        <tr>
                            <td colspan=2>
                                好友类别:<input type=radio name="rdbType" value="1" checked="checked" /><img src="Image/friend.gif" />好友
                                <input type=radio name="rdbType" value="2" /><img src="Image/colleague.gif"/>同事
                                <input type=radio name="rdbType" value="3" /><img src="Image/Family.gif" style="width: 16px; height: 15px" />家庭
                                <input type=radio name="rdbType" value="4" /><img src="Image/Other.gif" style="width: 16px; height: 15px" />其他
                            </td>
                        </tr>
                       <tr align="center">
                            <td  width="30%"><img src="Image/name.gif"/>&nbsp;&nbsp;姓名</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtName" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkLinkManName(this.value)"></asp:TextBox>
                                <div id="spnNameError" style="display:none" ><img src="Image/Error.gif" /></div>
                                <div id="spnNameRight" style="display:none" ><img  src="Image/Right.gif"/></div>
                            </td>
                       </tr> 
                       <tr align="center">
                            <td  width="30%"><img src="Image/sex.gif"/>&nbsp;&nbsp;性别</td>
                            <td width="70%">
                                <input type=radio name="rdbSex" value="boy" checked="checked" /><img src="Image/boy.gif"/>男
                                <input type=radio name="rdbSex" value="gril" /><img src="Image/girl.gif"/>女
                            </td>
                       </tr>
                        <tr align="center">
                            <td  width="30%"><img src="Image/phone.gif"/>&nbsp;&nbsp;电话</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtPhone" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkPhone(this.value)"></asp:TextBox>
                                <div id="spnPhoneError" style="display:none" ><img src="Image/Error.gif" /></div>
                                <div id="spnPhoneRight"  style="display:none"><img  src="Image/Right.gif"/></div>
                            </td>
                       </tr> 
                        <tr align="center">
                            <td  width="30%"><img src="Image/handPhone.gif"/>&nbsp;&nbsp;手机</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtHandPhone" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkHandPhone(this.value)"></asp:TextBox>
                                <div id="spnHandPhoneError"  style="display:none"><img src="Image/Error.gif" /></div>
                                <div id="spnHandPhoneRight" style="display:none"><img  src="Image/Right.gif"/></div>
                            </td>
                       </tr>
                       <tr align="center">
                            <td  width="30%"><img src="Image/email.gif"/>&nbsp;&nbsp;电子邮件</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtEmail" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkEmail(this.value)"></asp:TextBox>
                                <div id="spnEmailError" style="display:none"><img src="Image/Error.gif" /></div>
                                <div id="spnEmailRight"  style="display:none"><img  src="Image/Right.gif"/></div>
                            </td>
                       </tr>  
                        <tr align="center">
                            <td  width="30%"><img src="Image/postAddress.gif"/>&nbsp;&nbsp;通信地址</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtPostAddress" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" Height="96px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                       </tr> 
                        <tr align="center">
                            <td  width="30%"><img src="Image/familyAddress.gif"/>&nbsp;&nbsp;家庭地址</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtAddress" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" Height="96px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                       </tr> 
                       <tr align="center">
                            <td  width="30%" style="height: 24px"><img src="Image/QQ.gif"/>&nbsp;&nbsp;QQ</td>
                            <td width="70%" style="height: 24px">
                                <asp:TextBox runat="server" ID="txtQQ" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkQQ(this.value)"></asp:TextBox>
                                <div id="spnQQError"  style="display:none"><img src="Image/Error.gif" /></div>
                                <div id="spnQQRight"  style="display:none"><img  src="Image/Right.gif"/></div> 
                            </td>
                       </tr> 
                       <tr align="center">
                            <td  width="30%"><img src="Image/msn.gif"/>&nbsp;&nbsp;MSN</td>
                            <td width="70%">
                                <asp:TextBox runat="server" ID="txtMSN" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" onblur="checkMSN(this.value)"></asp:TextBox>
                                 <div id="spnMSNError"  style="display:none"><img src="Image/Error.gif" /></div>
                                <div id="spnMSNRight"  style="display:none"><img  src="Image/Right.gif"/></div> 
                            </td>
                       </tr>
                       <tr align="center">
                            <td colspan=2 width="100%">
                                <input type=button id="btnInsert"  style="cursor:hand;" value="保存" onclick="insertAddressList()" />
                            </td>
                       </tr>
                   </table>
              </td>
           </tr> 
        </tbody>
    </table>
</div>