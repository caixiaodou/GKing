<%@ Control Language="C#"  ClassName="Login" %>
<table cellpadding="0" cellspacing="0" border="0" width="398px" style="background-color:#FFFF99">
    <tr style="Width:100%;" valign="top">
        <td style="Width:32%">用户名</td>
        <td style="Width:68%">
            <asp:TextBox runat="server" Width="80%" ID="txtUserName" onfocusout="vali4UserName()"></asp:TextBox>
           <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="LoginUNameError"></div> 
        </td> 
    </tr>
    <tr style="Width:100%;" valign="top">
        <td style="Width:32%">密  码</td>
        <td style="Width:68%">
            <asp:TextBox runat="server" Width="80%" ID="txtPassWord"  onfocusout="vali4Pwd()" TextMode="Password"></asp:TextBox>
           <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="LoginPwdError"></div> 
        </td> 
    </tr>
    <tr style="Width:100%;" valign="top">
        <td colspan="2" align="center">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr style="width:100%" valign="top">
                    <td style="width:50%" align="center">
                        <input type="button" value="登陆" onclick="Login(document.getElementById('txtUserName').value,document.getElementById('txtPassWord').value)" name="btnLogin" />
                    </td>
                   <td align="center">
                       <input type="button" value="取消" onclick="cancel()" />
                   </td> 
                </tr>
            </table>
        </td>
    </tr>
</table>