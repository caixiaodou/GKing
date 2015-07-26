<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <table width="320px" border=0 cellpadding=0 cellspacing=0>
                <tr>
                    <td width=30%> 
                         用户名
                    </td>
                   <td width=70%>
                         <asp:TextBox runat=server ID="txtUserName"></asp:TextBox>
                    </td> 
                </tr>
                 <tr>
                    <td width=30%> 
                         密&nbsp;&nbsp;码
                    </td>
                   <td width=70%>
                         <asp:TextBox runat=server ID="txtUserPwd"></asp:TextBox>
                    </td> 
                </tr>
                <tr>
                    <td width=30%> 
                         验证码
                    </td>
                   <td width=70%>
                         <asp:TextBox runat=server ID="txtRandomCode"></asp:TextBox>
                         <img alt="点击图片刷新验证码" onclick="this.src='RandCode.ashx?'+new Date()"
                             src="RandCode.ashx" />
                    </td> 
                </tr>
                <tr>
                   <td width=100% colspan=2>
                       <asp:Button runat=server ID="btnLogin" Text="登陆" OnClick="btnLogin_Click" />
                       <input type=button id="btnClose" value="取消" onclick="window.close()" />
                   </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
