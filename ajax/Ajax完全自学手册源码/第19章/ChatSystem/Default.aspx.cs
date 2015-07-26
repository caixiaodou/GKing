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
	/// _Default ��ժҪ˵����
	/// </summary>
	public class _Default : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtUsername;
		protected System.Web.UI.WebControls.Button btnLogin;
		protected System.Web.UI.WebControls.Literal lblErrorMsg;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			//��FireFox�У��õ������ϵ�ֵΪevent.which����IE �еõ����̵�ֵevent.keyCode 13�ǻس�  AScII��ֵ  
			//���������ı����е����س���ʱ�򣬾�ִ�а�ť���¼�
			txtUsername.Attributes.Add("onkeydown", 
				"if(event.which || event.keyCode)"+
				"{if ((event.which == 13) || (event.keyCode == 13)) "+
				"{document.getElementById('"+btnLogin.UniqueID+"').click();"+
				"return false;}}"+
				" else {return true}; ");
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
				this.lblErrorMsg.Text="���û��Ѿ����ڣ������µ�½";
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
					this.lblErrorMsg.Text="�û����������������ĸ�ַ�";
					return false;
				}
			}

			if(nick.Length>18)
			{
				this.lblErrorMsg.Text="�û�������ַ������ó���18";
				return false;
			}

			return true;
		}



	}
}
