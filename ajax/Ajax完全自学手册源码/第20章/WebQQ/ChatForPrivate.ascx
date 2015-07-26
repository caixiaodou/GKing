<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChatForPrivate.ascx.cs" Inherits="ChatForPrivate" %>
<script language="javascript" type="text/javascript">
<!--

function DIV1_onclick() {

}

// -->
</script>

<div style="left: 0px; background-image: url(skins/ChatFormBG.jpg); position: absolute; top: 0px;width:444px;height:360px">
    <div style="left: 422px; position: absolute; top: 1px;cursor:pointer" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
        <img src="skins/Close.gif" id="IMG1" language="javascript" onclick="return IMG1_onclick()"  />
    </div>
    <div style="width:420px;height:192px; left: 10px; position: absolute; top: 27px;float:right; ">
        <div style="width:396px;height:30px; left: 13px; position: absolute; top: 6px; background-image: url(skins/ChatBarBg.jpg);">
           <asp:Button ForeColor="#045371" ID="Button1" runat="server" BackColor="#a3ddff" BorderColor="#E0E0E0"
            BorderWidth="0px" Height="15px" OnClick="Button1_Click" OnClientClick=" clearInterval(isdog);return true;"
            Style="vertical-align: middle; position: absolute; left: 253px; top: 7px;" Text="删除该好友"
            Width="62px" />
        <asp:Button ForeColor="#045371" BackColor="#a3ddff" Style="vertical-align: middle;
            position: absolute; left: 327px; top: 7px;" ID="Button2" OnClick="Button2_Click"
            runat="server" Width="62px" Text="拉入黑名单" OnClientClick=" clearInterval(isdog);return true;"
            Height="15px" BorderWidth="0px" BorderColor="#E0E0E0"></asp:Button>
         </div>
          <div style="width:418px;height:143px; left:0px; position: absolute; top: 40px; ">
            <asp:TextBox runat="server" ID="txtChatPrivateList" TextMode="MultiLine"  Width="100%" Height="100%">
            </asp:TextBox>  
         </div> 
         <div style="width:422px;height:130px; left:0px; position: absolute; top: 195px; ">
            <table cellpadding=0 cellspacing=0 width="100%">
                <tr valign=top>
                    <td align=left width=100%>
                        <select name="font_name" style="width: 100" id="font_name" onchange="FontName(this.options[this.selectedIndex].value)">
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
                       <select name="font_size" id="font_size" onchange="FontSize(this.options[this.selectedIndex].value)">
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
                        <asp:TextBox runat=server ID="txtSendMsg" TextMode="MultiLine" Height="81px" OnTextChanged="txtSendMsg_TextChanged" Width="421px"></asp:TextBox>
                   </td> 
                </tr>
                <tr>
                    <td align=center>
                        <img src="skins/SendMsg.png" style="cursor:pointer" alt="发送消息" /> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <img src="skins/ChatFormClose.png" style="cursor:pointer" alt="关闭窗口" /> 
                    </td>
                </tr>
            </table>
         </div>
    </div>
</div>