<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div align="center">
            <div style="font-size:16px;color:#3A6EA5;text-align:center;">
                在线电影查询
            </div> 
           <div style="text-align:center;">
                请输入要查询的关键字:<asp:TextBox runat="server" ID="txtKeyWord"></asp:TextBox><asp:Button runat="server" ID="btnSelect" Text="查找" />
           </div> 
           <asp:UpdateProgress runat="server" ID="upgDemo">
                <ProgressTemplate>
                    <div align="center" style="width:1100px">
                        <img src="Image/loading.gif" align=middle /> 
                    </div>
                </ProgressTemplate>
           </asp:UpdateProgress>
           <asp:UpdatePanel runat="server" ID="udpMaster">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="grvDemo" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"  DataKeyNames="MovieID" Width="897px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <EmptyDataTemplate>
                            你要查找的电影还没有加入数据库
                        </EmptyDataTemplate>
                       <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="操作">
                                <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="MovieID" HeaderText="编号" SortExpression="MovieID">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MovieName" HeaderText="电影名称" SortExpression="MovieName">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MovieAcer" HeaderText="主演" SortExpression="MovieAcer">
                                <ItemStyle Width="215px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MovieContent" HeaderText="简介" SortExpression="MovieContent">
                                <ItemStyle Width="215px" />
                            </asp:BoundField>
                       </Columns> 
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" Font-Size="12px" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"  Font-Size="12px" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Font-Size="12px"  />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Font-Size="12px"  />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Font-Size="12px"  />
                        <AlternatingRowStyle BackColor="#F7F7F7" Font-Size="12px"  />
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSelect" EventName="Click" />
                </Triggers>
           </asp:UpdatePanel>
           <asp:UpdatePanel runat="server" ID="udpDetails">
                <ContentTemplate>
                    <asp:DetailsView runat="server" ID="dtlDemo" DataKeyNames="MovidID" DataSourceID="ObjectDataSource1" AutoGenerateRows=false DefaultMode=Insert Width="340px">
                            <Fields>
                                <asp:BoundField DataField="MovieID" HeaderText="编号" InsertVisible="False" ReadOnly=True />
                                <asp:BoundField DataField="MovieName" HeaderText="电影名称" />
                                <asp:BoundField DataField="MovieAcer" HeaderText="电影主演" />
                                <asp:BoundField DataField="MovieContent" HeaderText="电影简介" />
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>          
                    </asp:DetailsView>
                </ContentTemplate>
           </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Update" InsertMethod="Insert" SelectMethod="LikeSelect" TypeName="DataAccess" UpdateMethod="Update" OnInserted="ObjectDataSource1_Updating" OnUpdating="ObjectDataSource1_Updating" OnDeleted="ObjectDataSource1_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="MovieName" Type="String" />
                    <asp:Parameter Name="MovieAcer" Type="String" />
                    <asp:Parameter Name="MovieContent" Type="String" />
                    <asp:Parameter Name="MovieID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MovieName" Type="String" />
                    <asp:Parameter Name="MovieAcer" Type="String" />
                    <asp:Parameter Name="MovieContent" Type="String" />
                    <asp:Parameter Name="MovieID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtKeyWord" DefaultValue="无" Name="like" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="MovieName" Type="String" />
                    <asp:Parameter Name="MovieAcer" Type="String" />
                    <asp:Parameter Name="MovieContent" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
