using System;

namespace ChatSystem.DataOperator
{
	/// <summary>
	/// IChatEngine 的摘要说明。
	/// </summary>
	public interface IChatEngine
	{
		/// <summary>
		/// HTML编码的用户列表
		/// </summary>
		string UserList
		{
			get;
		}

		/// <summary>
		/// 当前已知用户
		/// </summary>
		string[] Users
		{
			get;
		}

		/// <summary>
		/// 得到当前缓存得文本
		/// </summary>
		string BufferText
		{
			get;
		}

		/// <summary>
		/// 判断用户是否基于GUID
		/// </summary>
		bool ExistsGuID(string guid);

		/// <summary>
		/// 判断一个用户是否已经存在
		/// </summary>
		bool UserExists(string user);

		/// <summary>
		/// 添加用户至聊天组
		/// </summary>
		void AddUser(string user,string guid);

		/// <summary>
		///  调用聊天引擎检查用户是否一直存在
		/// </summary>
		void Ping(string user);

		/// <summary>
		/// 添加文本至聊天缓存
		/// </summary>
		void AddText(string guid,string text);

		/// <summary>
		/// 移除用户
		/// </summary>
		void RemoveUser(string user,string pwd);
	}
}
