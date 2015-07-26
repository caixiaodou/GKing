using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void ObjectDataSource1_Updating(object sender, ObjectDataSourceStatusEventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
    }
    protected void ObjectDataSource1_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
    }
}