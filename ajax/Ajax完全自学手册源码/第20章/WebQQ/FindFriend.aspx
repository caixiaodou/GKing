<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindFriend.aspx.cs" Inherits="FindFriend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <style type="text/css">
    div
    {
        font-size:10pt;
        font-family:宋体;
        color:#124075; 
        
    }
    
     a.visted
    {
	    color: #1E90FF;
    }

    a
    {
	    color: Blue;
    }
    </style>
    <script type="text/javascript" language=javascript src="JavaScript/Login.js"></script>
    <script type="text/javascript" language=javascript src="JavaScript/Friend.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="left: 0px; position: absolute; top: 0px;width:485px;height:334px; background-image: url(skins/SearchFormBG.JPG);">
        <div style="left: 10px; position: absolute; top: 5px;width:460px;height:250px; background-color: #b5d9f2;text-align:center">
            <table cellpadding=0 cellspacing=0 border=0 width="100%" align=center>
                <tr>
                    <td width="30%" style="height: 24px">
                        好友编号
                    </td>
                   <td width=70% style="height: 24px">
                        <asp:TextBox runat="server" ID="txtFriendId"></asp:TextBox>
                   </td>  
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:GridView runat="server" ID="grvFriend" AutoGenerateColumns="False" Width="100%" DataKeyNames="Id" Height="172px" AllowPaging="True" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <img src='faces/<%# DataBinder.Eval(Container.DataItem,"FaceId") %>.bmp' id="<%# DataBinder.Eval(Container.DataItem,"Id") %>" />
                                    </ItemTemplate>
                                   <ItemStyle /> 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="昵称">
                                    <ItemTemplate>
                                        <a href="#" onclick='addFriendList(<%# DataBinder.Eval(Container.DataItem,"id") %>)'><%# DataBinder.Eval(Container.DataItem,"NickName")  %>></a> 
                                    </ItemTemplate>
                                    <ItemStyle  Font-Size="10pt" ForeColor="#124075" Font-Names="宋体" /> 
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="年龄" DataField="Age">
                                    <ItemStyle  Font-Size="10pt" ForeColor="#124075" Font-Names="宋体" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="性别" DataField="Sex">
                                    <ItemStyle Font-Size="10pt" ForeColor="#124075" Font-Names="宋体" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                
                <tr>
                    <td colspan=2>
                       <asp:Button runat=server ID="btnSelect" Text="查找" OnClick="btnSelect_Click" />
                        <input type=button id="btnClose" value="取消" onclick="parent.divChatPanel.innerHTML=''" />
                   </td>  
                </tr>
                <tr>
                    <td colspan=2 style="height: 32px">
                        <div style=" background-color: #b5d9f2; width: 327px; height: 24px;" id="divInfo"></div> 
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
