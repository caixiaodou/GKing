<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="AddressList.ascx" TagName="AddressList" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ajax 无刷新登陆</title>
    <script type="text/javascript" language="javascript" src="Ajax.js"></script>
</head>
<body >
    <form id="form1" runat="server">
    <div style="text-align:center;font-size:12px">
        <table width="400 px" style="text-align:center;" border="1px" cellpadding="0" cellspacing="0">
            <tr  valign="top">
                <td style="height:20px;text-align:right">
                    <asp:Panel runat="server" ID="pnlTitle" BackColor="MistyRose" Height="20px" Width="400px">
                         <a href="javaScript:loadControl('Register')">注册</a>&nbsp;&nbsp;
                         <a href="javaScript:loadControl('Login')">登陆</a>
                         <a href="javaScript:loadControl('AddressList')">通讯录</a>
                    </asp:Panel>
                </td>
            </tr>
           <tr valign="top">
                <td style="height:20px;text-align:right">
                    <div id="loading" style="text-align:center; background-color:#ffcc99;Width:400px;Height:20px;display:none">
                        正在加载数据，请稍候
                    </div>
                </td>
           </tr> 
           <tr valign="top">
                <td>
                   <div id="pnlMain" style=" width:400px;background-color:#ffcc99">
                       <uc1:AddressList ID="AddressList1" runat="server" />
                       
                 </div>
                </td>
           </tr>
        </table>
    </div>
    </form>
</body>
</html>