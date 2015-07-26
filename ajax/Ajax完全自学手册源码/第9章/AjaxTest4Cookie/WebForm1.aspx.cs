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

namespace AjaxTest4Cookie
{
	
	public partial class WebForm1 : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			//this.btnSubmit.Attributes.Add("onClick","setCookie(\"userName\",document.forms[0].txtUserName.value);setCookie(\"UserEmail\",document.forms[0].txtEmail.value)");
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

		}
		#endregion

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			HttpCookie cookie=new HttpCookie("userName",this.txtUserName.Text);
			cookie.Expires=DateTime.Now.AddYears(1);
			this.Response.SetCookie(cookie);

			HttpCookie cookie1=new HttpCookie("UserEmail",this.txtEmail.Text);
			cookie1.Expires=DateTime.Now.AddYears(1);
			this.Response.SetCookie(cookie1);
		}
	}
}
