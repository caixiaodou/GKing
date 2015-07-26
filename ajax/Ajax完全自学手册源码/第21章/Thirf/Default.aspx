<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        td
       {
         border-right: #B5E2F7 thin solid;
          border-top: #B5E2F7 thin solid; 
          border-left: #B5E2F7 thin solid; 
          border-bottom: #B5E2F7 thin solid;
         font-size:18px;
         font-family:新宋体;
         color:#3333FF; 
         txt-align:center;
         cursor: hand;
         valign:top;
       } 
       
       td.Selected
       {
            border-right: #F99432 thin solid;
          border-top: #F99432 thin solid; 
          border-left: #F99432 thin solid; 
          border-bottom: #F99432 thin solid;
         font-size:18px;
         font-family:新宋体;
         color:#3333FF; 
         txt-align:center;
         cursor: hand;
         valign:top;
       }
    </style>
    <script type="text/javascript"  language=javascript src=ThirfTV.js></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <div style="left: 13px; position: absolute; top: 14px; background-color: #DEF7B5;width:845px;height:121px; z-index: 1;" id="divChanel">
                电视台： 
                <select  id="slcTvSet" onchange="getChanel(this.options(this.selectedIndex).value)">
                   <option>请选择省份</option> 
                    <option value="CCTV">中央电视台</option>
                    <option value="湖南">湖南电视台</option>
                   <option value="凤凰卫视">香港电视台</option> 
                 </select>
                频道：
                 <select id="slcTvChanel" onchange="changeContent(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,this.options(this.selectedIndex).value)">
                   
                 </select>
            </div> 
            <div style="left: 14px; position: absolute; top: 109px; background-color: #ffffff;width:843px;height:26px; z-index: 3;" id="div1">
                <table style="width:100%;height:21px;background-color: #E8FAFF; border-right: #00ff33 thin solid; border-top: #00ff33 thin solid; border-left: #00ff33 thin solid; border-bottom: #00ff33 thin solid; ">
                    <tr>
                        <td id="1" onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周一</td>
                       <td id="2"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周二</td>
                      <td id="3"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周三</td>
                      <td id="4"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周四</td>
                      <td id="5"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周五</td>
                      <td id="6"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周六</td>
                      <td id="7"  onclick="changeContentByWeekDay(document.getElementById('slcTvSet').options[document.getElementById('slcTvSet').selectedIndex].value,document.getElementById('slcTvChanel').options[document.getElementById('slcTvChanel').selectedIndex].value,this.id)">周七</td>
                    </tr>
              </table>
            </div>
            <div style="left: 14px; position: absolute; top: 167px; background-color: #EFF7FF;width:845px;height:450px" id="divContent">
             </div> 
        </div>
    </form>
</body>
</html>
