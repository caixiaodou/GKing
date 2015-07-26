using System;
using System.Data;
using System.Data.SqlClient;


namespace myqq.DataOperate
{
	/// <summary>
	/// ������ֻ����������
	/// </summary>
	public class ConnectionFactory
	{
		/// <summary>
		/// ��������
		/// </summary>
		/// <returns>����һ�����������ַ���������</returns>
		public static SqlConnection CreateConnection()
		{
            System.Configuration.ConnectionStringSettings settings;
            settings = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"];

			return new SqlConnection(settings.ConnectionString);
		}
	}
}
