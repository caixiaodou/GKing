using System;

namespace ChatSystem.DataOperator
{
	/// <summary>
	/// IChatEngine ��ժҪ˵����
	/// </summary>
	public interface IChatEngine
	{
		/// <summary>
		/// HTML������û��б�
		/// </summary>
		string UserList
		{
			get;
		}

		/// <summary>
		/// ��ǰ��֪�û�
		/// </summary>
		string[] Users
		{
			get;
		}

		/// <summary>
		/// �õ���ǰ������ı�
		/// </summary>
		string BufferText
		{
			get;
		}

		/// <summary>
		/// �ж��û��Ƿ����GUID
		/// </summary>
		bool ExistsGuID(string guid);

		/// <summary>
		/// �ж�һ���û��Ƿ��Ѿ�����
		/// </summary>
		bool UserExists(string user);

		/// <summary>
		/// ����û���������
		/// </summary>
		void AddUser(string user,string guid);

		/// <summary>
		///  ���������������û��Ƿ�һֱ����
		/// </summary>
		void Ping(string user);

		/// <summary>
		/// ����ı������컺��
		/// </summary>
		void AddText(string guid,string text);

		/// <summary>
		/// �Ƴ��û�
		/// </summary>
		void RemoveUser(string user,string pwd);
	}
}
