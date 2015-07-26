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
	/// ReadCity ��ժҪ˵����
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

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
