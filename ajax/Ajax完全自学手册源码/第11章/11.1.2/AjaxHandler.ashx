<%@ WebHandler Language="C#" Class="AjaxHandler" %>
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AjaxHandler: IHttpHandler
{
    public void ProcessRequest(System.Web.HttpContext context)
    {
        string str = context.Request["customerInfo"].ToString();
        string msg = "服务器获得你的消息，时间:" + DateTime.Now.ToShortTimeString() + "<br>你的消息为:" + str + "<br>你的地址:" + context.Request.UserHostAddress;
        context.Response.Write(msg);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        } 
    }
}