<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
    div
    {
        font-size:10pt;
        font-family:����;
        color:#124075;  
    }
    table
    {
        font-size:10pt;
        font-family:����;
        color:#124075;  
    }
    </style>
    <script type="text/javascript" language=javascript src="JavaScript/Register.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-image: url(skins/RegistFormBG.jpg);width:375px;height:362px; left: 0px; position: absolute; top: 0px;">
    <div style="left: 355px; position: absolute; top: 0px;cursor:pointer">
        <img src="skins/Close.gif" id="IMG1"  />
    </div>
    <div style="width:93px;height:311px; background-image: url(skins/RegistForm.jpg); left: 10px; position: absolute; top: 20px;cursor:pointer">
    </div>
    <div style="width:254px;height:28px; left: 112px; position: absolute; top: 24px;" id="DIV1">
        <table width=100% id="TABLE1">
                <caption>��ϸ����</caption> 
                <tr width=100% align=center valign=top>
                    <td width="28%">
                        �ǳ�
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtNickName" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                       <asp:RequiredFieldValidator runat=server ID="rfvNickName" ControlToValidate="txtNickName" ErrorMessage="�û�����������">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        ����
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtAge" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"  ></asp:TextBox>
                    </td>
                     <td width="12%">
                        <asp:CompareValidator runat=server ID="cmpAge" ControlToValidate="txtAge" ErrorMessage="����������" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        �Ա�
                    </td>
                    <td colspan=2>
                        <asp:RadioButton runat=server ID="rdbMan" Checked=true  GroupName="sex" /><img src="skins/boy.gif" />��
                         <asp:RadioButton runat=server ID="rdbFMan"   GroupName="sex" /><img src="skins/girl.gif" />Ů 
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        ����
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtPwd" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                        <asp:RequiredFieldValidator runat=server ID="rfvPwd" ControlToValidate="txtNickName" ErrorMessage="����">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%" style="height: 33px">
                        �ظ�����
                    </td>
                    <td width="60%" style="height: 33px">
                        <asp:TextBox ID="txtSecPwd" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%" style="height: 33px">
                       <asp:CompareValidator runat=server ID="cmpSecPwd" ControlToValidate="txtSecPwd" ErrorMessage="�����������һ��" ControlToCompare="txtPwd">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan=3 align=center style="font-size:8pt;font-family:����">
                        <input type=button onclick="chooseFace()" id="btnChooseFace" value="ѡ��ͷ��" />
                       <input type=hidden id="hidFaceId" runat="server" /> 
                    </td>
                </tr>    
            </table>
    </div>
    <div style="width:254px;height:66px; left: 111px; position: absolute; top: 253px;" id="Div10" >
                <table cellpadding=0 cellspacing=0 border=0 width=100%>
                    <tr>
                         <td width=28%  align=center>
                            ��ʵ����
                         </td>
                         <td width=72%>
                            <asp:TextBox ID="txtName" runat="server" Width="81%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                         </td>
                    </tr>
                   <tr>
                         <td width=28% align=center>
                            ����
                         </td>
                         <td width=72%>
                            <asp:DropDownList runat=server ID="ddlConstellation" Width="150px"></asp:DropDownList>
                         </td>
                    </tr>
                   <tr>
                         <td width=28% align=center>
                            Ѫ��
                         </td>
                         <td width=72%>
                            <asp:DropDownList runat=server ID="ddlBloodType" Width="149px"></asp:DropDownList>
                         </td>
                    </tr>
                    <tr align=center>
                        <td colspan=2>
                            <asp:ImageButton runat=server ID="btnRegister"   ImageUrl="skins/RegisterBtn.png" OnClick="btnRegister_Click" />
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <img  src="skins/Cancel.png" style="cursor:pointer" onclick="parent.divWebQQPanel.innerHTML=''"  />
                        </td> 
                    </tr>   
                </table>
            </div>
             <div style="width:200px;height:17px; left: 144px; position: absolute;top:343px;right:0px; background-color: #e7f2f8;" id="divLoginInfo" runat=server></div>    
        </div>
    </form>
</body>
</html>
