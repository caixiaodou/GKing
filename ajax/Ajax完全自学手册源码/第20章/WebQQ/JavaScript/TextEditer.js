/**
 * @author Administrator
 */

var editor;
var newMsg;


function createEditer()
{
	document.write('<iframe name="TextEditor"  id="wrEditor" width="100%" frameBorder="0" height="100%" src="about:blank"></iframe>');
	editor=document.getElementById("TextEditor").contentWindow;
	var str = '<html><style>body{font-size:14px; margin:2px;}\ntd, a{color:#0000FF; font-size:14px;}</style><body  style="scrollbar-face-color: #DBEBFE; scrollbar-shadow-color: #B8D6FA; scrollbar-highlight-color: #FFFFFF; scrollbar-3dlight-color: #DBEBFE; scrollbar-darkshadow-color:#458CE4; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #458CE4"></body></html>';
	editor.document.open();
	editor.document.write(str);
	editor.document.close();
	editor.document.designMode="On";
	editor.focus();
}


function textStyle(doText,commandName)
{
	if(doText!="")
	{
		editor.document.execCommand(commandName);
	}
}

function SlcCreateRange()
{
	return editor.document.selection.createRange();
}

function textBlod()
{
	var dotext=SlcCreateRange();
	textStyle(dotext,"bold");
}

function textItalic()
{
	var dotext=SlcCreateRange();
	textStyle(dotext,"italic");
}

function textUnderLine()
{
	var dotext=SlcCreateRange();
	textStyle(dotext,"underline");
}

function reAlign(alignMode)
{
	switch(alignMode)
	{
		case "left":
			textStyle(1,"JustifyLeft");
			break;
		case "right":
			textStyle(1,"JustifyCenter");
			break;
		case "center":
			textStyle(1,"JustifyRight");
			break;
	}
}



function textColor()
{
	var colorValue=window.showModalDialog("FontEditor/ColorEditor.htm",window,"dialogWidth:480px; dialogHeight:450px; status:0; help:0");
	if(colorValue)
	{
		var dotext=SlcCreateRange();
		if(dotext)
		{
			editor.document.execCommand("ForeColor","false",colorValue);
		}
		editor.focus();
	}
}

function textBackColor()
{
	var colorValue=window.showModalDialog("FontEditor/ColorEditor.htm",window,"dialogWidth:480px; dialogHeight:450px; status:0; help:0");
	if(colorValue)
	{
		var dotext=SlcCreateRange();
		if(dotext)
		{
			editor.document.execCommand("BackColor","false",colorValue);
		}
		editor.focus();
	}
}

function textFontSize(fontSize)
{
	var dotext=SlcCreateRange();
	if(dotext)
	{
		editor.document.execCommand("FontSize","false",fontSize);
	}
}

function textFontName(fontName)
{
	var dotext=SlcCreateRange();
	if(dotext)
	{
		editor.document.execCommand("FontName","false",fontName);
	}
}


//去除用户发送超链接时生成的<A />标记
function correctUrl(cont)
{
	var regExp;
	regExp = /<a([^>]*) href\s*=\s*([^\s|>]*)([^>]*)/gi
	cont = cont.replace(regExp, "<a href=$2 target=\"_blank\"");
	regExp = /<a([^>]*)><\/a>/gi
	cont = cont.replace(regExp, "");
	return cont;
}

//获得当前编辑
function getContent()
{
	return correctUrl(editor.document.body.innerHTML);
}

function clearMsg(str,hostName,otherName)
{
	var txtChatPrivateList=ajaxXMl.$("txtChatPrivateList");
	if(editor)
	{
	    editor.document.body.innerHTML='';
	}
	var date=new Date();
	var newMsg=date.getTime()+"-"+hostName+"-"+otherName+":<br>"+str+"<br/>";
	txtChatPrivateList.innerHTML+=newMsg;
}

