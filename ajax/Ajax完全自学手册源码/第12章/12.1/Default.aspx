<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASP.NET Ajax控件</title>
    <script type="text/javascript" language=javascript>
        function showServerMsg(msg)
       {
            var divServerMsg=$get("divServerMsg");
           divServerMsg.innerHTML="<b>"+msg+"</b>"; 
       } 
       
       function requestServer()
       {
            var service=WebService;
           service.GetCustomerMsg($get("txtCustomerInfo").value,showServerMsg); 
            return false;
       }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference  Path="~/WebService.asmx"/>
            </Services>
        </asp:ScriptManager>
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
                        <td>
                            <asp:Button runat=server ID="btnRequest" Text="发送请求" OnClientClick="return requestServer()" />
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
        </div>
    </form>
</body>
</html>
