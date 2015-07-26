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
using myqq.Entity;
using myqq.DataOperate;

public partial class Frame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext context = HttpContext.Current;
        if(context.Session["User"]!=null)
        {
            UserItem item = (UserItem)this.Session["User"];

            this.Session["User"]=item;
            this.divUserName.InnerText= item.NickName;
            this.divIpInfo.InnerText+= this.Request.UserHostAddress.ToString();
            string html="<img id=‘imgUserFace’ style=‘width:40px;height:40px’ src='{0}' />  ";
            html=string.Format(html,"faces/"+item.FaceId+".bmp");
            this.divUserFace.InnerHtml = html;

            MessageList mList = this.GetCurrentUserReadingMessage(item);
            this.spnMsgCount.InnerText = mList.Length.ToString();
        }
    }

    private MessageList GetCurrentUserReadingMessage(UserItem item)
    {
        MessageList mList = new MessageList();
        MessageOperator mo = new MessageOperator();
        mList = mo.GetNoReadMessage4ToUserId(item.Id);
        return mList;
    }
}
