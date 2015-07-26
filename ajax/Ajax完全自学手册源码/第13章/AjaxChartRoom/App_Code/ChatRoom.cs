using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Threading;

/// <summary>
///聊天引擎类 该类实现了所有聊天的消息接受、发送、组装等功能
/// 该类是单例模式的典型实现 没有外部公有构造函数 只提供单一静态属性
/// </summary>
public class ChatEngin
{
    #region--------前台HTML格式字符串    常量----------
    public const string BLODFORMART = "<b>{0}</b>";
    public const string ENGINMSGFORMART = "<b><font style=\"color:red;\">{0}</font></b>";
    public const string MSGFORMART = "<li class=\"msg\">{0}</li>";
    public const string USERFORMART = "<li class=\"user\">{0}</li>";
    #endregion

    #region-------------本类私有变量--------------
    /// <summary>
    /// 消息列表最大限度  100 消息数
    /// </summary>
    public const int MSGLIMIT = 100;

    /// <summary>
    /// 用户列表限度  50用户数
    /// </summary>
    public const int USERLIMIT = 50;

    /// <summary>
    /// 单例模式下的私有对象 只能被静态属性访问 该类只能有一个对象存在
    /// </summary>
    private static ChatEngin engin= new ChatEngin();

    /// <summary>
    /// 刷新用户列表的时间刻度（单位 毫秒） 即5分钟
    /// </summary>
    public const int UPDATEUSERLIST = 30000;

    /// <summary>
    /// 用户登陆保持状态的有效时间长度  10分钟
    /// </summary>
    public readonly TimeSpan USERFULLIFE = new TimeSpan(0, 10, 10);

    /// <summary>
    /// 私有泛型键值对   用户列表
    /// 键  字符串类型  值  用户类型
    /// </summary>
    private Dictionary<string, User> userList;

    /// <summary>
    /// 私有泛型双向链表  消息列表
    /// 泛型类型  消息类型
    /// </summary>
    private LinkedList<Message> messageList;

    /// <summary>
    /// 用于线程锁定的对象
    /// </summary>
    private object lockObj;


    private System.Threading.Timer time;
    #endregion

    public bool HasChating(string username)
    {
        return this.userList.ContainsKey(username);
    }

    /// <summary>
    /// 提供外部访问的聊天引擎实例 静态属性 
    /// </summary>
    public static ChatEngin Engin
    {
        get
        {
            lock (engin.lockObj)
            {
                return ChatEngin.engin;
            }
        }
    }

    /// <summary>
    /// 构造函数  私有  
    /// 不能被任何外部类访问
    /// </summary>
    private ChatEngin()
	{
        this.lockObj = new object();
        this.messageList = new LinkedList<Message>();
        this.userList = new Dictionary<string, User>();
        TimerCallback timeCallBack = new TimerCallback(this.ClearExpiresUser);
        this.time = new System.Threading.Timer(timeCallBack);
	}

    /// <summary>
    /// 将超时用户从用户列表移除
    /// </summary>
    /// <param name="state">无意义参数 从未调用 仅仅是为了符合TimeCallback委托签名</param>
    private void ClearExpiresUser(object state)
    {
        //锁定当前对象的私有变量 单线程访问 防止并发
        lock (this.lockObj)
        {
            foreach (User user in this.userList.Values)
            {
                if (user.IsExpires(this.USERFULLIFE))
                {
                    this.userList.Remove(user.Name);
                    continue;
                }
            }
        }
    }

    /// <summary>
    /// 将用户添加至用户列表
    /// </summary>
    /// <param name="user">被添加至用户列表的用户</param>
    public void AddUser(User user)
    {
        this.userList.Add(user.Name, user);
    }

    /// <summary>
    /// 发送信息 
    /// 该方法为一扩展重载   系统扩展使用
    /// </summary>
    /// <param name="message">消息信息</param>
    public void SendMessage(string message)
    {
        lock (this.lockObj)
        {
            if (this.messageList.Count >= ChatEngin.MSGLIMIT)
            {
                this.messageList.RemoveLast();
            }

            this.messageList.AddFirst(new Message(message));
        }
    }

    /// <summary>
    /// 该方法提供消息的发送
    /// 当消息列表已满 就清除保持时间最长的消息
    /// </summary>
    /// <param name="msg">消息对象</param>
    public void SendMessage(Message msg)
    {
        lock (this.lockObj)
        {
            if (this.messageList.Count >= ChatEngin.MSGLIMIT)
            {
                this.messageList.RemoveFirst();
            }

            this.messageList.AddLast(msg);
        }
    }

    /// <summary>
    /// 根据用户名得到用户
    /// </summary>
    /// <param name="name">用户名</param>
    /// <returns>当用户名存在时，返回用户。否则返回空</returns>
    public User GetUser(string name)
    {
        if (this.userList.ContainsKey(name))
        {
            return this.userList[name];
        }

        return null;
    }

    /// <summary>
    /// 根据特定的格式字符串 组装字符串
    /// 扩展方法 系统扩展使用
    /// </summary>
    /// <returns>组装好的字符串</returns>
    private string MakeMsg(string format,string  part)
    {
        return string.Format(format,part);
    }

    public IEnumerable<Message> GetAllMsg()
    {
        return this.messageList;
    }

    public IEnumerable<User> GetAllUser()
    {
        return this.userList.Values;
    }

}
