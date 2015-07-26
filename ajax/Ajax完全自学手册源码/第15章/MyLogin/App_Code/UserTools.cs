using System;
using System.Data;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// UserTools 的摘要说明
/// </summary>
public class UserTools
{
	public UserTools()
	{
		
	}

    /// <summary>
    /// 将用户控件转化为HTML代码 并将转化后的HTML代码转换为字符串以供输出
    /// </summary>
    /// <param name="controlName">用户控件名称</param>
    /// <returns>用户控件转换后的HTML代码字符串</returns>
    public static string RangerUserControl(string controlName)
    {
        StringBuilder build = new StringBuilder();
        HtmlTextWriter htmlWriter = new HtmlTextWriter(new StringWriter(build));

        UserControl uc = new UserControl();
        Control ctrl = uc.LoadControl(controlName+".ascx");
        htmlWriter.Flush();
        string result;
        try
        {
            ctrl.RenderControl(htmlWriter);
        }
        catch(Exception ex)
        {
        
        }
        finally
        {
           htmlWriter.Flush();
           result= build.ToString();
        }
        return result;
    }

    /// <summary>
    /// 验证用户登陆
    /// </summary>
    /// <param name="uname">登陆用户名</param>
    /// <param name="pwd">登陆密码</param>
    /// <returns>是否成功登陆</returns>
    public static bool CheckLogin(string uname,string pwd)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ToString());
        SqlCommand com = con.CreateCommand();

        com.CommandText = "select count(*) from UserInfo where UserName=@uname and PassWord=@pwd";
        SqlParameter unamePar = new SqlParameter("@uname",SqlDbType.VarChar,20);
        unamePar.Value = uname;

        SqlParameter pwdPar = new SqlParameter("@pwd",SqlDbType.VarChar,20);
        pwdPar.Value = pwd;

        com.Parameters.Add(unamePar);
        com.Parameters.Add(pwdPar);

        con.Open();
        bool result;
        try
        { 
            result=Convert.ToInt32(com.ExecuteScalar())>0 ? true :false;
        }
        finally
        {
            con.Close();
        }

        return result;
    }

    public static bool InsertUser(string userName,string userPwd,string email)
    { 
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ToString());
        SqlCommand com = con.CreateCommand();

        com.CommandText = "insert into Userinfo values(@uname,@pwd,@email)";
        SqlParameter unamePar = new SqlParameter("@uname",SqlDbType.VarChar,20);
        unamePar.Value = userName;

        SqlParameter pwdPar = new SqlParameter("@pwd",SqlDbType.VarChar,16);
        pwdPar.Value = userPwd;

        SqlParameter emailPar = new SqlParameter("@email",SqlDbType.VarChar,25);
        emailPar.Value = email;

        com.Parameters.Add(unamePar);
        com.Parameters.Add(pwdPar);
        com.Parameters.Add(emailPar);

        bool result;
        con.Open();
        try
        {
            result = com.ExecuteNonQuery() == 1 ? true : false;
        }
        finally
        {
            con.Close();
        }

        return result;
    }


    public static bool CheckUserName(string uname)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ToString());
        SqlCommand com = con.CreateCommand();

        com.CommandText = "select count(*) from UserInfo where UserName=@uname";
        SqlParameter unamePar = new SqlParameter("@uname", SqlDbType.VarChar, 20);
        unamePar.Value = uname;

        com.Parameters.Add(unamePar);
    
        con.Open();
        bool result;
        try
        {
            result = Convert.ToInt32(com.ExecuteScalar()) > 0 ? true : false;
        }
        finally
        {
            con.Close();
        }

        return result;
    }
}
