using System;
using System.Text;
using System.Threading;
using System.Collections;
using System.Collections.Specialized;

namespace ChatSystem.DataOperator
{
	/// <summary>
	///聊天引擎
	/// </summary>
	public class ChatEngine : IChatEngine
	{
		/// <summary>
		/// MSG的有序列表的前台Html语法元素
		/// </summary>
		public  const string MSG="<li class=\"{0}\">{1}</li>\r\n";

		public const string USERLISTFORMART="<li>{0}</li>\r\n";

		public const string SERVERSTYLE="servermsg";
		public const string USERSTYLE="usermsg";
		public const string ACTIONSTYLE="actionmsg";

		public const string TIMEOUTFORMART="用户{0}登录超时";
		public const string TEXTLIMITFORMART="{0},你输入的信息过长,只允许{1}字符之内";
		public const string NICKINUSE="{0}一个用户故障始终存在";
		public const string JOINEDFORMART="用户 {0}加入了聊天";
		public const string NICKFORMART="{0}改名为{1}";
		public const string KILLFORMART="<strong>用户{0}即将被清除!</strong>";
		public const string CLEARFORMART="<strong>用户{0}即将清除所有聊天记录!</strong>";
		public const string UNKNOWNCMD="<strong>用户 {0} : 未知操作</strong>";
		public const string MEFORMART="{0} {1}";
		public const string TEXTFORMART="{0}:{1}";

		public const long TIMEDELAY=300000;
		public const int BUFFERCOUNT=20;
		public const int TEXTLIMIT=100;

		private Timer timer;
		private Hashtable usersHash;
		private StringCollection  chat;
		private StringCollection ping;


		private object syncObj=new object();

		/// <summary>
		/// 默认构造函数
		/// </summary>
		public ChatEngine()
		{
			this.usersHash=new Hashtable();
			this.chat=new StringCollection();
			this.ping=new StringCollection();

			TimerCallback onTimerCallBack=new TimerCallback(TimerTick);
			//用 64 位有符号整数来度量时间间隔，以初始化 Timer 类的新实例。
			this.timer=new Timer(onTimerCallBack,null,ChatEngine.TIMEDELAY,ChatEngine.TIMEDELAY);
		}


		private void TimerTick(object state)
		{
			lock(this.syncObj)
			{
				string[] current=new string[this.usersHash.Keys.Count];
				this.usersHash.Keys.CopyTo(current,0);

				foreach(string guid in current)
				{
					if(!this.ping.Contains(guid))
					{
						this.chat.Add(this.MakeServerMsg(string.Format(ChatEngine.TIMEOUTFORMART,this.usersHash[guid].ToString())));

						this.usersHash.Remove(guid);
					}
				}

				this.ping.Clear();
			}
		}

		/// <summary>
		/// 用户列表   
		/// </summary>
		public string[] Users
		{
			get
			{
				string[] nicks=new string[this.usersHash.Values.Count];
				this.usersHash.Values.CopyTo(nicks,0);
				return nicks;
			}
		}


		/// <summary>
		/// HTML脚本格式的用户列表
		/// </summary>
		public string UserList
		{
			get
			{
				StringBuilder build=new StringBuilder();

				string[] nicks=new string[this.usersHash.Count];
				this.usersHash.Values.CopyTo(nicks,0);

				foreach(string user in nicks)
				{
					build.Append(string.Format(ChatEngine.USERLISTFORMART,user));
				}

				return build.ToString();
			}
		}


		/// <summary>
		/// 得到当前聊天记录中的缓存文本
		/// </summary>
		public string BufferText
		{
			get
			{
				StringBuilder build=new StringBuilder();

				foreach(string line in this.chat)
				{
					build.Append(line);
				}

				return build.ToString();
			}
		}

		/// <summary>
		/// 检查用户是否存在GUID
		/// </summary>
		public bool ExistsGuID(string guid)
		{
			return this.usersHash.ContainsKey(guid);
		}

		/// <summary>
		/// 检查用户是否在列表中
		/// </summary>
		public bool UserExists(string user)
		{
			return this.usersHash.ContainsKey(user);
		}

