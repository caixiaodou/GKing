<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KeyManager.aspx.cs" Inherits="KeyManager" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="0.8em"
            PathSeparator=" : " Width="355px">
           <NodeTemplate>
               <asp:HyperLink ID="HyperLink1" runat="server"  Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("url") %>' ToolTip='<%# Eval("Description") %>'><%# Eval("Description") %></asp:HyperLink>[<%# Eval("ChildNodes.Count") %>]
            </NodeTemplate> 
            <PathSeparatorStyle Font-Bold="True" ForeColor="#990000" />
            <CurrentNodeStyle ForeColor="#333333" />
            <NodeStyle Font-Bold="True" ForeColor="#990000" />
            <RootNodeStyle Font-Bold="True" ForeColor="#FF8000" />
        </asp:SiteMapPath>
    <div style="text-align:center" id="DIV1" runat="server">
        
                <asp:GridView runat=server AutoGenerateColumns=False ID="dgvKeyWord" Width="1049px" DataKeyNames="KeyID" DataSourceID="ObjectDataSource1">
                    <EmptyDataTemplate>
                        该关键字不存在 
                    </EmptyDataTemplate>
                   <Columns>
                       <asp:BoundField DataField="KeyID" HeaderText="关键字编号" SortExpression="KeyID" />
                       <asp:BoundField DataField="Name" HeaderText="关键字名称" SortExpression="Name" />
                       <asp:BoundField DataField="Remark" HeaderText="备注" SortExpression="Remark" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="操作">
                            <ItemStyle Width="100px" />
                        </asp:CommandField>
                   </Columns> 
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" Font-Size="12px" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"  Font-Size="12px" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Font-Size="12px"  />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Font-Size="12px"  />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Font-Size="12px"  />
                    <AlternatingRowStyle BackColor="#F7F7F7" Font-Size="12px"  />
                </asp:GridView>
         

                 <asp:DetailsView runat="server" ID="dtlDemo"  AutoGenerateRows=False DefaultMode=Insert Width="340px" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None">
                    <Fields>
                        <asp:BoundField DataField="KeyID" HeaderText="关键字编号" SortExpression="KeyID"  InsertVisible="False" ReadOnly=True />
                        <asp:BoundField DataField="Name" HeaderText="关键字名称" SortExpression="Name" />
                        <asp:BoundField DataField="Remark" HeaderText="备注" SortExpression="Remark" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>          
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                     <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                     <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                     <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="KeyWord"
            DeleteMethod="DeleteKeyWord" InsertMethod="InsertKeyWord" SelectMethod="GetAllKeyWord"
            TypeName="KeyWordOperator" UpdateMethod="UpdateKeyWord"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
