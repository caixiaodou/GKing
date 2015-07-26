<%@ WebHandler Language="C#" Class="Login" %>
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using myqq.Entity;
using System.Web.SessionState;


/// <summary>
/// 用于登陆的HttpHandler
/// </summary>
public class Login : IHttpHandler,System.Web.SessionState.IRequiresSessionState
{
	public Login()
	{
		
	}

    #region IHttpHandler 成员

    public bool IsReusable
    {
        get { return false; }
    }

    public void ProcessRequest(HttpContext context)
    {
        int type = Convert.ToInt32(context.Request["type"].ToString());
        
        switch (type)
        { 
            case 1:
                UserItem item = this.LoginHandller(context.Request["qqNum"].ToString(),context.Request["pwd"].ToString());
                if (item != null)
                {
                    FriendsOperator fo = new FriendsOperator();

                    context.Session.Add("User",item); 
                    context.Response.Write(1);
                }
                else
                {
                    context.Response.Write(0);
                }
                break; 
        }  
    }

    private UserItem LoginHandller(string qqNum, string qqPwd)
    {
        UserItem item = new UserItem();
        myqq.Entity.UsersOperator uo = new UsersOperator();
        item = uo.Login(Convert.ToInt32(qqNum), qqPwd);
        return item;
    }

    #endregion
}
