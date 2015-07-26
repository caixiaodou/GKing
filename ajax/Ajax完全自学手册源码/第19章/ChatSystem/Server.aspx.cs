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
using ChatSystem.DataOperator;

namespace ChatSystem
{
	/// <summary>
	/// Server 的摘要说明。
	/// </summary>
	public class Server : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(this.Request["action"]!=null && this.Request["action"].Trim()!="")
			{
				switch(this.Request["action"])
				{
					case "Login":
						this.ProcessLogin();
						break;
					case "PostMsg":
						this.ProcessPostMsg();
						break;
					case "GetMsg":
						this.ProcessGetMsg();
						break;
					case "UserList":
						this.ProcessUserList();
						break;
					default:
						break;
				}
			}
		}


		protected void ProcessLogin()
		{
			if(this.Request.QueryString.Count==0)
			{
				return;
			}

			string user=this.Request["UserName"].ToString();
			Guid g=Guid.NewGuid();
			ChatSystem.Global.Engine.AddUser(g.ToString(),user);
			this.Response.Redirect("Chat.aspx?guid="+g.ToString());
		}

		protected void ProcessPostMsg()
		{
			if(this.Request.QueryString.Count!=4)
			{
				return;
			}

			if(this.Request.QueryString["u"]==null)
			{
				return;
			}

			if(this.Request.QueryString["t"]==null)
			{
				return;
			}

			string u=this.Request.QueryString["u"].ToString();
			u=u.Substring(5,u.Length-5);
			string t=this.Request.QueryString["t"].ToString();

			bool isExists=ChatSystem.Global.Engine.UserExists(u);
			if(!isExists)
			{
				return;
			}

			ChatSystem.Global.Engine.AddText(u,t);
		}

		protected void ProcessGetMsg()
		{
			this.Response.Write(ChatSystem.Global.Engine.BufferText);
		}

		protected void ProcessUserList()
		{
			this.Response.Write(ChatSystem.Global.Engine.UserList);
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
