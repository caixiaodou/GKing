﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Random : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.GraphicImg();   
    }

    /// <summary>
    /// 将随机数字生成图片 并写入回应流中
    /// </summary>
    private void GraphicImg()
    {
        this.Response.ContentType = "image/png";//设定响应方式
        this.Response.ClearContent();//清空缓存区
        Bitmap map = new Bitmap(80, 20);//声明位图
        Graphics g = Graphics.FromImage(map);//实例化Graphics
        g.Clear(Color.White);//设定背景色
        string code = this.GetRandmeNum().ToString();
        HttpContext.Current.Application["Code"] = code;
        g.DrawString(code, new Font("Arial Black", 12), new SolidBrush(Color.Red), 0, 0);
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        map.Save(ms,ImageFormat.Jpeg);
        g.Dispose();
        map.Dispose();
        this.Response.BinaryWrite(ms.ToArray());
        this.Response.End(); 
    }

    /// <summary>
    /// 获取5位随机数字
    /// </summary>
    /// <returns>随机数字</returns>
    public int GetRandmeNum()
    {
        System.Random ran = new System.Random();

        return ran.Next(10001, 99999);
    }

    /// <summary>
    /// 高斯密钥 获取 伪随机数种子
    /// 从而确保伪随机数的随机性
    /// </summary>
    /// <returns></returns>
    private int GetSeed()
    {
        byte[] bytes = new byte[4];
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        rng.GetBytes(bytes);

        return BitConverter.ToInt32(bytes, 0);
    }

}
