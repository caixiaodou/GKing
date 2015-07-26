<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frame.aspx.cs" Inherits="Frame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="Css-Style/Otherstyle.css" rel="stylesheet" type="text/css" />
    <link href="Css-Style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="JavaScript/Login.js">
</script>
<script language="javascript" type="text/javascript" src="JavaScript/Frame.js">
</script>
<script language="javascript" type="text/javascript" src="JavaScript/Login.js">
</script>
</head>
<body onload="getNotReadMsg()">
    <form id="form1" runat="server">
        <!--聊天主面板-->
        <div style="width:151px;height:587px; background-image: url(skins/bg.gif);left:0px;top:0px; position: absolute;" id="divChatMaster" language="javascript">
            <!--关闭按钮覆盖层-->
            <div style="width:17px;height:17px;cursor:hand; left: 127px; position: absolute; top: 5px;" id="divClose"  onclick="parent.divWebQQPanel.innerHTML=''">
            </div> 
           <div style="width:77px;height:16px;cursor:hand; left:6px; position: absolute; top: 4px;color:#FFFFFF">
                WebQQ
             </div> 
            <!--用户信息等设置层--> 
           <div id="div1" style="left: 6px; width: 138px; cursor: hand; position: absolute;
                    top: 26px; height: 33px">
                   <div style="left: 1px; width:40px; cursor: hand; position: absolute;
                    top: 0px; height: 40px" id="divUserFace" runat="server" ></div> 
                
                <div style="left: 41px; width: 94px; cursor: hand; position: absolute;
                    top: 2px; height: 19px" id="divUserName" runat="server" ></div>
                <div id="divDropDown" style="left: 109px; width: 24px; cursor: hand; position: absolute;
                    top: 2px; height: 16px"> 
                </div>  
                <div style="left: 42px; width: 94px; cursor: hand; position: absolute;
                    top: 23px; height: 17px" id="divMsgAlam" onclick="loadMsg()">
                    <img src="skins/Message.gif"  style="cursor:hand" runat="server" id="imgMsgAlam" />
                   (<span id="spnMsgCount" runat="server"></span>)     
                 </div>
            </div>
           <!--好友列表层--> 
           <div style="left: 7px; width: 135px; position: absolute;
                    top: 69px; height: 453px"  id="divFriend">
            <iframe id="chatmain" src="ChartPanel.aspx" frameborder="0" marginheight="0" marginwidth="0"
                        width="134" scrolling="no" style="position: absolute; margin: 0; height: 454px; left: 1px; width: 588px; top: 0px;">
             </iframe>    
           </div> 
           <!--IP显示层-->
           <div style="width:140px;height:16px;cursor:hand; left:6px; position: absolute; top: 536px;color:#0000ff" id="divIpInfo" runat="server">
                你的IP：
             </div> 
            <div style="width:67px;height:19px;cursor:hand; left:6px; position: absolute; top: 560px;color:#0000ff" id="divOwnerSetting">
             </div> 
            <div style="width:67px;height:19px;cursor:hand; left:78px; position: absolute; top: 560px;color:#0000ff" id="divFindFriend"  onclick="findFriend()">
                
             </div>
             <div style="left: 153px; position: absolute; top: 28px;width:444px;height:557px" runat="server" id="divChatPanel">
                
              </div>  
        </div>
    </form>
</body>
</html>
