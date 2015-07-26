using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// HtmlTools 的摘要说明
/// </summary>
public static class HtmlTools
{

    /// <summary>
    /// 替换接收到的HTML代码中的格式字符 将格式字符替换为空字符
    /// </summary>
    /// <param name="str">需要替换格式字符的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelOption(string str)
    {
        return Regex.Replace(str, @"(\n)(\t)(\f)(\r)(\v)","");
    }



    /// <summary>
    /// 去除字符串中的锚标记
    /// </summary>
    /// <param name="str">需要去除锚标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelATag(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, "(<a[^>]+>)|(</a *>)", "");
        return str;
    }

    /// <summary>
    /// 去除字符串中的<Link>标记
    /// </summary>
    /// <param name="str">需要去除<Link>标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelLink(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, "(<link[^>]+>)|(</link *>)","", RegexOptions.IgnoreCase);
        return str;
    }

    /// <summary>
    /// 清除Meta标记
    /// </summary>
    /// <param name="str">需要去除标记的字符串</param>
    /// <returns>去除Meta标记后的字符串</returns>
    public static string DelMetaTag(string str)
    {
        return Regex.Replace(str, "(<meta[^>]+>)|(</meta *>)", "", RegexOptions.IgnoreCase);
    }

    /// <summary>
    /// 清除Img标记
    /// </summary>
    /// <param name="str">需要去除标记的字符串</param>
    /// <returns>去除Img标记后的字符串</returns>
    public static string DelImgTag(string str)
    {
        return Regex.Replace(str, "(<Img[^>]+>)|(</Img *>)", "", RegexOptions.IgnoreCase);
    }

    /// <summary>
    /// 清除Input标记
    /// </summary>
    /// <param name="str">需要去除标记的字符串</param>
    /// <returns>去除Input标记后的字符串</returns>
    public static string DelInputTag(string str)
    {
        return Regex.Replace(str, "(<Input[^>]+>)|(</Input *>)", "", RegexOptions.IgnoreCase);
    }

    /// <summary>
    /// 去除字符串中的<Script>标记
    /// </summary>
    /// <param name="str">需要去除<Script>标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelScript(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, "(<Script[^>]+>)[*]+(</Script *>)", "", RegexOptions.IgnoreCase);
        return str;
    }

    /// <summary>
    /// 去除字符串的<br>标记
    /// </summary>
    /// <param name="str">需要去除<br>标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelBr(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, "(<br>)", "", RegexOptions.IgnoreCase);
        return str;
    }

    /// <summary>
    /// 去除字符串中的<Span>标记
    /// </summary>
    /// <param name="str">需要去除<Span>标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelSpan(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, string.Format(@"<({0})[^>]*>(.*?)<\/\1>", "span"), "", RegexOptions.IgnoreCase);
        return str;
    }

    /// <summary>
    /// 去除字符串中的<Style>标记
    /// </summary>
    /// <param name="str">需要去除<Style>标记的字符串</param>
    /// <returns>处理好的字符串</returns>
    public static string DelStyle(string str)
    {
        if (str != null && str.Trim() != "")
            return Regex.Replace(str, "(<Style[^>]+>)|(</Style *>)", "", RegexOptions.IgnoreCase);
        return str;
    }


    /// <summary>
    /// 清除字符串中特定的标记
    /// </summary>
    /// <param name="str">需要去除标记的字符串</param>
    /// <param name="tagName">标记前缀</param>
    /// <returns>去除标记后的字符串</returns>
    public static string DelTag(string str,string tagName)
    { 
        if(tagName.Equals(""))//如果没有需要清除的标记就立即返回
        {
            return str;
        }

        return Regex.Replace(str, string.Format(@"<({0})[^>]*>(.*?)<\/\1>", tagName), "", RegexOptions.IgnoreCase);
    }
}
