using System;
using System.Text;
using System.Threading;
using System.Collections;
using System.Collections.Specialized;

namespace ChatSystem.DataOperator
{
	/// <summary>
	///��������
	/// </summary>
	public class ChatEngine : IChatEngine
	{
		/// <summary>
		/// MSG�������б��ǰ̨Html�﷨Ԫ��
		/// </summary>
		public  const string MSG="<li class=\"{0}\">{1}</li>\r\n";

		public const string USERLISTFORMART="<li>{0}</li>\r\n";

		public const string SERVERSTYLE="servermsg";
		public const string USERSTYLE="usermsg";
		public const string ACTIONSTYLE="actionmsg";

		public const string TIMEOUTFORMART="�û�{0}��¼��ʱ";
		public const string TEXTLIMITFORMART="{0},���������Ϣ����,ֻ����{1}�ַ�֮��";
		public const string NICKINUSE="{0}һ���û�����ʼ�մ���";
		public const string JOINEDFORMART="�û� {0}����������";
		public const string NICKFORMART="{0}����Ϊ{1}";
		public const string KILLFORMART="<strong>�û�{0}���������!</strong>";
		public const string CLEARFORMART="<strong>�û�{0}����������������¼!</strong>";
		public const string UNKNOWNCMD="<strong>�û� {0} : δ֪����</strong>";
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
		/// Ĭ�Ϲ��캯��
		/// </summary>
		public ChatEngine()
		{
			this.usersHash=new Hashtable();
			this.chat=new StringCollection();
			this.ping=new StringCollection();

			TimerCallback onTimerCallBack=new TimerCallback(TimerTick);
			//�� 64 λ�з�������������ʱ�������Գ�ʼ�� Timer �����ʵ����
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
		/// �û��б�   
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
		/// HTML�ű���ʽ���û��б�
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
		/// �õ���ǰ�����¼�еĻ����ı�
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
		/// ����û��Ƿ����GUID
		/// </summary>
		public bool ExistsGuID(string guid)
		{
			return this.usersHash.ContainsKey(guid);
		}

		/// <summary>
		/// ����û��Ƿ����б���
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
		/// ���ӷ����� �����û�����
		/// </summary>
		public void Ping(string guid)
		{
			lock(this.syncObj)
			{
				this.ping.Add(guid);
			}
		}


		/// <summary>
		/// ����ı���������
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
		/// ��ʽ���û������¼�൱�ڿؼ�����ִ��
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
		/// �Ƴ��û�
		/// </summary>
		public void RemoveUser(string user ,string pwd)
		{	
			if(pwd!="�������������")
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
		/// ʹ��HTML�����б��װ��Ϣ��ʹ�÷�������Ԥ�����CSS Class
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
