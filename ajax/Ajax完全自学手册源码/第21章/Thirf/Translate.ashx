<%@ WebHandler Language="C#" Class="Translate" %>

using System;
using System.Web;
using System.Text.RegularExpressions;
using System.Xml;
using System.Text;

public class Translate : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        string text = string.Format("{0}={1}","text",context.Server.UrlEncode(context.Request["text"]));
        string langpair =string.Format("{0}={1}","langpair",context.Server.UrlEncode(context.Request["langpair"])) ;
        //hl请求参数设定当前浏览器的语言为简体中文 hl即home Language 
        string hl = string.Format("{0}={1}","hl",context.Server.UrlEncode("zh-CN"));
        //ie请求参数设定字符集 
        string ie = string.Format("{0}={1}","ie",context.Server.UrlEncode("UTF8"));
        string oe = string.Format("{0}={1}", "oe", context.Server.UrlEncode("UTF8")); 

        //请求参数
        string post = text + "&" + langpair + "&" + hl + "&" + ie+"&"+oe;

        string result = Thirf.Post("http://translate.google.com/translate_t",post);


        //result = Regex.Match(result, @"<div id=result_box  dir=ltr>[\\s\\S]*?</div>").Value;
       result = result.Substring(result.IndexOf("<div id=result_box dir=\"ltr\">"), result.Length - result.IndexOf("<div id=result_box dir=\"ltr\">") - 1);
       result = result.Substring(result.IndexOf("<div id=result_box dir=\"ltr\">"),  result.IndexOf("</td>") );
        result = result.Substring(0, result.Length - 6);
        context.Response.Write(result);//输出  
         
    }
 
    public bool IsReusable
    {
        get {
            return false;
        }
    }

}