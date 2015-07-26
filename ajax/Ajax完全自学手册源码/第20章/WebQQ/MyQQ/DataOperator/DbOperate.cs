using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;


namespace myqq.DataOperate
{
	/// <summary>
	/// ���ݿ����ͨ����
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
        /// ���췽�����Գ�Ա��������ʵ����
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
        /// ��ʼһ������
        /// </summary>
		private void BeginTran()
		{
			if(this.com!=null && (this.com.CommandText!="" || this.com.CommandText!=null))
			{
				this.tran=this.con.BeginTransaction();
			}
		}

        /// <summary>
        /// ִ��SQL��ѯ
        /// </summary>
        /// <param name="dcom">Sql����ִ�ж���</param>
        /// <returns>���ݼ�</returns>
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
        /// ִ�����ݿ�ĸ��²���
        /// </summary>
        /// <param name="dcom">���ݲ�������</param>
        /// <returns>������Ӱ�������</returns>
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
        /// ִ�����ݿ�ĸ��²���
        /// </summary>
        /// <param name="dcom">���ݲ�������</param>
        /// <returns>������Ӱ�������</returns>
		public int UpDate(SqlCommand dcom)
		{
            return  this.Modify(dcom);
		}
        /// <summary>
        /// ִ�����ݿ�ɾ������
        /// </summary>
        /// <param name="dcom">���ݲ�������</param>
        /// <returns>��ɾ���ļ�¼����</returns>
		public int Delete(SqlCommand dcom)
		{
            return this.Modify(dcom);
		}
        /// <summary>
        /// ִ�����ݿ�������
        /// </summary>
        /// <param name="dcom">���ݲ�������</param>
        /// <returns>���ݿⱻӰ�������</returns>
		public int Insert(SqlCommand dcom)
		{
            return this.Modify(dcom);
		}

     
	}
}
