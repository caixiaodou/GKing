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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);

        if (ChatEngin.Engin.GetUser(this.txtUserName.Text.Trim()) == null )
        {
            User user = new User(this.txtUserName.Text.Trim(), this.txtPwd.Text.Trim());
            ChatEngin.Engin.AddUser(user);
            user.UpdateLastLogin();

            Message msg1 = new Message(string.Format("{0}进入了聊天室", user.Name));
            ChatEngin.Engin.SendMessage(msg1);

            FormsAuthentication.RedirectFromLoginPage(user.Name, false);
        }
        else
        {
            if (ChatEngin.Engin.GetUser(this.txtUserName.Text.Trim()).Pwd == this.txtPwd.Text.Trim())
            {
                User user = new User(this.txtUserName.Text.Trim(), this.txtPwd.Text.Trim());
                Message msg1 = new Message(string.Format("{0}进入了聊天室", user.Name));
                ChatEngin.Engin.SendMessage(msg1);

                FormsAuthentication.RedirectFromLoginPage(user.Name, false);
            }
            else
            {
                this.lblMsg.Text = "用户已存在，且密码不正确，请使用其他帐号登陆";
                return;
            }
        }

      
    }
}
