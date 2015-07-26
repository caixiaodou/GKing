<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="background-color:#B3D7F9;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div style="width:1020px;text-align:center;background-color:#B3D7F9;">
           <table cellpadding="0" cellspacing="0" border="0" width="1020px">
                <tr>
                    <td width="85%" valign="top">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="100%" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="100%" valign=top>
                                                <asp:UpdatePanel runat=server ID="udpChatList" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="divChartList" runat=server style="width:100%;height:900px;border-style:solid;border-color:#B8F687;height: 365px; vertical-align: top; overflow-y: auto;
                                                            text-align: left; margin-left: 10px; ">
                                                                
                                                        </div>
                                                    </ContentTemplate>  
                                                   <Triggers> 
                                                        <asp:AsyncPostBackTrigger  ControlID="timer1" EventName="Tick" />
                                                   </Triggers> 
                                                </asp:UpdatePanel>
                                               <asp:Timer runat="server" ID="timer1" Interval="1000" OnTick="timer1_Tick"></asp:Timer> 
                                               <asp:Timer runat="server" ID="timer2" Interval="5000" OnTick="timer2_Tick"></asp:Timer> 
                                               <asp:Timer runat="server" ID="timer3" Interval="30000" OnTick="timer3_Tick"></asp:Timer>  
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr width="100%" valign="top">
                                             <td align="left">
                                                 <span  style="font-size:12px;color:#4260BF;">我 对:
                                                    <input name="mtowho" type="text" runat="server"  id="lbltowho" value="所有人"
                                                        size="10" readonly="readonly"  style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid" />
                                                    <select name="slcFont" id="slcFont" runat="server"  style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid">
                                                        <option value="0" selected="selected">一般</option>
                                                        <option value="1">粗体</option>
                                                        <option value="2">斜体</option>
                                                    </select>
                                                    <select name="slcFontColor" id="slcFontColor" runat="server" size="1"  style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid">
                                                        <option value="#FFFFFF" style="background-color: #FFFFFF"></option>
                                                        <option value="#000000" style="background-color: #000000" selected="selected"></option>
                                                        <option value="#CCCCCC" style="background-color: #CCCCCC"></option>
                                                    </select>
                                                    <select name="slcFacelist" id="slcFacelist" runat="server"  style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid">
                                                        <option value="" selected="selected">不用表情</option>
                                                        <option value="0.gif">开心</option>
                                                        <option value="1.gif">撇嘴</option>
                                                        <option value="2.gif">色</option>
                                                        <option value="3.gif">发呆</option>
                                                        <option value="4.gif">得意</option>
                                                        <option value="5.gif">流泪</option>
                                                        <option value="6.gif">害羞</option>
                                                        <option value="7.gif">闭嘴</option>
                                                        <option value="8.gif">睡觉</option>
                                                        <option value="10.gif">大哭</option>
                                                    </select>
                                                </span>
                                             </td>
                                        </tr>
                                        <tr width="100%" valign="top">
                                            <td width="100%">
                                                 <asp:UpdatePanel runat="server" ID="udpSay" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                <input id="txtMsg" type="text" runat="server" style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid" />
                                <asp:ImageButton runat="server" ID="btnSend"  style="border-right: #4260bf thin solid; border-top: #4260bf thin solid; border-left: #4260bf thin solid; border-bottom: #4260bf thin solid"  ImageUrl="~/Image/queding.jpg" OnClick="btnSend_Click1" />
                                                    </ContentTemplate>
                                                 </asp:UpdatePanel>
                                            </td>
                                        </tr> 
                                    </table> 
                                </td>
                            </tr>
                        </table>
                    </td>
                   <td width="15%">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr width="100%" valign="top">
                                <td align="center" style="color:White">
                                    <img  src="Image/guanliyuan.gif" />用户列表
                               </td>
                           </tr>
                          <tr>
                               <td width="100%" valign="top">
                                    <asp:UpdatePanel  runat="server" ID="udpUserList" UpdateMode=Conditional>
                                        <ContentTemplate>
                                            <div id="divUserList" runat=server style="width:96%;height:600px;border-style:solid;border-color:#B8F687;border-width:3px;">
                                                            
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="timer2" EventName="Tick" />
                                        </Triggers> 
                                    </asp:UpdatePanel>
                              </td> 
                          </tr> 
                        </table> 
                   </td> 
                </tr>
           </table>
        </div>
    </form>
</body>
</html>
