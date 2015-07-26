using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using AjaxControlToolkit;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        { 
            //页面首次加载时，判断各位明星是否已经存在评级
            //即调用方法显示评级结果
            if(this.Session[this.rat1.ID]!=null)
            {
                this.HaveRating(this.rat1, this.lbl1);
            }
            if (this.Session[this.rat2.ID] != null)
            {
                this.HaveRating(this.rat2, this.lbl2);
            }
            if (this.Session[this.rat3.ID] != null)
            {
                this.HaveRating(this.rat3, this.lbl3);
            }
            if (this.Session[this.rat4.ID] != null)
            {
                this.HaveRating(this.rat4, this.lbl4);
            }
            if (this.Session[this.rat5.ID] != null)
            {
                this.HaveRating(this.rat5, this.lbl5);
            }
        }
    }

    protected void rat1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        this.RatingChanged(this.rat1, this.lbl1, e.Value);
    }

    protected void rat2_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        this.RatingChanged(this.rat2, this.lbl2, e.Value);
    }

    protected void rat3_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        this.RatingChanged(this.rat3, this.lbl3, e.Value);
    }

    protected void rat4_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        this.RatingChanged(this.rat4, this.lbl4, e.Value);
    }

    protected void rat5_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        this.RatingChanged(this.rat5, this.lbl5, e.Value);
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        RatingDataOperator rdo = new RatingDataOperator();
        string result = string.Empty;
        string formartString = "{0}: 1星{1}个　2星{2}个　3星{3}个　4星{4}个　5星{5}个<br/>";

        result += string.Format(formartString, "刘德华", rdo.Count("刘德华", "1"), rdo.Count("刘德华", "2"), rdo.Count("刘德华", "3"), rdo.Count("刘德华", "4"), rdo.Count("刘德华", "5"));
        result += string.Format(formartString, "黎明", rdo.Count("黎明", "1"), rdo.Count("黎明", "2"), rdo.Count("黎明", "3"), rdo.Count("黎明", "4"), rdo.Count("黎明", "5"));
        result += string.Format(formartString, "张学友", rdo.Count("张学友", "1"), rdo.Count("张学友", "2"), rdo.Count("张学友", "3"), rdo.Count("张学友", "4"), rdo.Count("张学友", "5"));
        result += string.Format(formartString, "郭富城", rdo.Count("郭富城", "1"), rdo.Count("郭富城", "2"), rdo.Count("郭富城", "3"), rdo.Count("郭富城", "4"), rdo.Count("郭富城", "5"));
        result += string.Format(formartString, "张国荣", rdo.Count("张国荣", "1"), rdo.Count("张国荣", "2"), rdo.Count("张国荣", "3"), rdo.Count("张国荣", "4"), rdo.Count("张国荣", "5"));
        this.lblResult.Text = result;
    }

    /// <summary>
    /// 改变评价星级 并使用Session记录当前用户评价
    /// 防止用户多次评价造成不公正的评级
    /// </summary>
    /// <param name="rating">用户触发的Rating控件</param>
    /// <param name="lbl">显示评价结果的Label控件</param>
    /// <param name="count">评价的星级个数  即评级结果</param>
    private void RatingChanged(AjaxControlToolkit.Rating rating,Label lbl,string count)
    {
        this.Session.Add(rating.ID,count);
        
        rating.ReadOnly = true;//设置用户已触发的Rating控件不能再次被用户评级
        lbl.Text = count;//显示用户的评级结果

        RatingDataOperator rdo = new RatingDataOperator();
        string popStarName = "";
        switch (rating.ID)
        { 
            case "rat1":
                popStarName = "刘德华";
                break;
            case "rat2":
                popStarName = "黎明";
                break;
            case "rat3":
                popStarName = "张学友";
                break;
            case "rat4":
                popStarName = "郭富城";
                break;
            case "rat5":
                popStarName = "张国荣";
                break;
        }
        rdo.Insert(popStarName,count);
    }

    /// <summary>
    /// 判断用户是否已经进行了评级 若用户已评级则显示结果，且不能再次评级
    /// </summary>
    private void HaveRating(Rating  rating,Label lbl)
    {
        rating.CurrentRating = Convert.ToInt32(this.Session[rating.ID].ToString());
        lbl.Text = this.Session[rating.ID].ToString();
        rating.ReadOnly = true;//用户不能再次评级
    }
}
