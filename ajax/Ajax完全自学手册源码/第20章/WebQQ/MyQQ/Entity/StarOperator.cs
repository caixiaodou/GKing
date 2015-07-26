using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;

namespace myqq.Entity
{
    /// <summary>
    /// 星座信息数据操作类
    /// </summary>
    public class StarOperator
    {
        //星座信息所对应的数据表名
        private const string TABLENAME = "Star";
        public StarOperator()
        { 
        
        }
        /// <summary>
        /// 查找所有星座信息
        /// </summary>
        /// <returns>封装了所有星座信息的数据表</returns>
        public DataTable GetAllStar()
        {
            //定义数据库操作通用类的对象
            DbOperate dbo = new DbOperate();
            dbo.TableName = StarOperator.TABLENAME;
            
            //构建数据操作对象，并初始化其SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from Star";
            
            //返回其查询结果集中对应的数据表
            return dbo.Select(com).Tables[StarOperator.TABLENAME];
        }
    }
}
