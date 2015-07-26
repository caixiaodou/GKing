<%@ WebHandler Language="C#" Class="MsgHandler" %>
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using myqq.Entity;
using myqq.DataOperate;

/// <summary>
/// MsgHandler 的摘要说明
/// </summary>
public class MsgHandler : IHttpHandler,IRequiresSessionState
{
	public MsgHandler()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    #region IHttpHandler 成员

    public bool IsReusable
    {
        get { return false; }
    }

    public void ProcessRequest(HttpContext context)
    {
        int type = Convert.ToInt32(context.Request["type"]);
        int uid = ((UserItem)context.Session["User"]).Id; 
         
        switch(type)
        {
            case 0:
                
                MessageItem item = this.GetFirstNotReadMsg(uid);
                if(item!=null)
                {
                    context.Response.Write(item.Id);
                }
                else
                {
                    context.Response.Write(0);
                }
                break; 
            case 1:
                context.Response.Write(this.GetNotReadMsgListCount(uid));
                break;
            case 2:
                int fromUserId = Convert.ToInt32(context.Request["fromUserId"]);
                int toUserId = Convert.ToInt32(context.Request["toUserId"]);
                string msg = context.Request["msg"];
                this.InsertMsg(toUserId,fromUserId,msg);
                break;
        }   
    }

    /// <summary>
    /// 获取用户当前未读消息中第一条未读消息，按时间排序
    /// </summary>
    /// <param name="userId">用户ID</param>
    /// <returns></returns>
    private MessageItem GetFirstNotReadMsg(int userId)
    {
        MessageOperator mo = new MessageOperator();
        MessageList list = mo.GetNoReadMessage4ToUserId(userId);
        return  list.Length > 0 ? list[0] : null;  
    }

    /// <summary>
    /// 获得用户未读消息数目
    /// </summary>
    /// <param name="userId">用户ID</param>
    /// <returns></returns>
    private int GetNotReadMsgListCount(int userId)
    {
        MessageOperator mo = new MessageOperator();
        MessageList list = mo.GetNoReadMessage4ToUserId(userId);
        return list.Length; 
    }

    /// <summary>
    /// 向数据库中插入消息  并将该消息状态设定为未读
    /// </summary>
    /// <param name="toUserId">接收者ID</param>
    /// <param name="fromUserID">发送者ID</param>
    /// <param name="msg">消息内容</param>
    private void InsertMsg(int toUserId,int fromUserID,string msg)
    {
        MessageOperator mo = new MessageOperator();
        MessageItem item = new MessageItem();
        item.ToUserId = toUserId;
        item.FromUserId = fromUserID;
        item.Message = msg;
        item.MessageState =MessageState.NoRead;
        item.MessageTypeId = 1;
        item.MessageTime = DateTime.Now; 

        mo.InsertMessage(item);        
    }

    #endregion
}
