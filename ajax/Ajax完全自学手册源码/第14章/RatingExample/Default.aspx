<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
body
{
    font-size: 12px; 
    background-color: #F7F6F3
}
.ratingStar 
{
    font-size: 0pt;
    width: 13px;
    height: 12px;
    margin: 0px;
    padding: 0px;
    cursor: pointer;
    display: block;
}
.fieldStar
{
	background-image: url(file:///G|/正式开始写书/第14章/Code/RatingExample/Image/FilledStar.png);
}
.savingStar
{
	background-image:url(file:///G|/正式开始写书/第14章/Code/RatingExample/Image/SavedStar.png)
}
.emptyStar
{
	background-image:url(file:///G|/正式开始写书/第14章/Code/RatingExample/Image/EmptyStar.png)
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div style="text-align:center">
       <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" /> 
            <h3>请选择你最喜欢的明星并投票</h3> 
            刘德华
           <asp:UpdatePanel runat="server" ID="udp1" UpdateMode="Conditional">
                <ContentTemplate>
                    <ajaxToolkit:Rating runat="server" ID="rat1" CurrentRating="3"  MaxRating="5" 
                     StarCssClass="ratingStar" WaitingStarCssClass="savingStar"  FilledStarCssClass="fieldStar"
                      EmptyStarCssClass="emptyStar"  AutoPostBack="true" OnChanged="rat1_Changed" Width="120px">
                     </ajaxToolkit:Rating>
                     <div>刘德华&nbsp;&nbsp;&nbsp;
                        <asp:Label runat="server" ID="lbl1" ForeColor="red">几</asp:Label>星级
                     </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                黎明
                <asp:UpdatePanel runat="server" ID="udp2" UpdateMode="Conditional">
                <ContentTemplate>
                    <ajaxToolkit:Rating runat="server" ID="rat2" CurrentRating="3"  MaxRating="5" 
                     StarCssClass="ratingStar" WaitingStarCssClass="savingStar"  FilledStarCssClass="fieldStar"
                      EmptyStarCssClass="emptyStar"  AutoPostBack="true" Width="120px" OnChanged="rat2_Changed">
                     </ajaxToolkit:Rating>
                     <div>黎明&nbsp;&nbsp;&nbsp;
                        <asp:Label runat="server" ID="lbl2" ForeColor="red">几</asp:Label>星级
                     </div>
                </ContentTemplate>
               </asp:UpdatePanel>
                张学友
                <asp:UpdatePanel runat="server" ID="udp3" UpdateMode="Conditional">
                <ContentTemplate>
                    <ajaxToolkit:Rating runat="server" ID="rat3" CurrentRating="3"  MaxRating="5" 
                     StarCssClass="ratingStar" WaitingStarCssClass="savingStar"  FilledStarCssClass="fieldStar"
                      EmptyStarCssClass="emptyStar"  AutoPostBack="true" Width="120px" OnChanged="rat3_Changed">
                     </ajaxToolkit:Rating>
                     <div>张学友&nbsp;&nbsp;&nbsp;
                        <asp:Label runat="server" ID="lbl3" ForeColor="red">几</asp:Label>星级
                     </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                郭富城
                <asp:UpdatePanel runat="server" ID="udp4" UpdateMode="Conditional">
                <ContentTemplate>
                    <ajaxToolkit:Rating runat="server" ID="rat4" CurrentRating="3"  MaxRating="5" 
                     StarCssClass="ratingStar" WaitingStarCssClass="savingStar"  FilledStarCssClass="fieldStar"
                      EmptyStarCssClass="emptyStar"  AutoPostBack="true" Width="120px" OnChanged="rat4_Changed">
                     </ajaxToolkit:Rating>
                     <div>郭富城&nbsp;&nbsp;&nbsp;
                        <asp:Label runat=server ID="lbl4" ForeColor="red">几</asp:Label>星级
                     </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                张国荣
                <asp:UpdatePanel runat="server" ID="udp5" UpdateMode="Conditional">
                <ContentTemplate>
                    <ajaxToolkit:Rating runat="server" ID="rat5" CurrentRating="3"  MaxRating="5" 
                     StarCssClass="ratingStar" WaitingStarCssClass="savingStar"  FilledStarCssClass="fieldStar"
                      EmptyStarCssClass="emptyStar"  AutoPostBack="true"  Width="120px" OnChanged="rat5_Changed">
                     </ajaxToolkit:Rating>
                     <div>张国荣&nbsp;&nbsp;&nbsp;
                        <asp:Label runat=server ID="lbl5" ForeColor="red">几</asp:Label>星级
                     </div>
                </ContentTemplate>
                </asp:UpdatePanel> 
                <asp:UpdatePanel runat="server" ID="udp6" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button runat="server" ID="btnShow" Text="查看结果" OnClick="btnShow_Click" /> 
                       <br />
                       <asp:Label runat="server" ID="lblResult"></asp:Label> 
                    </ContentTemplate>
                </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
