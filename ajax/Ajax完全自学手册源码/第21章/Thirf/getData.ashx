<%@ WebHandler Language="C#" Class="getData" %>

using System;
using System.Web;
using System.Xml;

public class getData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        
        if(context.Request.InputStream!=null)
        {
            System.IO.Stream stream=context.Request.InputStream;
            System.IO.BinaryReader reader=new System.IO.BinaryReader(stream,System.Text.Encoding.UTF8);
            byte[] bytes = reader.ReadBytes(Convert.ToInt32(stream.Length));
            string xml = context.Server.UrlDecode(System.Text.Encoding.Default.GetString(bytes));

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xml); 
            doc.Save(@"data.xml");
            
            System.Data.DataSet ds = new System.Data.DataSet();
            ds.ReadXml(@"data.xml");  
            ds.WriteXml(@"e:\1.xml");   
         } 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}