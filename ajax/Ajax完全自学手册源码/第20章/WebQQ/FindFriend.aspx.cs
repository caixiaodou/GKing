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

public partial class FindFriend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        {
            UsersOperator uo = new UsersOperator();
            uo.LoadFrendList();

            uo.View.RowFilter = string.Format("Id<>{0}",((UserItem)this.Session["User"]).Id.ToString());
            this.grvFriend.DataSource = uo.View;
            this.grvFriend.DataBind();
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        UsersOperator uo = new UsersOperator();
        uo.LoadUser(Convert.ToInt32(this.txtFriendId.Text));

        this.grvFriend.DataSource = uo.View;
        this.grvFriend.DataBind();
    }
}
