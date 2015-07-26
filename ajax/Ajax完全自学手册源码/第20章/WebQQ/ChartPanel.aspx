<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChartPanel.aspx.cs" Inherits="ChartPanel" %>

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
    </style>
    <script language=javascript src="JavaScript/Login.js"></script>
    <script language=javascript src="JavaScript/ChatPanel.js"></script>
</head>
<body   style="background-color: #daebf7; margin: 0">
    <form id="form1" runat="server">
        <div id="mainboard" style="z-index: 1; background: #B5D9F2; left: 2px; overflow: hidden;
                width: 134px; position: absolute; top: 0px; height: 454px">
                <input type=hidden runat=server id="hidHostId" style="width: 127px; height: 20px" />
            <div style="width:134px;position: absolute; top: 0px; height: 28px;left:0px;background-image:  url(skins/ToolBarBackground.bmp);cursor:hand"  id="divItem1">
                <img  src="skins/friend.gif" />我的好友
            </div>
            <div style="width:134px;position: absolute; top: 368px; height: 28px;left:0px;background-image:  url(skins/ToolBarBackground.bmp);cursor:hand"  id="divItem2">
                <img  src="skins/msn.gif" />陌生人
            </div>
           <div style="width:134px;position: absolute; top: 425px; height: 28px;left:0px;background-image:  url(skins/ToolBarBackground.bmp);cursor:hand"  id="divItem3">
                <img  src="skins/Group.gif" />
               我的群组
            </div> 
           <div style="left: 0px; background-image: url(skins/ToolBarBackground.bmp);cursor:hand;width:134px;
                   position: absolute; top: 396px; height: 28px; "  id="divItem4">
                   <img src="skins/blacklist.gif" />黑名单
               </div> 
              <div style="width:134px;height:338px;position: absolute; top: 28px; left: 0px; background-color: #ffffff;cursor:hand" id="divFriendList" runat="server">
              
              </div> 
        </div>
       <div  runat="server" style="left: 143px; position: absolute; top: 0px; background-color: #ffffff;width:483px;height:454px;" id="divChatPanel"></div> 
    </form>
</body>
</html>
