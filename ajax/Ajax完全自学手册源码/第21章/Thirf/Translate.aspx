<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Translate.aspx.cs" Inherits="Translate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>翻译页面</title>
    <script language=javascript src=ThirfTV.js></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:1060px;height:900px;text-align:center">
        <table width="100%" border=0 cellpadding=0 cellspacing=0>
            <tr>
                <td valign=top width=100%><img src="Image/Translate.jpg"/><h1>Ajax在线翻译</h1></td>
            </tr>
           <tr valign=top>
                <td>
                    请选择翻译语种:
                    <select style="width: 279px" id="slcLanguage">
                        <option value="0">请选择</option>
                       <option value="zh|en">中文至英语</option> 
                       <option value="en|zh-CN">英语至中文简体</option> 
                       <option value="en|zh-TW">英语至中文繁体</option> 
                       <option value="en|ja">英语至日语</option> 
                       <option value="ja|en">日语至英语</option> 
                       <option value="en|fr">英语至法语</option>
                       <option value="fr|en">法语至英语</option>  
                    </select>
                   <input type=button id="btnTranslate" value="翻译" onclick="translate(document.getElementById('slcLanguage').options[document.getElementById('slcLanguage').selectedIndex].value)" /> 
                </td>
           </tr> 
           <tr valign=top>
                <td valign=top align=center>
                    请输入翻译内容：
                    <textarea style="width:70%;height:128px;" id="txtContent"></textarea>
                </td>
           </tr>
           <tr valign=top>
                <td valign=top align=center>
                    翻译结果：<div style="Height:128px;width:70%;font-family:新宋体;font-size:20pt;color:Blue"  id="divResult"></div> 

                </td>
           </tr>
        </table>
    </div>
    </form>
</body>
</html>
