<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>聊天室登陆窗口</title>
</head>
<body style="background-color:#F3F7F8">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width:960px;text-align:center;">
        <div style="width:960px;text-align:center">
            <span style="color:#0055EA;font-size:20px;">聊天室登陆</span>
        </div>
        <div style="width:960px;text-align:center;font-size:12px;background-color:#F3F7F8;color:#0058F3">
             <table border="0" cellpadding="0" cellspacing="0" width="360px">
                <tr>
                    <td style="width:120px">
                         用户昵称
                    </td>
                    <td style="width:240px">
                         <asp:TextBox runat="server" ID="txtUserName" Width="180px"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ID="rfvUserName" ErrorMessage="昵称必须输入" ControlToValidate="txtUserName">*</asp:RequiredFieldValidator>
                    </td> 
                </tr>
                <tr>
                    <td style="width:120px">
                         密&nbsp; &nbsp; &nbsp; &nbsp;码
                    </td>
                    <td style="width:240px">
                         <asp:TextBox runat="server" ID="txtPwd" Width="180px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPwd" ErrorMessage="密码必须输入" ControlToValidate="txtPwd">*</asp:RequiredFieldValidator> 
                    </td> 
                </tr>
                <tr>
                    <td style="width:120px">
                         确认密码
                    </td>
                    <td style="width:240px">
                       <asp:TextBox runat="server" ID="txtSecondPwd" Width="180px" TextMode="Password"></asp:TextBox>
                       <asp:CompareValidator runat="server" ID="cmpSecondPwd" ControlToCompare="txtPwd" ControlToValidate="txtSecondPwd" ErrorMessage="两次密码输入必须一致">*</asp:CompareValidator>
                        
                    </td> 
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:ValidationSummary  runat=server ID="vdsDemo" Width="326px" HeaderText="登陆中出现了如下的错误：" />
                    </td>
                </tr>
            </table> 
           <asp:UpdateProgress runat="server" ID="upgDemo">
                <ProgressTemplate>
                    <div style="width:960px;text-align:center">
                        <img src="Image/loding.gif" />请等待登陆系统
                    </div>
                </ProgressTemplate>
           </asp:UpdateProgress> 
           <asp:UpdatePanel runat="server" ID="udpDemo">
                <ContentTemplate>
                     <div style="width:960px;text-align:center">
                        <asp:Label runat=server ID="lblMsg" ForeColor="Red"></asp:Label>
                         <br /> 
                        <asp:Button runat="server" ID="btnLogin" Text="登陆" OnClick="btnLogin_Click" />
                    </div>
                </ContentTemplate>
           </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
