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
/// 通讯录的数据操作类
/// </summary>
public class AddressListTools
{
	public AddressListTools()
	{
		
	}

    /// <summary>
    /// 通过用户名和联系人类型获取联系人信息
    /// </summary>
    /// <param name="type">联系人类型</param>
    /// <param name="userName">用户名</param>
    /// <returns>联系人信息数据集</returns>
    public DataSet GetAddressListByType(string type,string userName)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ToString());
        
        SqlCommand com = con.CreateCommand();
        com.CommandText = string.Format("select * from AddressList where LinkManUname='{0}' and LinkManType={1}",userName,type);
       
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

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    /// <summary>
    /// 插入联系人信息
    /// </summary>
    public void InsertAddressList(string name,string typeName,string sex,string phone,string handPhone,
                                                        string email,string postAddress,string address,string qq,string msn,string uname)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ToString());

        SqlCommand com = con.CreateCommand();
        com.CommandText = string.Format("insert into AddressList values('{0}',{1},'{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')",
                                                                    name, typeName,sex,phone,handPhone,email,postAddress,address,qq,msn,uname);

        con.Open();
        SqlTransaction tran = con.BeginTransaction();
        com.Transaction = tran;
        try
        {
            com.ExecuteNonQuery();
            tran.Commit();
        }
        catch (Exception ex)
        {
            tran.Rollback();
        }
        finally
        {
            con.Close();
        }
    }
}
