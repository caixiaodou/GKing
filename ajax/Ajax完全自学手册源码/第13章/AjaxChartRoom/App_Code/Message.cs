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
/// Message 的摘要说明
/// </summary>
public class Message
{

    private string user;
    private string _face;
    private string _otherTalker;
    private string _message;
    private DateTime _sendTime;
    private string _color;
    private bool _isBlod;

    #region --------属性-----------
    /// <summary>
    /// 发送消息的用户
    /// </summary>
    public string User
    {
        get { return user; }
        set { user = value; }
    }

    /// <summary>
    /// 接受消息的用户
    /// </summary>
    public string OtherTalker
    {
        get { return _otherTalker; }
        set { _otherTalker = value; }
    }

    /// <summary>
    /// 发送的消息
    /// </summary>
    public string Msg
    {
        get { return _message; }
        set { _message = value; }
    }

    /// <summary>
    /// 发送时间
    /// </summary>
    public DateTime SendTime
    {
        get { return _sendTime; }
        set { _sendTime = value; }
    }

    /// <summary>
    /// 消息字体的颜色
    /// </summary>
    public string Color
    {
        get { return _color; }
        set { _color = value; }
    }

    /// <summary>
    /// 是否使用粗体显示消息
    /// </summary>
    public bool IsBlod
    {
        get { return _isBlod; }
        set { _isBlod = value; }
    }

    /// <summary>
    /// 表情编号
    /// </summary>
    public string Face
    {
        get { return _face; }
        set { _face = value; }
    }

    #endregion
    public Message()
	{
        this.user ="系统";
        this._otherTalker = "所有人";
        this._sendTime = DateTime.Now;
	}

    /// <summary>
    /// 实例化消息的完整方法
    /// </summary>
    /// <param name="_user">发出消息的用户</param>
    /// <param name="face">表情编号</param>
    /// <param name="otherTalker">接受消息的用户</param>
    /// <param name="msg">消息</param>
    /// <param name="color">字体颜色</param>
    /// <param name="blod">是否加粗显示消息</param>
    public Message(string _user, string face, string otherTalker, string msg, string color, bool blod,DateTime time)
    {
        this.user = _user;
        this._face = face;
        this._otherTalker = otherTalker;
        this._message = msg;
        this._color = color;
        this._isBlod = blod;
        this._sendTime = time;
    }

    /// <summary>
    /// 重载构造函数  系统消息的专有构造函数
    /// </summary>
    /// <param name="msg">系统消息</param>
    public Message(string msg)
    {
        this.user = "系统";
        this._face = "";
        this._otherTalker = "所有人";
        this._message = msg;
        this._color = "red";
        this._isBlod = true;
    }
}
