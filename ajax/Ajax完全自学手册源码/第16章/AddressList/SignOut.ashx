<%@ WebHandler Class="SignOut" Language="C#" %>
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// SignOut 的摘要说明
/// </summary>
public  class SignOut : IHttpHandler
{
    #region IHttpHandler 成员

    public bool IsReusable
    {
        get { return false; }
    }

    public void ProcessRequest(HttpContext context)
    {
        System.Web.Security.FormsAuthentication.SignOut();
        context.Response.Write(string.Format("<b>{0}</b>","你已成功退出")); 
    }

    #endregion
}