		public void AddUser(string id,string user)
		{
			lock(this.syncObj)
			{
				if(!this.UserExists(user))
				{
					this.usersHash.Add(id,user);
					this.ping.Add(id);

					this.chat.Add(this.MakeServerMsg(string.Format(ChatEngine.JOINEDFORMART,user)));
				}
			}
		}	
		
		/// <summary>
		/// 链接服务器 保持用户激活
		/// </summary>
		public void Ping(string guid)
		{
			lock(this.syncObj)
			{
				this.ping.Add(guid);
			}
		}


		/// <summary>
		/// 添加文本至缓存区
		/// </summary>
		public void AddText(string guid,string text)
		{
			text=text.Trim();
			if(text.Length==0)
				return;

			if(text.Length>ChatEngine.TEXTLIMIT)
			{
				this.chat.Add(this.MakeServerMsg(string.Format(ChatEngine.TEXTLIMITFORMART,
					this.usersHash[guid].ToString(),text.Length,ChatEngine.TEXTLIMIT)));
			}

			while(this.chat.Count>ChatEngine.BUFFERCOUNT)
			{
				this.chat.RemoveAt(0);
			}

			if(!this.ping.Contains(guid))
			{
				this.ping.Add(guid);
			}

			this.chat.Add(this.ChatParseText(this.usersHash[guid].ToString(),text));
		}


		/// <summary>
		/// 格式化用户聊天记录相当于控件命令执行
		/// </summary>
		private string ChatParseText(string user,string text)
		{
			if(text.StartsWith( "/me "))
			{
				return this.MakeActionMsg(string.Format(ChatEngine.MEFORMART,user,text.Replace("/me",string.Empty)));
			}

			if(text.StartsWith("/admin "))
			{
				string command=text.Replace("/admin",string.Empty).Trim();
				string result=string.Empty;

				switch(command)
				{
					case "clear":
						this.chat.Clear();
						result=this.MakeServerMsg(string.Format(ChatEngine.CLEARFORMART,user));
						break;
					default:
						result=this.MakeServerMsg(string.Format(ChatEngine.UNKNOWNCMD,user));
						break;
				}
				return result;
			}

			if(text.StartsWith("/nick "))
			{
				string newnick=text.Replace("/nick",string.Empty).Trim();

				if(this.UserExists(newnick))
				{
					return this.MakeServerMsg(string.Format(ChatEngine.NICKFORMART,user));
				}

				string[] keys=new string[this.usersHash.Keys.Count];
				this.usersHash.Keys.CopyTo(keys,0);

				foreach(string key in keys)
				{
					if(this.usersHash[key].ToString()==user)
					{
						this.usersHash[key]=newnick;
						return this.MakeServerMsg(string.Format(ChatEngine.NICKFORMART,user,newnick));
					}
				}

			}

			return this.MakeUserMsg(string.Format(ChatEngine.TEXTFORMART,user,text));
		}


		/// <summary>
		/// 移除用户
		/// </summary>
		public void RemoveUser(string user ,string pwd)
		{	
			if(pwd!="在这里添加密码")
				return;

			if(this.UserExists(user))
			{
				string[] keys=new string[this.usersHash.Keys.Count];
			
				foreach(DictionaryEntry entry in this.usersHash)
				{
					if(entry.Value.ToString()==user)
					{
						this.chat.Add(this.MakeServerMsg(string.Format(ChatEngine.KILLFORMART,user)));
						this.usersHash.Remove(entry.Key);
						return;
					}
				}
			}

			if(this.ping.Contains(user))
				this.ping.Remove(user);
		}

		/// <summary>
		/// 使用HTML有序列表包装消息并使用服务器上预定义的CSS Class
		/// </summary>
		private string MakeServerMsg(string text)
		{
			return string.Format(ChatEngine.MSG,ChatEngine.SERVERSTYLE,text);
		}

		private string MakeUserMsg(string text)
		{
			return string.Format(ChatEngine.MSG,ChatEngine.USERSTYLE,text);
		}

		private string MakeActionMsg(string text)
		{
			return string.Format(ChatEngine.MSG,ChatEngine.ACTIONSTYLE,text);
		}

	}
}
