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
	/// WebForm1 ��ժҪ˵����
	/// </summary>
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btnGo;
		protected System.Web.UI.WebControls.Panel pnlProgressBar;

		private void Page_Load(object sender, System.EventArgs e)
		{
			this.btnGo.Attributes.Add("onclick","progressGo()");
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
