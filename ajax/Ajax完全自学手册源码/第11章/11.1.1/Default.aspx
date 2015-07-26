<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ajax请求页面</title>
    <script type="text/javascript" language=javascript src="Ajax.js">
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
        <div style="width:320px;height:150px" align=center>
            <table border=0 cellpadding=0 cellspacing=0 width=300px>
                <tr width=300px>
                    <td>请输入回传至服务器的文本</td>
                </tr>
                <tr>
                    <td><asp:TextBox runat="server"  ID="txtCustomerInfo"></asp:TextBox></td> 
                </tr>
                 <tr>
                    <td><input type=button runat=server id="btnRequest"  value="发送请求" onclick="startRequest(document.getElementById('txtCustomerInfo').value)" /></td>
                </tr>
                <tr>
                    <td>服务器处理后文本显示如下</td>
                </tr>
                <tr>
                        <td>
                            <div style="width:100%;background-color:Yellow;color:black;height:48px" id="divServerMsg">
                            </div>
                        </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
