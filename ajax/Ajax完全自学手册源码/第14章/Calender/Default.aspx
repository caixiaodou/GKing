<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
    li{	list-style-type:none;}
    body{font-size: 12px; background-color: #F7F6F3; text-align:center}
    #innerform{width:400px; text-align:left}
    .dragtitle{width: 15px; height: 15px; background-color: Brown;cursor: move; border: solid  thin white;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <div style="width:100%;text-align:center">
            <div style="font-size:18px;font-family:新宋体;color:Blue;text-align:center">
                今日日程安排
            </div>
           <div style="font-size:18px;font-family:新宋体;color:Blue;text-align:center;background-color:Gray">
                <asp:UpdatePanel runat="server" ID="udpMaster">
                    <ContentTemplate>
                        <ajaxToolkit:ReorderList runat="server" ID="rdlList" AllowReorder="true" 
                        DataKeyField="itemID"   DataSourceID="odsSource" PostBackOnReorder="true"
                        DragHandleAlignment="Left" ItemInsertLocation="Beginning"  SortOrderField="Priority" >
                            <ItemTemplate>
                                <div style="background-color:Yellow;">
                                    <asp:Label runat="server" ID="lblTitle" Text='<%# HttpUtility.HtmlEncode(Convert.ToString(DataBinder.Eval(Container.DataItem,"Title"))) %>'>'></asp:Label>
                                    <asp:Label runat="server" ID="lblDiscription" Text='<%# HttpUtility.HtmlEncode(Convert.ToString(DataBinder.Eval(Container.DataItem,"Description"))) %>'>'></asp:Label>
                                </div>
                            </ItemTemplate>
                            <ReorderTemplate>
                                <div style="text-align:center;color:Red;font-size:18px;width:60px;height:30px">
                                    将拖动至这里
                                </div>
                            </ReorderTemplate>
                            <DragHandleTemplate >
                                <div style="text-align:center;color:Red;font-size:18px;width:20px;height:20px">
                                   <img src="Image/132.gif" alt="使用鼠标拖拽" />
                                </div>
                            </DragHandleTemplate>
                            <InsertItemTemplate>
                                <asp:Panel runat=server ID="pnlInsert">
                                    <div  style="text-align:center;color:#000000;font-size:18px">
                                        <asp:TextBox runat="server" ID="txtTitle" Text='<%# Bind("Title") %>'></asp:TextBox>
                                       <br /> 
                                        <asp:TextBox runat="server" ID="txtDiscription" Text='<%# Bind("Description") %>'></asp:TextBox> 
                                        <br />
                                       <asp:Button runat="server" ID="btnInsert" Text="插入" CommandName="Insert" /> 
                                    </div>
                                </asp:Panel>
                            </InsertItemTemplate>
                        </ajaxToolkit:ReorderList> 
                       <asp:ObjectDataSource runat="server" ID="odsSource" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Select" TypeName="CalendarDataOperator" UpdateMethod="Update">
                           <DeleteParameters>
                               <asp:Parameter Name="itemID" Type="Int32" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="title" Type="String" />
                               <asp:Parameter Name="description" Type="String" />
                               <asp:Parameter Name="priority" Type="Int32" />
                               <asp:Parameter Name="itemID" Type="Int32" />
                           </UpdateParameters>
                           <InsertParameters>
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Priority" Type="Int32" />
                        </InsertParameters>
                       </asp:ObjectDataSource> 
                    </ContentTemplate>
                </asp:UpdatePanel>
           </div> 
        </div>
        
    </form>
</body>
</html>
