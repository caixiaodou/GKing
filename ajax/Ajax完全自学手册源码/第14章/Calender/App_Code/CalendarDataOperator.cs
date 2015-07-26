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
/// 日程表的数据源类  提供对日程表的数据支持及XML写入、读取操作
/// 该类还提供了界面数据源控件的支持 提供经DataObjectMethod特性修饰的数据操作方法
/// 可以完美支持ObjectDataSource
/// </summary>
[System.ComponentModel.DataObject(true)]
public class CalendarDataOperator
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
    public CalendarDataOperator()
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
                this._xmlPath = Path.Combine(HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath), @"App_Data\Calendar.xml");
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
            if(this.ds.Tables.Count==0)
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
    /// 数据查询方法 使用System.ComponentModel.DataObjectMethod特性修饰
    /// 提供界面数据源数据操作支持  获取全部的日程安排
    /// </summary>
    /// <returns></returns>
    [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select)]
    public DataView Select()
    {
        this.Table.DefaultView.Sort = "Priority";
        return this.Table.DefaultView;
    }

    /// <summary>
    /// 数据插入方法 使用System.ComponentModel.DataObjectMethod特性修饰
    /// 提供界面数据源数据操作支持 
    /// </summary>
    /// <param name="title">日程标题</param>
    /// <param name="discription">日程描述</param>
    /// <param name="priority">优先级</param>
    [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Insert)]
    public void Insert(string Title,string Description ,int Priority)
    {
        DataRow row = this.Table.NewRow();
        row["ItemID"] = this.Table.Rows.Count;
        row["Title"] = Title;
        row["Description"] = Description;
        row["Priority"] = Priority;
        this.Table.Rows.Add(row);
        //this.Table.AcceptChanges();
        this.SaveDataToXml();
    }


    /// <summary>
    /// 数据更新方法 使用System.ComponentModel.DataObjectMethod特性修饰
    /// 提供界面数据源数据操作支持 
    /// </summary>
    /// <param name="title">日程标题</param>
    /// <param name="discription">日程描述</param>
    /// <param name="priority">优先级</param>
    [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Update)]
    public void Update(string title, string description, int priority,int itemID)
    {
        DataRow[] rows = this.Table.Select(string.Format("ItemID={0}",itemID));
        if(rows.Length>0)
        {
            DataRow row = rows[0];
            row.BeginEdit();//行事务开启
            row["Title"] = title;
            row["Description"] = description;
            row["Priority"] = priority;
            row.EndEdit();
            this.Table.AcceptChanges();//表事务接受修改  行状态更改为UnChanged
            this.SaveDataToXml();
        }
    }

    /// <summary>
    /// 数据插入方法 使用System.ComponentModel.DataObjectMethod特性修饰
    /// 提供界面数据源数据操作支持 
    /// </summary>
    ///<param name="itemID">日程表条目ID</param>
    [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Delete)]
    public void Delete(int itemID)
    {
         DataRow[] rows = this.Table.Select(string.Format("ItemID={0}",itemID));
         if (rows.Length > 0)
         {
             DataRow row = rows[0];
             this.Table.Rows.Remove(row);
             this.Table.AcceptChanges();
             this.SaveDataToXml();
         }
    }

    /// <summary>
    /// 修改数据后 写入XML文档 覆盖原有数据的私有方法
    /// </summary>
    private void SaveDataToXml()
    {
        this.ds.WriteXml(this.XmlPath,XmlWriteMode.IgnoreSchema);
    }

    #endregion
}
