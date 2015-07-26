<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="asm1" runat=server>
            <AuthenticationService Path="" />
            <ProfileService LoadProperties="" Path="" />
            <Scripts>
                <asp:ScriptReference />
            </Scripts>
            <Services>
                <asp:ServiceReference Path="" />
            </Services> 
        </asp:ScriptManager>
       <asp:UpdatePanel runat="server" ID="udp1">
            <ContentTemplate>
                    内容模板
            </ContentTemplate>
           <Triggers>
                <asp:AsyncPostBackTrigger ControlID="" EventName=""  />
                <asp:PostBackTrigger ControlID="" />
           </Triggers> 
       </asp:UpdatePanel> 
    </div>
    </form>
</body>
</html>
