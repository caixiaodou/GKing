<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
<script language="javascript" type="text/javascript" src="JavaScript/Login.js">

</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divMaster" style="width:1010px;text-align:left">
            <!--QQ登陆面板--> 
            <div style="width:304px;height:187px; background-image: url(skins/LoginFormBG.jpg);" id="divLogin">
            <div style="left: 17px; width: 290px; position: absolute; top: 75px; height: 81px;
                background-color: #e7f2f8" id="divLoginDetails">
                <div style="left: 1px; width: 288px; position: absolute; top: 10px; height: 63px;
                    background-color: #e7f2f8;font-size:9pt;font-family:宋体;color:#0981EA">
                   <table border=0 cellpadding=0 cellspacing=0 width=100%>
                        <tr valign=top>
                            <td width="28%">
                                MyQQ号码
                            </td>
                            <td width="42%">
                                <asp:TextBox runat=server ID="txtQQNum" BorderColor="#C0C0FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="#8080FF"></asp:TextBox>
                            </td>
                            <td width="30%">
                                <div style="text-decoration:underline"  onclick="loadRegister()">申请新号码</div>
                            </td>
                        </tr>
                        <tr valign=top>
                            <td style="height: 22px">
                                MyQQ密码
                            </td>
                            <td style="height: 22px">
                                <asp:TextBox ID="txtQQPwd" runat="server" BorderColor="#C0C0FF" BorderStyle="Solid"
                                    BorderWidth="1px" ForeColor="#8080FF" TextMode="Password" Width="96%"></asp:TextBox></td>
                            <td style="height: 22px">
                                <A href="mailto:hongbo0521@sina.com?subject = 你好，我忘记了密码">忘记密码？</A>
                            </td>
                        </tr>
                   </table> 
                </div>
                  <!--QQ面板-->
                <div style="width:200px;height:17px; left: 41px; position: absolute;top:127px;right:0px; background-color: #e7f2f8;" id="divLoginInfo"></div>    
            </div>
            <div style="left: 17px; width: 290px; position: absolute; top: 161px; height: 36px;
                    background-color: #eef5fb" id="divLoginBtn">
                <div style="left: 12px; width: 267px; position: absolute; top: 4px; height: 24px;
                    background-color: #eef5fb;text-align:center" id="divLoginBtnDetails">
                    <img src="skins/Login.png" style="CURSOR: hand"  onclick="loginWebQQ(ajaxXMl.$('txtQQNum').value,ajaxXMl.$('txtQQPwd').value)" />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <img src="skins/ReSet.png" style=" cursor:hand" onclick="resetLogin" />
                  </div>
                </div> 
                </div>
                
                <div style="width:792px;height:719px; left: 314px; position: absolute;top:0px;right:0px" id="divWebQQPanel">
                   
                </div>
        </div>
    </form>
</body>
</html>
