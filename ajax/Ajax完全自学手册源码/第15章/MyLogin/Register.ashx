<%@ WebHandler Language="C#" Class="Register" %>
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
/// Register 的摘要说明
/// </summary>
public class Register : IHttpHandler
{
    
    public void ProcessRequest(HttpContext context)
    {
        int requestType = Convert.ToInt32(context.Request["type"]);

        bool result; 
        switch(requestType)
        {
            case 0:
                if (context.Request.QueryString.Count>1)
                {
                      string ctrlName = context.Request["ContrlName"].ToString();
                      context.Response.Write(UserTools.RangerUserControl(ctrlName));
                }
                break;
            case 1:
                result = UserTools.CheckLogin(context.Request["UserName"], context.Request["UserPwd"]);
                context.Response.Write(result.ToString());
                break;
            case 2:
                string uName = context.Request["uName"].ToString();
                result = UserTools.CheckUserName(uName);
                if (result)
                    context.Response.Write(1);
                else
                    context.Response.Write(0); 
                break;
            case 3:
                string userName = context.Request["UserName"].ToString();
                string pwd = context.Request["UserPwd"].ToString();
                string email = context.Request["UserEmail"].ToString();
                string valiCode = context.Request["ValiCode"].ToString();

                string code=HttpContext.Current.Application["Code"].ToString();
                if (code==valiCode)
                {
                    result = UserTools.InsertUser(userName, pwd, email);
                    if (result)
                    {
                        FormsAuthentication.SetAuthCookie(userName, true);
                    }  
                    context.Response.Write(result.ToString());
                }
                else
                {
                    context.Response.Write("验证码不正确，请重新输入");
                }
                break;
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
