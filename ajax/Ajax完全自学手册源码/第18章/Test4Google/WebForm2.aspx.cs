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

namespace Test4Google
{

	/// <summary>
	/// WebForm2 的摘要说明。
	/// </summary>
	public class WebForm2 : System.Web.UI.Page
	{
		
		private static int counter;

		private void Page_Load(object sender, System.EventArgs e)
		{
			this.Response.ContentType="text/xml";
			string task=this.Request["task"];
			string responseString="";
			DataTable dt=new DataTable();
			dt.Columns.Add(new DataColumn("percent",typeof(string)));

			if(task.Equals("start"))
			{
				responseString="<key>1</key>";
				WebForm2.counter=1;
			}
			else
			{
				string percent="";
					
					
				switch(WebForm2.counter)
				{
					case 1:
						percent="10";
						break;
					case 2:
						percent="21";
						break;
					case 3:
						percent="32";
						break;
					case 4:
						percent="44";
						break;
					case 5:
						percent="50";
						break;
					case 6:
						percent="67";
						break;
					case 7:
						percent="73";
						break;
					case 8:
						percent="88";
						break;
					case 9:
						percent="100";
						break;
				}

				WebForm2.counter++;

				DataRow row=dt.NewRow();
				row[0]=percent;
				dt.Rows.Add(row);
			}

			DataSet ds=new DataSet();
			ds.Tables.Add(dt);
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
