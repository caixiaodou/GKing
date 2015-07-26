using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;


namespace myqq.DataOperate
{
	/// <summary>
	/// 数据库操作通用类
	/// </summary>
	public class DbOperate
	{
		private SqlConnection con;
		private SqlCommand com;
		private SqlDataAdapter adpt;
		private DataSet ds;
		private string _tableName;
		private SqlTransaction tran;


		public string TableName
		{
			get{return this._tableName;}
			set{this._tableName=value;}
		}

        /// <summary>
        /// 构造方法，对成员变量进行实例化
        /// </summary>
		public DbOperate()
		{
			this.con=ConnectionFactory.CreateConnection();
			this.com=con.CreateCommand();
			this.adpt=new SqlDataAdapter();
			this.ds=new DataSet();
			this._tableName="";
		}
        /// <summary>
        /// 开始一个事务
        /// </summary>
		private void BeginTran()
		{
			if(this.com!=null && (this.com.CommandText!="" || this.com.CommandText!=null))
			{
				this.tran=this.con.BeginTransaction();
			}
		}

        /// <summary>
        /// 执行SQL查询
        /// </summary>
        /// <param name="dcom">Sql命令执行对象</param>
        /// <returns>数据集</returns>
		public DataSet Select(SqlCommand dcom)
		{
			try
			{
				this.con.Open();
				
				this.com=dcom;
				this.com.Connection=this.con;
				this.adpt.SelectCommand=this.com;
				
				this.BeginTran();
				this.com.Transaction=this.tran;
				this.adpt.Fill(this.ds,this.TableName);
				this.tran.Commit();
			}
			catch(Exception ex)
			{
				this.tran.Rollback();
				throw ex;
			}
			finally
			{
				this.con.Close();
			}

			return this.ds;
		}

        /// <summary>
        /// 执行数据库的更新操作
        /// </summary>
        /// <param name="dcom">数据操作对象</param>
        /// <returns>更新所影响的行数</returns>
        private int Modify(SqlCommand dcom)
        {
            int result = 0;
            try
            {
                this.con.Open();

                this.com = dcom;
                //this.Select(dcom);
                this.com.Connection = this.con;

                this.BeginTran();
                this.com.Transaction = this.tran;
                result = this.com.ExecuteNonQuery();
                this.tran.Commit();
            }
            catch (Exception ex)
            {
                this.tran.Rollback();
                throw ex;
            }
            finally
            {
                this.con.Close();
            }

            return result;
        }
        /// <summary>
        /// 执行数据库的更新操作
        /// </summary>
        /// <param name="dcom">数据操作对象</param>
        /// <returns>更新所影响的行数</returns>
		public int UpDate(SqlCommand dcom)
		{
            return  this.Modify(dcom);
		}
        /// <summary>
        /// 执行数据库删除操作
        /// </summary>
        /// <param name="dcom">数据操作对象</param>
        /// <returns>被删除的记录行数</returns>
		public int Delete(SqlCommand dcom)
		{
            return this.Modify(dcom);
		}
        /// <summary>
        /// 执行数据库插入操作
        /// </summary>
        /// <param name="dcom">数据操作对象</param>
        /// <returns>数据库被影响的行数</returns>
		public int Insert(SqlCommand dcom)
		{
            return this.Modify(dcom);
		}

     
	}
}
