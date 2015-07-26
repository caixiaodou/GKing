<%@ WebHandler Language="C#" Class="FriendHandler" %>
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
using myqq.DataOperate;

/// <summary>
/// FriendHandler 的摘要说明
/// </summary>
public class FriendHandler : IHttpHandler , System.Web.SessionState.IRequiresSessionState
{
	public FriendHandler()
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
        UserItem item = (UserItem)context.Session["User"];

        switch (type)
        { 
            case 0:
                int friendId=Convert.ToInt32(context.Request["friendId"]); 
                FriendsOperator fo = new FriendsOperator();
                FriendList list = fo.LoadFrendList(item.Id,1);
                if(list!=null)
                {
                    foreach (FriendItem f in list)
                    {
                        if (friendId == f.FriendId)
                        {
                            context.Response.Write("该用户已经被你加为好友了");
                            return;
                        }
                    }
                }

                if (this.AddFriend(friendId, item.Id) == 1)
                {
                    context.Response.Write("加为好友成功");
                }
                else
                {
                    context.Response.Write("服务器错误");
                }
                
                break;
            case 1:
                break; 
        }   
    }

    private int AddFriend(int friendId,int userId)
    {
        FriendsOperator fo = new FriendsOperator();
        int result= fo.AddFriend(userId, 1, friendId);
        return result;
    }

    #endregion
}
