<%@ Control Language="C#"  ClassName="Register" %>
<table border="1" cellpadding="0" cellspacing="0" width="398px" style="background-color:#6CE26C;color:#0055EA">
    <tr style="width:100%" valign="top">
        <td style="width:37%">
            用户名
        </td>
       <td style="width:63%">
            <asp:TextBox runat="server" ID="txtUserName"  onBlur="register4UserName()"></asp:TextBox>
           <input type="button" id="btnCheck" value="是否有人使用？" onclick="checkName(document.getElementById('txtUserName').value)" /> 
           <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="RegisterUNameError"></div>
    </tr>
    <tr style="width:100%" valign="top">
        <td style="width:37%">
            密码
        </td>
       <td style="width:63%">
            <asp:TextBox runat="server" ID="txtPassword"  onBlur="register4Pwd()"></asp:TextBox>
           <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="RegisterPwdError"></div>
    </tr>
    <tr style="width:100%" valign="top">
        <td style="width:37%">
            确认密码
        </td>
       <td style="width:63%">
            <asp:TextBox runat="server" ID="txtSecPwd"  onBlur="register4SecPwd()"></asp:TextBox>
            <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="RegisterSecPwdError"></div>
    </tr>
    <tr style="width:100%" valign="top">
        <td style="width:37%">
           邮箱
        </td>
       <td style="width:63%">
            <asp:TextBox runat="server" ID="txtEmail"  onBlur="register4Email()"></asp:TextBox>
           <div style="background-color:#ffccdd;width:100px;height:20px;display:none" id="RegisterEmailError"></div>
    </tr>
    <tr style="width:100%" valign="top">
        <td style="width:37%">
            验证码
        </td>
       <td style="width:63%">
            <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
           <img src="Random.aspx" alt="单击图片，可以换一个验证码." style="cursor: pointer" onclick="this.src='Random.aspx?'+new Date()" />
       </td>
    </tr>
    <tr style="width:100%" valign="top">
        <td colspan="2">
            <div style="text-align:center">
                <input  ID="btnSubmit"  value="注册"  type="button" name="btnSubmit" onclick="RegisterUser(document.getElementById('txtUserName').value,document.getElementById('txtPassword').value,document.getElementById('txtEmail').value,document.getElementById('txtCode').value)" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                  <input  ID="btnCancel"  value="取消" type="button"  name="btnCancel" />
            </div>
        </td>
    </tr>
</table>