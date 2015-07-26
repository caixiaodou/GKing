using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;


/// <summary>
/// 提供对前台自动完成功能服务端支持的Web服务类
/// </summary>
[System.Web.Script.Services.ScriptService]
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class AutoComplete : System.Web.Services.WebService {

    public AutoComplete () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    /// <summary>
    /// 提供自动完成功能支持的Web服务方法
    /// </summary>
    /// <param name="prefixText">客户输入的查询字符串</param>
    /// <param name="count">自动完成显示的结果集条目数量</param>
    /// <returns>包含自动完成结果的字符串数组</returns>
    [WebMethod]
    public string[] GetAutoCompleteResult(string prefixText,int count) {
        DataAccess access = new DataAccess();
        //得到查询结果集中的DataTable
        DataTable table = access.AutoCompleteSelect(prefixText, count).Tables[0];

        //声明接收查询结果集结果的字符串数组
        string[] resultArr = new string[table.Rows.Count];
        for (int i = 0; i < table.Rows.Count;i++ )
        {
            DataRow row = table.Rows[i];
            //将结果集中的结果导入至字符串数组中
            resultArr.SetValue(row["MovieName"].ToString(),i);
        }

        return resultArr;
    }
    
}

