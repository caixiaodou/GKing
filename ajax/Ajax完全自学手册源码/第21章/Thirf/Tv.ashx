<%@ WebHandler Language="C#" Class="Tv" %>

using System;
using System.Web;
using System.Xml;
using System.Data;
using System.IO;


public class Tv : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        int type = Convert.ToInt32(context.Request["type"].ToString());
        context.Response.ContentType = "text/xml"; 
    
        switch(type)
        {
            case 0:
                //动态加载频道列表 
                string tvSet = context.Request["TVSET"].ToString();
                XmlOperator xo = new XmlOperator();
                DataSet ds=xo.ReadXml(tvSet);
                ds.WriteXml(context.Response.OutputStream);
                context.Response.OutputStream.Flush();
                context.Response.End();
                break;
            case 1:
                //获取当天的电视节目预告内容 
                GetContent(context);
                break;  
            case 2:
                //根据客户选择的周天数，获取电视节目预告内容 
                GetContent(context);
                break; 
           
        } 
    }

    /// <summary>
    /// 根据HttpContext中参数个数组装Url 并将清除了冗余数据的数据发送至前台
    /// </summary>
    /// <param name="context">HttpContext对象</param>
    private void GetContent(HttpContext context)
    {
        string tvSet = context.Request["TVSET"];
        string chanel = context.Request["chanelID"];

        switch (tvSet)
        {
            case "CCTV":
                tvSet = "CCTV";
                break;
            case "湖南":
                tvSet = "HUNANTV";
                break;
            case "凤凰卫视":
                tvSet = "PHOENIX";
                break; 
        }

        string url = string.Empty;
        //判断是否含有周天数请求参数 
        if (context.Request.QueryString.Count==4)
        {
           url = this.MakeUrl(tvSet, chanel, context.Request["weekDay"]);
        }
        else
        {
            url = this.MakeUrl(tvSet, chanel);
        }  
        string responseStr = Thirf.Post(url);
        string content = string.Empty;
        content = HtmlTools.DelOption(responseStr);
        content = HtmlTools.DelATag(content);
        content = HtmlTools.DelLink(content);

        content = content.Substring(content.IndexOf("<table id=\"main_body\">"), content.Length - content.IndexOf("<table id=\"main_body\">"));

        context.Response.Write(content);
             
    }

    private string MakeUrl(string tvSet,string chanel)
    {
        string url =string.Empty;
        //获取当前日期中的周天数 
        DayOfWeek nowTime = DateTime.Now.DayOfWeek;

        url = string.Format(@"http://www.tvmao.com/ext/show_tv.jsp?c={0}&day={1}", tvSet + chanel, Convert.ToInt32(nowTime));
        return url;
    }

    private string MakeUrl(string tvSet, string chanel,string weekDay)
    {
        string url = string.Empty;
        //根据用户选择的周天数
        url = string.Format(@"http://www.tvmao.com/ext/show_tv.jsp?c={0}&day={1}", tvSet + chanel, weekDay);
        return url;
    }
 
    public bool IsReusable 
    {
        get
        {
            return false;
        }
    }

}