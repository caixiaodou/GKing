<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatForPrivate.aspx.cs" Inherits="ChatForPrivate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <script type="text/ecmascript" language="javascript" src="JavaScript/Login.js"></script>
    <script type="text/ecmascript" language="javascript" src="JavaScript/MsgOperator.js"></script>
     <script type="text/javascript" language="javascript" src="JavaScript/TextEditer.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="left: 0px; background-image: url(skins/ChatFormBG.jpg); position: absolute; top: 0px;width:444px;height:361px">
    <div style="left: 422px; position: absolute; top: 1px;cursor:pointer" id="DIV1" onclick="parent.divChatPanel.innerHTML=''">
        <img src="skins/Close.gif" id="IMG1"  />
    </div>
    <div style="width:420px;height:192px; left: 10px; position: absolute; top: 22px;float:right; ">
        <div style="width:396px;height:30px; left: 13px; position: absolute; top: 6px; background-image: url(skins/ChatBarBg.jpg);">
           <asp:Button ForeColor="#045371" ID="Button1" runat="server" BackColor="#a3ddff" BorderColor="#E0E0E0"
            BorderWidth="0px" Height="15px" 
            Style="vertical-align: middle; position: absolute; left: 253px; top: 7px;" Text="删除该好友"
            Width="62px" />
        <asp:Button ForeColor="#045371" BackColor="#a3ddff" Style="vertical-align: middle;
            position: absolute; left: 327px; top: 7px;" ID="Button2" 
            runat="server" Width="62px" Text="拉入黑名单"
            Height="15px" BorderWidth="0px" BorderColor="#E0E0E0"></asp:Button>
         </div>
         <textarea name="content" id="content" style="display: none; width: 380px; word-bread: break-all;
                word-wrap: break-word; scrollbar-face-color: #DBEBFE; scrollbar-shadow-color: #B8D6FA;
                scrollbar-highlight-color: #FFFFFF; scrollbar-3dlight-color: #DBEBFE; scrollbar-darkshadow-color: #458CE4;
                scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #458CE4"></textarea>
          <div style="width:418px;height:143px; left:0px; position: absolute; top: 40px; background-color: #e7f2f8;font-family:宋体;font-size:9pt" runat="server" ID="txtChatPrivateList">
             
         </div> 
         <div style="width:422px;height:130px; left:0px; position: absolute; top: 195px; " id="DIV2">
            <table cellpadding=0 cellspacing=0 width="100%">
                <tr valign=top>
                    <td align=left width=100%>
                        <select name="font_name" style="width: 100" id="font_name" onchange="textFontName(this.options[this.selectedIndex].value)">
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
                       <select name="font_size" id="font_size" onchange="textFontSize(this.options[this.selectedIndex].value)">
                            <option value="1">字号</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                        <img src="FontEditImage/bold.gif" onclick="textBlod()" />
                       <img src="FontEditImage/underline.gif" onclick="textUnderLine()" />
                       <img src="FontEditImage/italic.gif" onclick="textItalic()" /> 
                       <img src="FontEditImage/fbcolor.gif" onclick="textColor()" />
                       <img src="FontEditImage/fgcolor.gif" onclick="textBackColor()" /> 
                    </td>
                </tr>
                <tr>
                     <td style="height: 96px">
                        <div style="left: 0px; position: absolute; top: 22px;width:420px;height:96px; background-color: white;" id="divEditor">
                            <script language="javascript" type="text/javascript">createEditer(document.getElementById("content").value);</script>
                         </div>
                   </td> 
                </tr>
                <tr>
                    <td align=center>
                        <img src="skins/SendMsg.png" style="cursor:pointer" alt="发送消息" onclick="sendMsg()" /> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <img src="skins/ChatFormClose.png" style="cursor:pointer" alt="关闭窗口" onclick="parent.divChatPanel.innerHTML=''"  /> 
                       <input type="hidden" id="hidOtherId" runat="server" />
                       <input type="hidden" id="hidHostId" runat="server" />
                        <input type="hidden" id="hidOtherName" runat="server" />
                       <input type="hidden" id="hidHostName" runat="server" />
                    </td>
                </tr>
            </table>
         </div>
         
    </div>
</div>
    </form>
</body>
</html>
