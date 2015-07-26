using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// User 的摘要说明
/// </summary>
public class User
{
    private string _name;
    private DateTime _lastLogin;
    private string _pwd;

    /// <summary>
    /// 用户名 只读
    /// </summary>
    public string Name
    {
        get { return _name; }
    }

    /// <summary>
    /// 用户最后一次登陆的日期  读写属性 
    /// </summary>
    public DateTime LastLogin
    {
        get { return _lastLogin; }
        set { _lastLogin = value; }
    }

    /// <summary>
    /// 密码 只读属性
    /// </summary>
    public string Pwd
    {
        get { return _pwd; }
    }
  
    

    /// <summary>
    /// 用户构造函数 设定当前时间为用户登陆时间
    /// </summary>
    /// <param name="name">用户名</param>
    /// <param name="pwd">密码</param>
	public User(string name,string pwd)
	{
        this._name = name;
        this._pwd = pwd;
        this._lastLogin = DateTime.Now;
	}



    /// <summary>
    /// 更新用户最后登陆日期
    /// </summary>
    public void UpdateLastLogin()
    {
        this._lastLogin = DateTime.Now;
    }

    /// <summary>
    /// 判断用户是否过期
    /// </summary>
    /// <param name="span">过期时长</param>
    /// <returns>是否超时</returns>
    public bool IsExpires(TimeSpan span)
    {
        return DateTime.Now - this._lastLogin >= span;
    }
}
