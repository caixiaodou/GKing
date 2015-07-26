<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvertiseManager.aspx.cs" Inherits="AdvertiseManager" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
  
    <div style="text-align:center" id="DIV1" runat="server">
       
                <asp:GridView runat=server AutoGenerateColumns=False ID="dgvKeyWord" Width="1049px" DataSourceID="ObjectDataSource1" DataKeyNames="AdvertiseID">
                    <EmptyDataTemplate>
                        该关键字不存在 
                    </EmptyDataTemplate>
                   <Columns>
                            <asp:BoundField DataField="AdvertiseID" HeaderText="广告编号" SortExpression="AdvertiseID">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="KeyID" HeaderText="关键字编号" SortExpression="KeyID">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="说明" SortExpression="Description">
                                <ItemStyle Width="215px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Url" HeaderText="链接地址" SortExpression="Url">
                                <ItemStyle Width="215px" />
                            </asp:BoundField>
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

                   
                 <asp:DetailsView runat="server" ID="dtlDemo"  AutoGenerateRows=False DefaultMode=Insert Width="340px" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="ObjectDataSource1">
                      <Fields>
                        <asp:BoundField DataField="AdvertiseID" HeaderText="广告编号" InsertVisible="False" ReadOnly=True />
                        <asp:BoundField DataField="KeyID" HeaderText="关键字编号" />
                        <asp:BoundField DataField="Description" HeaderText="说明" />
                        <asp:BoundField DataField="Url" HeaderText="链接地址" />
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
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Advertise"
            DeleteMethod="DeleteAdvertise" InsertMethod="InsertAdvertise" SelectMethod="GetAllAdvertise"
            TypeName="AdvertiseOperator" UpdateMethod="UpdateAdvertise"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
