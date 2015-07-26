<%@ WebHandler Language="C#" Class="adArray" %>
using System;
using System.Web;
using System.Collections.Generic;


public class adArray : IHttpHandler 
{
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/plain";//输出类型
        string result="var ads=new Array(";//返回的脚本变量
        
        List<KeyWord> list = KeyWordOperator.GetAllKeyWord();
        foreach(KeyWord key in list)
        {
            result += "\"" + key.Name + "\",";
        }  
        
        if(result.EndsWith(","))
        {
            result = result.Substring(0, result.Length - 1);
        }

        result += ");";  
        context.Response.Write(result );//输出脚本变量
    }
    
    public bool IsReusable
    {
        get 
        {
            return false;
        }
    }
}