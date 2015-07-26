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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        {
            BloodTypeOperator bo = new BloodTypeOperator();
            DataTable blood = bo.GetAllBloodType();
            this.BindDropDownList(this.ddlBloodType,blood);

            StarOperator so = new StarOperator();
            DataTable star = so.GetAllStar();
            this.BindDropDownList(this.ddlConstellation, star);
        }
    }

    /// <summary>
    /// 为DropDowList绑定数据  
    /// </summary>
    /// <param name="ddl"></param>
    /// <param name="t"></param>
    private void BindDropDownList(DropDownList ddl,DataTable t)
    { 
        foreach(DataRow row in t.Rows)
        {
            ListItem item = new ListItem();
            item.Text = row[1].ToString();
            item.Value = row[0].ToString();
            ddl.Items.Add(item);
        }

        ddl.SelectedIndex = 0;
    }


    protected void btnRegister_Click(object sender, ImageClickEventArgs e)
    {
        UserItem item = new UserItem();
        item.LoginPwd = this.txtPwd.Text;
        item.NickName = this.txtNickName.Text;
        item.Sex=this.rdbMan.Checked ? "男" : "女";
        item.Name = this.txtName.Text;
        item.StarId = Convert.ToInt32(this.ddlConstellation.SelectedItem.Value);
        item.BloodTypeId = Convert.ToInt32(this.ddlBloodType.SelectedItem.Value);
        item.FaceId = Convert.ToInt32(this.hidFaceId.Value);

        UsersOperator uo = new UsersOperator();
        if (uo.InsertUser(item) == 1)
        {
            this.divLoginInfo.InnerText = "你的MyQQ ID为" + uo.LastUserId.ToString();
        }
        else
        {
            this.divLoginInfo.InnerText = "服务器错误";
        }
    }
}
