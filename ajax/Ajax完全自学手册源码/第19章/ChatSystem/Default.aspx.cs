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

namespace ChatSystem
{
	/// <summary>
	/// _Default 的摘要说明。
	/// </summary>
	public class _Default : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtUsername;
		protected System.Web.UI.WebControls.Button btnLogin;
		protected System.Web.UI.WebControls.Literal lblErrorMsg;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			//在FireFox中，得到键盘上的值为event.which，而IE 中得到键盘的值event.keyCode 13是回车  AScII码值  
			//当我们在文本框中单击回车的时候，就执行按钮的事件
			txtUsername.Attributes.Add("onkeydown", 
				"if(event.which || event.keyCode)"+
				"{if ((event.which == 13) || (event.keyCode == 13)) "+
				"{document.getElementById('"+btnLogin.UniqueID+"').click();"+
				"return false;}}"+
				" else {return true}; ");
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
			this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnLogin_Click(object sender, System.EventArgs e)
		{
			
			if(!this.ValiDateNick(this.txtUsername.Text))
			{
				return;
			}

			if(ChatSystem.Global.Engine.UserExists(this.txtUsername.Text))
			{
				this.lblErrorMsg.Text="该用户已经存在，请重新登陆";
			}

			this.Response.Redirect("Server.aspx?action=Login&UserName="+this.txtUsername.Text);
	}


		private bool ValiDateNick(string nick)
		{
			if(nick==string.Empty)
			{
				return false;
			}

			foreach(char c in nick)
			{
				int i=Convert.ToInt32(c);

				if(i>122 || i<65)
				{
					this.lblErrorMsg.Text="用户名不允许包含非字母字符";
					return false;
				}
			}

			if(nick.Length>18)
			{
				this.lblErrorMsg.Text="用户名最大字符数不得超过18";
				return false;
			}

			return true;
		}



	}
}
