using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;
using System.Text;

/// <summary>
/// Thirf 的摘要说明
/// </summary>
public class Thirf
{
	public Thirf()
	{
		
	}

    /// <summary>
    /// 以Post方式请求ＵＲＬ　并获取特定的网页数据
    /// </summary>
    /// <param name="web">请求的URL</param>
    /// <returns>返回特定网页数据并转化为字符串</returns>
    public static string Post(string web)
    {
        string str = "";

        try
        {
            //创建Request对象
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(web);
            Stream stream = new MemoryStream();
            StreamWriter writer = new StreamWriter(stream, Encoding.Default);
            //不写入任何请求参数
            writer.Write("");
            writer.Flush();
            long len = stream.Length;
            writer.Close();

            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = len;
            request.Method = "POST";

            ///获取请求流
            Stream newStream = request.GetRequestStream();
            //或去Response对象
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //获取响应流
            Stream responseStream = response.GetResponseStream();
            //读取响应流
            StreamReader reader = new StreamReader(responseStream, Encoding.Default);
           //转化为字符串
            str = reader.ReadToEnd();
            reader.Close();
            response.Close();
            return str;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public static string Post(string web, string postData)
    {
        string str = "";
        //Url中的符号替代为空格
        postData = postData.Replace(" ","%20");

        try
        {
            //根据特定URL建立请求
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(web);
            Stream stream = new MemoryStream();
            //以当前.NET FrameWork中的编码标准创建流写入对象
            StreamWriter writer = new StreamWriter(stream,Encoding.Default);

            //将请求参数写入缓冲流中
            writer.Write(postData);
            writer.Flush();
            //获取缓冲流的长度即请求参数的长度
            long len = stream.Length;
            writer.Close();

            //设定请求类型
            request.ContentType = "application/x-www-form-urlencoded";
            //设定请求参数长度
            request.ContentLength = len;
            request.Method = "POST";

            //获取请求流
            Stream newStream = request.GetRequestStream();
            // 以当前.NET FrameWork中的编码标准(当前系统环境)创建流写入对象
            writer = new StreamWriter(newStream,Encoding.Default);
            //写入请求参数
            writer.Write(postData);
            writer.Close();

            //获取响应对象
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //获取响应流
            Stream responseStream = response.GetResponseStream();
            //创建响应流读取对象
            StreamReader reader = new StreamReader(responseStream,Encoding.UTF8);
            //读取后的网页字节流 转换为字符串
            str = reader.ReadToEnd();
            reader.Close();
            response.Close();
            return str;
        }
        catch (Exception ex)
        {
            
            throw ex;
        }
    }

    /// <summary>
    /// 进行URL编码的方法
    /// </summary>
    /// <param name="url">需要进行编码的URL</param>
    /// <param name="en">编码方式</param>
    /// <returns>进行编码后的URL</returns>
    private static string UrlEncode(string url,Encoding en)
    {
        //将URL根据编码方式转化为字节数字
        byte[] bytes = en.GetBytes(url);
        StringBuilder builder = new StringBuilder();

        //循环遍历字节数组
        for (int i = 0; i < bytes.Length; i++)
        {
            //判断字符类型
            if (bytes[i] < 128)
            {
                builder.Append((char)bytes[i]);
            }
            else
            {
                builder.Append("%" + bytes[i++].ToString("x").PadLeft(2, '0'));
                builder.Append("%" + bytes[i].ToString("x").PadLeft(2, '0'));
            }
        }

        return builder.ToString();
    }

    /// <summary>
    /// 使用Get方式获取特定URL数据的方法
    /// </summary>
    /// <param name="url">请求Web URL</param>
    /// <param name="en">编码方式</param>
    /// <returns>网页数据转化为字符串</returns>
    public static string Get(string url,Encoding en)
    {
        string tempUrl = Thirf.UrlEncode(url,en);
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(tempUrl);
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();

        Stream stream = response.GetResponseStream();
        StreamReader reader = new StreamReader(stream,en);

        string result = reader.ReadToEnd();
        reader.Close();
        response.Close();

        return result;
    }

    /// <summary>
    /// 使用Get 请求获取网页数据  采用默认GB2312编码
    /// </summary>
    /// <param name="url">请求URL</param>
    /// <returns>网页数据转化为字符串返回</returns>
    public static string Get(string url)
    {
        Encoding en = Encoding.GetEncoding("gb2312");
        return Thirf.Get(Thirf.UrlEncode(url,en),en);
    }
}
