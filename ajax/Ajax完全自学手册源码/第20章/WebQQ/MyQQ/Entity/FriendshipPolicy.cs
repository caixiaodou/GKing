using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;


namespace myqq.Entity
{
    /// <summary>
    /// 好友策略信息数据操作类
    /// </summary>
    public class FriendshipPolicyOperator
    {
        //好友策略信息对应的数据表名称
        private const string TABLENAME = "FriendshipPolicy";

        public FriendshipPolicyOperator()
        {
          
        }
        /// <summary>
        /// 查找所有的好友策略信息
        /// </summary>
        /// <returns>封装了所有好友策略信息的数据表</returns>
        public DataTable GetAllFriendshipPolicy()
        {

            //定义数据库操作通用类的对象
            DbOperate dbo = new DbOperate();
            dbo.TableName = FriendshipPolicyOperator.TABLENAME;
            //定义数据操作对象，初始其要执行的SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from FriendshipPolicy";
            
            //执行SQL查询，返回封装了所有好友策略信息的数据表
            return dbo.Select(com).Tables[FriendshipPolicyOperator.TABLENAME];
        }
    }


}
