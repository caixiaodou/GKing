using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;//必须添加该项引用 否则客户端脚本无法访问该Web服务


/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]//将该方法注册为Web服务方法
    public string GetCustomerMsg(string str) {
        string msg = "服务器获得你的消息，时间:" + DateTime.Now.ToShortTimeString() + "<br>你的消息为:" + str + "<br>你的地址:" + HttpContext.Current.Request.UserHostAddress;
        return msg;
    }
    
}

