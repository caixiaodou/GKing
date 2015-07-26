using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public  class Login : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int requestType = Convert.ToInt32(context.Request["type"]);


        switch(requestType)
        {
            case 0:
                string ctrlName = context.Request["ContrlName"].ToString();
                context.Response.Write(UserTools.RangerUserControl(ctrlName));
                break;
            case 1:
                break;

        }
    }



    public bool IsReusable
    {
        get { return false; }
    }
}
