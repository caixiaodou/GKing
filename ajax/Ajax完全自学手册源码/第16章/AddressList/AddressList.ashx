<%@ WebHandler Language="C#" Class="AddressList" %>
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
/// AddressList 的摘要说明
/// </summary>
public class AddressList : IHttpHandler
{
	public AddressList()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    #region IHttpHandler 成员

    public bool IsReusable
    {
        get { return false;}
    }

    private static string INSERTUNAME = "";
    
    public void ProcessRequest(HttpContext context)
    {
       int requestType = Convert.ToInt32(context.Request["type"]);
        
       switch (requestType)
       {
           case 0:

               if (context.Request.QueryString.Count > 1)
               {
                   string ctrlName = context.Request["ContrlName"].ToString();

                   context.Response.Write(UserTools.RangerUserControl(ctrlName));
               }
               break;
           case 1:
               string uname = context.Request["userName"].ToString();
               HttpCookie cookie = new HttpCookie("OtherName", uname);
               cookie.Expires = DateTime.Now.AddYears(1);
               context.Request.Cookies.Add(cookie); 
               context.Response.Cookies.Add(cookie);
               FormsAuthentication.SetAuthCookie(uname, true);
               context.Response.Write(1);//登陆成功 
               break;
           case 2:
               AddressListTools tool = new AddressListTools();
               tool.InsertAddressList(context.Request["name"].ToString(), context.Request["typename"].ToString(),
                                                    context.Request["sex"].ToString(), context.Request["phone"].ToString(),
                                                    context.Request["handphone"].ToString(), context.Request["email"].ToString(),
                                                    context.Request["postaddress"].ToString(), context.Request["familyaddress"].ToString(),
                                                    context.Request["qq"].ToString(), context.Request["msn"].ToString(), INSERTUNAME);
               context.Response.Write("插入成功"); 
               break;
           case 3:
               string cookieName = context.Request["cookieName"].ToString();
               if (context.Request.Cookies.Count > 0)
               {
                   HttpCookie cookie1 = context.Request.Cookies[cookieName];
                   FormsAuthentication.SetAuthCookie(context.Server.HtmlDecode(cookie1.Value), true);
                   INSERTUNAME=cookie1.Value; 
                   context.Response.Write(cookie1.Value);
               }
               else
               {
                   context.Response.Write(0);
               } 
               break;   
           case 4:
               AddressListTools tool1 = new AddressListTools();
               context.Response.Write(this.BuildAddressList(tool1.GetAddressListByType(context.Request["typeName"].ToString(), INSERTUNAME))); 
               break; 
       }
    }

    #endregion

    private string BuildAddressList(DataSet ds)
    {
        string tableStr ="<table cellpadding=0 cellspacing=0 border=0  style='color:#0B86F9;font-size:12px'>"+
        "<tr>"+
        "<td><img src='Image/name.gif'/>&nbsp;&nbsp;姓名</td>"+
       "<td><img src='Image/sex.gif'/>&nbsp;&nbsp;性别</td> "+
       "<td><img src='Image/phone.gif'/>&nbsp;&nbsp;电话</td>"+
       "<td><img src='Image/handPhone.gif'/>&nbsp;&nbsp;手机</td>"+
       "<td><img src='Image/email.gif'/>&nbsp;&nbsp;电子邮件</td>"+
      " <td><img src='Image/postAddress.gif'/>&nbsp;&nbsp;通信地址</td>"+
      " <td><img src='Image/familyAddress.gif'/>&nbsp;&nbsp;家庭地址</td>"+
       "<td style='height: 24px'><img src='Image/QQ.gif'/>&nbsp;&nbsp;QQ</td>"+
      " <td><img src='Image/msn.gif'/>&nbsp;&nbsp;MSN</td>"
        +"</tr>";
        foreach(DataRow row in ds.Tables[0].Rows)
        {
             tableStr+="<tr>";
            foreach(DataColumn col in ds.Tables[0].Columns)
            {
                string typeName = string.Empty; 
                if(col.ColumnName!="LinkManType" && col.ColumnName!="LinkManID" && col.ColumnName!="LinkManUName")
                {
                    tableStr += string.Format("<td>{0}</td>",row[col.ToString()]);
                }
            }
            tableStr += "</tr>";  
        }
        tableStr += "</table>";
        return tableStr; 
    }
}
