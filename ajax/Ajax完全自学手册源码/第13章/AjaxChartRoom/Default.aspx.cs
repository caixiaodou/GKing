using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void timer1_Tick(object sender, EventArgs e)
    {
        StringBuilder build = new StringBuilder(3000);
        foreach (Message msg in ChatEngin.Engin.GetAllMsg())
        {
            string userName = msg.User;
            string message = msg.Msg;
            string color = msg.Color;
            string face = msg.Face;
            bool isblod = msg.IsBlod;
            string other = msg.OtherTalker;
            string dt = msg.SendTime.ToLongTimeString();

            build.Append("<p>");
            build.Append("<font color=\"#FF0000\">" + dt + "</font>");
            build.Append(" [<font color=\"#663300\">" + userName + "</font>] ¶Ô [<font color=\"#663300\">");
            build.Append(other + "</font>] Ëµ:");

            if (color.Length != 0)
            {
                message = "<font color=\"" + color + "\">" + message + "</font>";
            }

            if (isblod)
            {
                message = "<b>" + message + "</b>";
            }
            else
            {
                message = "<i>" + message + "</i>";
            }

            if (face.Length != 0)
            {
                build.Append("<img src=\"face\\" + face + "\"");
            }

            build.Append(message);
            build.Append("</p>");
        }
        this.divChartList.InnerHtml = build.ToString();

    }


    protected void timer2_Tick(object sender, EventArgs e)
    {
        StringBuilder build = new StringBuilder(3000);
        build.Append("<ul>");
        foreach(User user in ChatEngin.Engin.GetAllUser())
        {
            string userName = this.Server.HtmlEncode(user.Name);
            build.Append("<li><a href=\"#\" onclick=\"document.getElementById('lbltowho').value='"+userName+"';\">"+userName+"</a></li>");
        }

        build.Append("</ul>");
        this.divUserList.InnerHtml = build.ToString();
    }


    protected void timer3_Tick(object sender, EventArgs e)
    {
        
    }


    protected void btnSend_Click1(object sender, ImageClickEventArgs e)
    {
        string msg = this.txtMsg.Value;
        string color = this.slcFontColor.Value;
        string face = this.slcFacelist.Value;
        bool isblod = this.slcFont.Value == "1" ? true : false;
        string other = this.lbltowho.Value;

        Message message = new Message(User.Identity.Name, face, other, msg, color, isblod,DateTime.Now);
        ChatEngin.Engin.SendMessage(message);
        this.txtMsg.Value = "";
        this.txtMsg.Focus(); 
    }
}