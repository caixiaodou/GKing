using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (this.txtRandomCode.Text.Trim() == this.Application["Code"].ToString())
       {
           User u =UserOperator.LoginUser(this.txtUserName.Text,this.txtUserPwd.Text);
           if (u != null)
           {
               FormsAuthentication.SetAuthCookie(u.UserName,true);
               this.Server.Transfer("KeyManager.aspx");
           }
           else
           {
               ClientScript.RegisterStartupScript(this.GetType(),"alertError", "alert('用户名或密码错误 请重新输入')");
           }
       }
    }
}
