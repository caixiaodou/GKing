<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager> 
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <div style="width:320px;height:150px" align=center>
                    <table border=0 cellpadding=0 cellspacing=0 width=300>
                        <tr width=300px>
                            <td>请输入回传至服务器的文本</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox runat="server"  ID="txtCustomerInfo"></asp:TextBox></td> 
                        </tr>
                         <tr>
                            <td>
                                <asp:Button runat="server" Text="发送请求" id="btnSend" OnClick="btnSend_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>服务器处理后文本显示如下</td>
                        </tr>
                        <tr>
                                <td>
                                    <div style="width:100%;background-color:Yellow;color:black;height:48px" id="divServerMsg" runat="server">
                                    </div>
                                </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate> 
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
