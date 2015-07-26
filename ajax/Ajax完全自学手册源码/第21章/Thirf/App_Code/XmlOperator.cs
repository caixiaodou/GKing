using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

/// <summary>
/// XmlOperator 的摘要说明
/// </summary>
public class XmlOperator
{

    /// <summary>
    /// 提供数据封装的DataSet对象
    /// </summary>
    private DataSet ds;
    private XmlDataDocument doc;

    public DataSet Ds
    {
        get { return ds; }
        set { ds = value; }
    }

	public XmlOperator()
	{
        this.ds = new DataSet();
	}

    public DataSet ReadXml()
    {
        this.ds.ReadXml(HttpContext.Current.Server.MapPath(@"TVList.xml"));
        return this.ds;
    }

    /// <summary>
    /// 根据电视台名称加载频道列表
    /// </summary>
    /// <param name="tvName">电视台名称</param>
    /// <returns>频道列表DataSet</returns>
    public DataSet ReadXml(string tvName)
    {
        this.ReadXml();
        DataSet chanelDs = new DataSet("TvSet");
        DataTable chanelTable = new DataTable("Chanel");

        DataColumn col = new DataColumn("Chanel",typeof(string));
        chanelTable.Columns.Add(col);

        foreach(DataRow row in this.ds.Tables[0].Rows)
        {
            if(row[1].ToString()==tvName)
            {
                DataRow[] rows = row.GetChildRows(this.ds.Relations[0]);
                foreach(DataRow chanelRow in rows)
                {
                    DataRow tvChanelRow = chanelTable.NewRow();
                    tvChanelRow[0] = chanelRow[0];
                    chanelTable.Rows.Add(tvChanelRow);
                }
            }
        }

        chanelDs.Tables.Add(chanelTable);
        return chanelDs;
    }
}
