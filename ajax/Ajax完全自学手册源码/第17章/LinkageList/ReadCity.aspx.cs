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
using System.Xml;
using System.Data.SqlClient;

namespace LinkageList
{
	/// <summary>
	/// ReadCity 的摘要说明。
	/// </summary>
	public class ReadCity : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			int provinceID=Convert.ToInt32(this.Request["provinceID"].ToString());
			this.Response.ContentType="text/xml";
			this.WriteXmlDoc(provinceID);
		}


		private void WriteXmlDoc(int provinceID)
		{
			SqlConnection con=new SqlConnection("server=127.0.0.1;uid=sa;pwd=;database=Address");
			SqlCommand com=con.CreateCommand();
			com.CommandText="select * from area where ParentID="+provinceID+"";

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

			ds.WriteXml(this.Response.OutputStream);
			this.Response.End();
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
