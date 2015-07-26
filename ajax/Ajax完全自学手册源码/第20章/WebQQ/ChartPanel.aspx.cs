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
using myqq.DataOperate;
using myqq.Entity;

public partial class ChartPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(this.Session["User"]!=null)
        {
            UserItem item = (UserItem)this.Session["User"];
            this.hidHostId.Value = item.Id.ToString();
            FriendList goodFriendList = this.GetFrientListByUserIdAndShipId(item.Id,1);
            if(goodFriendList!=null)
            {
                this.divFriendList.InnerHtml = this.MakeUnorderListString(goodFriendList);
            }
        }
    }

    /// <summary>
    /// 通过当前用户ID和好友分类信息ID
    /// 加载当前用户的特定好友分组的好友列表
    /// </summary>
    /// <param name="uid">当前用户ID</param>
    /// <param name="shipId">好友分类信息ID</param>
    /// <returns>好友列表</returns>
    private FriendList GetFrientListByUserIdAndShipId(int uid,int shipId)
    {
        FriendsOperator fo = new FriendsOperator();

        return fo.LoadFrendList(uid,shipId);
    }

    /// <summary>
    /// 组装显示在前台好友列表的HTML
    /// </summary>
    /// <param name="list">好友列表</param>
    /// <returns>HTML字符串</returns>
    private string MakeUnorderListString(FriendList list)
    {
        string htmlStr = "<table width=100% id='tblFriendList'>";
       
        foreach(FriendItem item in list)
        {
            UserItem friend=new UsersOperator().LoadUser(item.FriendId);
            string liStr = "<tr width=100% valign=top>";

            liStr += string.Format("<td><img src='{0}' id='{1}' onclick='friendFaceDbClick()' />", "faces/" + friend.FaceId.ToString() + ".bmp", friend.Id);
            liStr+=friend.NickName;
            liStr += "</td></tr>";
            htmlStr += liStr;
        }
        htmlStr += "</table>";

        return htmlStr;
    }
}
