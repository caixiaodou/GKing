<%@ WebHandler Language="C#" Class="Advertise" %>

using System;
using System.Web;

public class Advertise : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) 
    {
        context.Response.ContentType = "text/plain";
        string result = "";//返回的广告内容
        DataOperator dbo = new DataOperator();
        string key = HttpContext.Current.Request.QueryString["key"];//指定的广告关键字

        string str = "select [Description] ,Url from Advertise inner join KeyWord on Advertise.KeyID=KeyWord.KeyID where KeyWord.name='" + key + "' order by Advertise.AdvertiseID desc";
        System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand();
        com.CommandText = str;
        dbo.TableName = "Advertise"; 
        System.Data.DataSet ds = dbo.Select(com);//获得广告内容
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)//把所有相关的广告内容附加到字符串
        {
            result += "<a target=\"_blank\"  href=\"";
            result +=  ds.Tables[0].Rows[i]["url"].ToString() + "\">" + ds.Tables[0].Rows[i]["description"].ToString() + "</a><br/>";
        }
        context.Response.Write(result);//输出
    }
 
    public bool IsReusable
    {
        get 
        {
            return false;
        }
    }

}