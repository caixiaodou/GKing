<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupChatForm.aspx.cs" Inherits="GroupChatForm" %>

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
    table
    {
        font-size:10pt;
        font-family:宋体;
        color:#124075;  
    }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div style="left: 0px;  position: absolute; top: 0px; width:490px; height:396px; background-image: url(skins/PersonalFormBG.jpg);" id="DIV5" language="javascript" onclick="return DIV5_onclick()">
    <div style="left: 466px; position: absolute; top: 0px;cursor:pointer">
        <img src="skins/Close.gif" id="btnCloseGroupImg"   />
    </div>
    <div style="left: 11px; position: absolute; top: 23px;width:320px;height:220px" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
        <asp:TextBox runat=server ID="txtGroupMsgList" TextMode=MultiLine Width=100% Height="217px"></asp:TextBox>
    </div>
    <div style="width:317px;height:130px; left:12px; position: absolute; top: 245px; ">
            <table cellpadding=0 cellspacing=0 width="100%">
                <tr valign=top>
                    <td align=left width=100%>
                        <select name="slcFontNameGroup" style="width: 100" id="font_name" onchange="FontName(this.options[this.selectedIndex].value)">
                            <option class="heading" selected>字体</option>
                            <option value="宋体">宋体</option>
                            <option value="黑体">黑体</option>
                            <option value="楷体_GB2312" style="margin-top: 0px;">楷体</option>
                            <option value="仿宋_GB2312">仿宋</option>
                            <option value="隶书">隶书</option>
                            <option value="幼圆">幼圆</option>
                            <option value="新宋体">新宋体</option>
                            <option value="细明体">细明体</option>
                            <option value="Arial">Arial</option>
                            <option value="Arial Black">Arial Black</option>
                            <option value="Arial Narrow">Arial Narrow</option>
                            <option value="Bradley Hand ITC">Bradley Hand ITC</option>
                            <option value="Brush Script	MT">Brush Script MT</option>
                            <option value="Century Gothic">Century Gothic</option>
                            <option value="Comic Sans MS">Comic Sans MS</option>
                            <option value="Courier">Courier</option>
                            <option value="Courier New">Courier New</option>
                            <option value="MS Sans Serif">MS Sans Serif</option>
                            <option value="Script">Script</option>
                            <option value="System">System</option>
                            <option value="Times New Roman">Times New Roman</option>
                            <option value="Viner Hand ITC">Viner Hand ITC</option>
                            <option value="Verdana">Verdana</option>
                            <option value="Wide Latin">Wide Latin</option>
                            <option value="Wingdings">Wingdings</option>
                        </select>
                       <select name="slcFontSizeGroup" id="font_size" onchange="FontSize(this.options[this.selectedIndex].value)">
                            <option value="1">字号</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                        <img src="FontEditImage/bold.gif" />
                       <img src="FontEditImage/underline.gif" />
                       <img src="FontEditImage/italic.gif" /> 
                       <img src="FontEditImage/fbcolor.gif" />
                       <img src="FontEditImage/fgcolor.gif" /> 
                    </td>
                </tr>
                <tr>
                     <td>
                        <asp:TextBox runat=server ID="txtGroupMsg" TextMode="MultiLine" Height="81px" Width="100%"></asp:TextBox>
                   </td> 
                </tr>
                <tr>
                    <td align=center>
                        <img src="skins/SendMsg.png" style="cursor:pointer" alt="发送消息" id="btnSendGroupMsg" /> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <img src="skins/ChatFormClose.png" style="cursor:pointer" alt="关闭窗口" id="btnCloseGroupForm" /> 
                    </td>
                </tr>
            </table>
         </div>
         <div style="left: 336px; position: absolute; top: 22px;width:146px;height:220px; background-color: #ffffff;" id="Div2" language="javascript">
                <div style="left: 0px; position: absolute; top: 0px;width:146px;height:25px; background-image: url(skins/ToolBarBackground.bmp);text-align:center" id="Div4" language="javascript">
                    群友
                </div>
          </div>
          <div style="left: 333px; position: absolute; top: 246px;width:152px;height:141px; background-color: #7bc5f8;" id="Div3" language="javascript" onclick="return Div3_onclick()">
            <asp:Button ID="Button2" style="position:absolute; left: 47px; top: 90px;" runat="server" Height="15px"  Width="62px" BackColor="White"  BorderColor="#E0E0E0" BorderWidth="0px" ForeColor="#044B9A" Enabled="False" />
            <asp:Button ID="Button3" style="position:absolute; left: 41px; top: 58px;" runat="server" Height="15px"  Width="71px" BackColor="White"  BorderColor="#E0E0E0" BorderWidth="0px" ForeColor="#044B9A" Text="查看群资料" Visible="False" />
            <asp:Button ID="Button4" style="position:absolute; left: 34px; top: 7px;" runat="server" Height="15px"  Width="80px" BackColor="White"  BorderColor="#E0E0E0" BorderWidth="0px" ForeColor="#044B9A" Text="邀请好友加入" />
           <asp:Button ID="Button1" style="position:absolute; left: 43px; top: 33px;" runat="server" Height="15px"  BorderColor="#E0E0E0" BorderWidth="0px" ForeColor="#044B9A" />  
        </div>
</div>
    </form>
</body>
</html>
