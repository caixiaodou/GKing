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

public partial class AjaxPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = this.Request["customerInfo"].ToString();
        string msg = "服务器获得你的消息，时间:" + DateTime.Now.ToShortTimeString() + "<br>你的消息为:" + str + "<br>你的地址:" + this.Request.UserHostAddress;
        this.Response.Write(msg);
        this.Response.End();
    }
}
