using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

namespace LinkageList
{
	/// <summary>
	/// WebForm1 的摘要说明。
	/// </summary>
	public class DataBind : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblProvince;
		protected System.Web.UI.WebControls.DropDownList ddlProvince;
		protected System.Web.UI.WebControls.Label lblCity;
		protected System.Web.UI.WebControls.DropDownList ddlCity;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!this.IsPostBack)
			{
				this.BindDropDownList();
				this.ddlProvince.Attributes.Add("onchange","startRequest(this.options[this.selectedIndex].value)");	
			}
			else
			{
				this.ddlProvince.Attributes.Add("onchange","startRequest(this.options[this.selectedIndex].value)");
			}
		}


		private void BindDropDownList()
		{
			SqlConnection con=new SqlConnection("server=127.0.0.1;uid=sa;pwd=;database=Address");
			SqlCommand com=con.CreateCommand();
			com.CommandText="select * from area where ParentID=0";

			SqlDataAdapter adpt=new SqlDataAdapter();
			adpt.SelectCommand=com;

			DataSet ds=new DataSet();

			con.Open();
			try
			{
				adpt.Fill(ds);
			}
			catch(Exception ex)
			{
				
			}
			finally
			{
				con.Close();
			}

			this.ddlProvince.DataSource=ds;
			this.ddlProvince.DataMember=ds.Tables[0].TableName;
			this.ddlProvince.DataTextField="Name";
			this.ddlProvince.DataValueField="AreaID";
			this.ddlProvince.DataBind();
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
