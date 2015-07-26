using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;

namespace myqq.Entity
{
    /// <summary>
    /// 消息类型信息数据操作表
    /// </summary>
    public class MessageTypeOperator
    {
        //消息类型信息对应的数据表名称
         private const string TABLENAME = "MessageType";
        public MessageTypeOperator()
        { 
        
        }

        /// <summary>
        /// 查找所有消息类型信息
        /// </summary>
        /// <returns>封装了所有消息类型信息的数据表</returns>
        public DataTable GetAllStar()
        {
            //定义数据库操作通用类对象
            DbOperate dbo = new DbOperate();
            dbo.TableName = MessageTypeOperator.TABLENAME;

            //定义数据操作对象，并初始化其要执行的SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from MessageType";

            //执行SQL查询，返回封装了所有消息类型信息的数据表
            return dbo.Select(com).Tables[MessageTypeOperator.TABLENAME];
        }
    }
}
