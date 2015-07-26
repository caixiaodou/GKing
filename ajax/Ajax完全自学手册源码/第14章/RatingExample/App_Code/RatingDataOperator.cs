using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using System.IO;

/// <summary>
/// 评级活动的数据源类  提供对评级活动的数据支持及XML写入、读取操作
/// </summary>
public class RatingDataOperator
{
    #region --------------------------------变量及属性声明-----------------------------------

    /// <summary>
    /// 系统XML文件操作路径
    /// </summary>
    private string _xmlPath;

    /// <summary>
    /// 操作XML文档的DataSet对象 并提供数据源支持
    /// </summary>
    private DataSet ds;

    /// <summary>
    /// 默认构造 实例化私有变量
    /// </summary>
    public RatingDataOperator()
    {
        this._xmlPath = "";
        this.ds = new DataSet();
    }

    /// <summary>
    /// 只读属性 获取服务器端存储数据的XML文档的路径
    /// </summary>
    public string XmlPath
    {
        get
        {
            if (this._xmlPath != "")
            {
                return this._xmlPath;
            }
            else if (HttpContext.Current != null)
            {
                //获取服务器路径并组装数据存储XML文件的路径
                this._xmlPath = Path.Combine(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath), @"App_Data\RatingData.xml");
                return this._xmlPath;
            }
            else
            {
                throw new Exception("服务器错误");

            }

            return null;
        }

    }

    /// <summary>
    /// 返回从数据存储XML文档中读取数据后的DataSet的第一张DataTale
    /// 实际上 该属性提供了所有的XML文档中存储的数据
    /// </summary>
    public DataTable Table
    {
        get
        {
            if (this.ds.Tables.Count == 0)
            {
                this.ds = new DataSet();
                this.ds.ReadXml(this.XmlPath);
            }

            return this.ds.Tables[0];
        }
    }



    #endregion


    #region ------------------------------------------数据操作方法------------------------------------------------------------------

    /// <summary>
    /// 获取流行明星的评定星级
    /// </summary>
    public string Count(string popStarName,string stars)
    {
        this.Table.DefaultView.RowFilter = string.Format("PopStarName='{0}' and Stars='{1}'", popStarName, stars);
        return this.Table.DefaultView.Count.ToString();
    }

    /// <summary>
    /// 数据插入方法
    /// </summary>
    ///<param name="popStarName">流行明星姓名</param>
    ///<param name="stars">评级星数</param>
    public void Insert(string popStarName, string stars)
    {
        DataRow row = this.Table.NewRow();
        row["ID"] = this.Table.Rows.Count;
        row["PopStarName"] = popStarName;
        row["Stars"] = stars;
        row["Time"] = DateTime.Now.ToLocalTime().ToString();
        this.Table.Rows.Add(row);
        //this.Table.AcceptChanges();
        this.SaveDataToXml();
    }


    /// <summary>
    /// 修改数据后 写入XML文档 覆盖原有数据的私有方法
    /// </summary>
    private void SaveDataToXml()
    {
        this.ds.WriteXml(this.XmlPath, XmlWriteMode.IgnoreSchema);
    }

    #endregion
}
