using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// DataAccess 的摘要说明
/// </summary>
public class DataAccess
{
    private SqlConnection con;
    private SqlCommand com;

    /// <summary>
    /// 公有构造函数 提供获得连接字符串的连接对象和实例化的Command对象
    /// </summary>
	public DataAccess()
	{
        this.con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        this.com = this.con.CreateCommand();
	}

    /// <summary>
    /// 设定界面数据源 所使用的函数
    /// </summary>
    /// <param name="sql">传入的SQL代码</param>
    /// <returns>返回查询得到的DataSet</returns>
    private DataSet GetDataSet(string sql)
    {
        this.com = this.con.CreateCommand();
        this.com.CommandText = sql;

        SqlDataAdapter adpt = new SqlDataAdapter();
        adpt.SelectCommand = com;
        DataSet ds = new DataSet();

        con.Open();
        try
        {
            adpt.Fill(ds);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return ds;
    }

    /// <summary>
    /// 执行SQL语句的方法
    /// </summary>
    /// <param name="sql">SQL语句</param>
    /// <returns>影响行数</returns>
    private int ExcuteSql(string sql)
    {
        this.com = this.con.CreateCommand();
        this.com.CommandText = sql;

        int result = 0;
        con.Open();
        SqlTransaction tran = this.con.BeginTransaction();
        this.com.Transaction = tran;
        try
        {
            result = this.com.ExecuteNonQuery();
            tran.Commit();
        }
        catch (Exception ex)
        {
            tran.Rollback();
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return result;
    }

    /// <summary>
    /// 模糊查询方法
    /// </summary>
    /// <param name="like">电影名称的模糊字符</param>
    /// <returns>查询的DataSet</returns>
    public DataSet LikeSelect(string like)
    {
        string sql = "select * from Movie where MovieName like '%" + like + "%'";
        return new DataAccess().GetDataSet(sql);
    }

    /// <summary>
    /// 自动完成功能特有的查询方法
    /// </summary>
    /// <param name="name">用户输入的电影名称</param>
    /// <param name="count">需要得到的结果集条目数量</param>
    /// <returns>符合用户输入字符的模糊查询得到的结果集</returns>
    public DataSet AutoCompleteSelect(string name,int count)
    {
         /*
         组装SQL语句 实际上组装出的效果如此例所示：
         * select top 10 MovieName from movie where LEFT(LTRIM(MovieName),2)='我和'
         */
        string sql = string.Format("select top {0} MovieName from Movie where LEFT(LTRIM(MovieName),{1})='{2}'",
            count, name.Length, name);

        return this.GetDataSet(sql);
    }

    /// <summary>
    /// 更新数据方法
    /// </summary>
    /// <param name="MovieName">电影名称</param>
    /// <param name="MovieAcer">电影主演</param>
    /// <param name="MovieContent">电影简介</param>
    /// <param name="MovieID">需要更新的电影的主键</param>
    public void Update(string MovieName, string MovieAcer, string MovieContent, int   MovieID)
    {
        string sql = string.Format("update Movie set moviename='{0}',movieAcer='{1}',movieContent='{2}' where movieId={3}", MovieName, MovieAcer, MovieContent, MovieID.ToString());
        new DataAccess().ExcuteSql(sql);
    }

    /// <summary>
    /// 删除数据方法
    /// </summary>
    /// <param name="MovieID">需要删除的电影主键</param>
    public void Delete(int MovieID)
    {
        string sql = string.Format("delete Movie where MovieId={0}", MovieID.ToString());
        new DataAccess().ExcuteSql(sql);
    }

    /// <summary>
    /// 插入数据方法
    /// </summary>
    /// <param name="MovieName">电影名称</param>
    /// <param name="MovieAcer">电影主演</param>
    /// <param name="MovieContent">电影主演</param>
    public void Insert(string MovieName, string MovieAcer, string MovieContent)
    {
        string sql = string.Format("insert into Movie values('{0}','{1}','{2}')",MovieName,MovieAcer,MovieContent);
        new DataAccess().ExcuteSql(sql);
    }
}
