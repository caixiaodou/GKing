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
            //ҳ���״μ���ʱ���жϸ�λ�����Ƿ��Ѿ���������
            //�����÷�����ʾ�������
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
        string formartString = "{0}: 1��{1}����2��{2}����3��{3}����4��{4}����5��{5}��<br/>";

        result += string.Format(formartString, "���»�", rdo.Count("���»�", "1"), rdo.Count("���»�", "2"), rdo.Count("���»�", "3"), rdo.Count("���»�", "4"), rdo.Count("���»�", "5"));
        result += string.Format(formartString, "����", rdo.Count("����", "1"), rdo.Count("����", "2"), rdo.Count("����", "3"), rdo.Count("����", "4"), rdo.Count("����", "5"));
        result += string.Format(formartString, "��ѧ��", rdo.Count("��ѧ��", "1"), rdo.Count("��ѧ��", "2"), rdo.Count("��ѧ��", "3"), rdo.Count("��ѧ��", "4"), rdo.Count("��ѧ��", "5"));
        result += string.Format(formartString, "������", rdo.Count("������", "1"), rdo.Count("������", "2"), rdo.Count("������", "3"), rdo.Count("������", "4"), rdo.Count("������", "5"));
        result += string.Format(formartString, "�Ź���", rdo.Count("�Ź���", "1"), rdo.Count("�Ź���", "2"), rdo.Count("�Ź���", "3"), rdo.Count("�Ź���", "4"), rdo.Count("�Ź���", "5"));
        this.lblResult.Text = result;
    }

    /// <summary>
    /// �ı������Ǽ� ��ʹ��Session��¼��ǰ�û�����
    /// ��ֹ�û����������ɲ�����������
    /// </summary>
    /// <param name="rating">�û�������Rating�ؼ�</param>
    /// <param name="lbl">��ʾ���۽����Label�ؼ�</param>
    /// <param name="count">���۵��Ǽ�����  ���������</param>
    private void RatingChanged(AjaxControlToolkit.Rating rating,Label lbl,string count)
    {
        this.Session.Add(rating.ID,count);
        
        rating.ReadOnly = true;//�����û��Ѵ�����Rating�ؼ������ٴα��û�����
        lbl.Text = count;//��ʾ�û����������

        RatingDataOperator rdo = new RatingDataOperator();
        string popStarName = "";
        switch (rating.ID)
        { 
            case "rat1":
                popStarName = "���»�";
                break;
            case "rat2":
                popStarName = "����";
                break;
            case "rat3":
                popStarName = "��ѧ��";
                break;
            case "rat4":
                popStarName = "������";
                break;
            case "rat5":
                popStarName = "�Ź���";
                break;
        }
        rdo.Insert(popStarName,count);
    }

    /// <summary>
    /// �ж��û��Ƿ��Ѿ����������� ���û�����������ʾ������Ҳ����ٴ�����
    /// </summary>
    private void HaveRating(Rating  rating,Label lbl)
    {
        rating.CurrentRating = Convert.ToInt32(this.Session[rating.ID].ToString());
        lbl.Text = this.Session[rating.ID].ToString();
        rating.ReadOnly = true;//�û������ٴ�����
    }
}
