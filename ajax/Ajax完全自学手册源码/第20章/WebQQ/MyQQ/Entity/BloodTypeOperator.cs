using System;
using System.Collections.Generic;
using System.Text;
using myqq.DataOperate;
using System.Data;
using System.Data.SqlClient;

namespace myqq.Entity
{
    /// <summary>
    /// 血型信息数据操作类
    /// </summary>
    public class BloodTypeOperator
    {
        //血型信息所对应的数据表名称
         private const string TABLENAME = "BloodType";
        public BloodTypeOperator()
        { 
        
        }
        /// <summary>
        /// 查询所有血型信息
        /// </summary>
        /// <returns>封装了所有血型信息的数据表</returns>
        public DataTable GetAllBloodType()
        {
            //定义数据库操作通用类对象
            DbOperate dbo = new DbOperate();
            dbo.TableName = BloodTypeOperator.TABLENAME;

            //构建数据操作对象，并初始化其SQL语句
            SqlCommand com = new SqlCommand();
            com.CommandText = "select * from BloodType";

            //返回查询结果集中的对应数据表
            return dbo.Select(com).Tables[BloodTypeOperator.TABLENAME];
        }
    }
}
