using System;
using System.Data;
using System.Data.SqlClient;


namespace myqq.DataOperate
{
	/// <summary>
	/// 工厂类只负责建立连接
	/// </summary>
	public class ConnectionFactory
	{
		/// <summary>
		/// 建立连接
		/// </summary>
		/// <returns>返回一个带有连接字符串的连接</returns>
		public static SqlConnection CreateConnection()
		{
            System.Configuration.ConnectionStringSettings settings;
            settings = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"];

			return new SqlConnection(settings.ConnectionString);
		}
	}
}
