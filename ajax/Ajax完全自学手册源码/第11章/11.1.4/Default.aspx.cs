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
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string msg = "服务器获得你的消息，时间:" + DateTime.Now.ToShortTimeString() + "<br>你的消息为:" + this.txtCustomerInfo.Text + "<br>你的地址:" + this.Request.UserHostAddress;
        divServerMsg.InnerHtml = "<b>"+msg + "</b>";
    }
}
