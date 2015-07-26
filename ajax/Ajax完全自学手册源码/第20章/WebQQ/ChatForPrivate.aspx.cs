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

public partial class ChatForPrivate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request["msgId"] != "0" && this.Request["msgId"]!=null)
        {
            this.MakeMsgShow(Convert.ToInt32(this.Request["msgId"]));
        }

        this.hidHostName.Value = ((UserItem)this.Session["User"]).NickName;
        this.hidHostId.Value = ((UserItem)this.Session["User"]).Id.ToString();

        if(this.Request["hostId"]!=null && this.Request["otherId"]!=null)
        {
            this.hidOtherId.Value = this.Request["otherId"].ToString();
            UserItem other = new UserItem();
            other = (new UsersOperator()).LoadUser(Convert.ToInt32(this.Request["otherId"]));
            this.hidOtherName.Value = other.NickName;

           
            this.txtChatPrivateList.InnerText += "";
            this.txtChatPrivateList.InnerHtml += "";
        }
    }

    /// <summary>
    /// 组装显示消息内容的HTML字符串 并更新未读消息为已读消息
    /// </summary>
    /// <param name="msgId">需要显示消息的ID</param>
    private void MakeMsgShow(int msgId)
    {
        MessageOperator mo = new MessageOperator();
        MessageItem item = mo.GetMessage(msgId);
        UsersOperator uo=new UsersOperator();
        UserItem fromUser = uo.LoadUser(item.FromUserId);
        UserItem toUser=uo.LoadUser(item.ToUserId);

        this.hidOtherId.Value = fromUser.Id.ToString();
        this.hidOtherName.Value = fromUser.NickName;

        string title = string.Format("时间：{2}— {0}对{1}说：",fromUser.NickName,
                                                    toUser.NickName,item.MessageTime.ToString());

        string msg ="<br/>"+ item.Message;
        this.txtChatPrivateList.InnerText += title;
        this.txtChatPrivateList.InnerHtml += msg;
        MessageList list = new MessageList();
        list.Add(item);
        mo.UpdateMsg2Readed(list);
    }
}
